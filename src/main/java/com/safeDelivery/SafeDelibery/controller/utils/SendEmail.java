package com.safeDelivery.SafeDelibery.controller.utils;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.TemplateSpec;
import org.thymeleaf.context.Context;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Arrays;
import java.util.Properties;

public class SendEmail {
    private Properties properties = System.getProperties();
    private String pathActual = "";
    private String nombreActual = "";
    private Address address[];
    private String nombre = "";
    private String apellido = "";
    private String email = "";

    public SendEmail() {
    }

    public SendEmail(String nombre, String apellido, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }

    /*Metodos privados*/
    private void setProperties() {
        properties.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
        properties.put("mail.smtp.user", REMITENTE);
        properties.put("mail.smtp.clave", CLAVE);    //La clave de la cuenta
        properties.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
        properties.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
        properties.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google

    }

    private void addAttach(Multipart multipart) {
        try {
            File file = new File(this.pathActual + nombreActual);
            InputStream fileSend = new FileInputStream(file);
            DataSource source = new ByteArrayDataSource(fileSend, "application/pdf");
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(file.getName());
            multipart.addBodyPart(messageBodyPart);
            fileSend.close();
        } catch (MessagingException e) {
            System.out.println(e.getCause());
        } catch (IOException i) {
            i.printStackTrace();
            System.out.println(i.getMessage());
        }
    }

    public String readHTML() {
        File file = new File(PATH_HTML);
        String linea;
        String html = "<!DOCTYPE html>\n" +
                "<html lang=\"en\" xmlns:th=\"http://www.thymeleaf.org\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>correo</title>\n" +
                "    <style>\n" +
                "\n" +
                "        .titulo {\n" +
                "            color: #1e80b6;\n" +
                "            padding-top: 20px;\n" +
                "            padding-bottom: 10px;\n" +
                "            padding-left: 20px;\n" +
                "            padding-right: 20px;\n" +
                "        }\n" +
                "\n" +
                "        .body{\n" +
                "            background-color: #ECECEC;\n" +
                "        }\n" +
                "\n" +
                "\n" +
                "        .div_contenido{\n" +
                "            color: #1e80b6;\n" +
                "            padding-top: 20px;\n" +
                "            padding-bottom: 10px;\n" +
                "            padding-left: 20px;\n" +
                "            padding-right: 20px;\n" +
                "            background-color: #ffffff !important;\n" +
                "        }\n" +
                "    </style>\n" +
                "\n" +
                "</head>\n" +
                "\n" +
                "<body class=\"body\">\n" +
                "\n" +
                "<div class=\"titulo\" > <h1>Información Curriculum</h1></div>\n" +
                "<hr>\n" +
                "<div class=\".div_contenido\" >Correo de remitente: " + this.email + "</div>\n" +
                "\n" +
                "<div class=\".div_contenido\" >Nombres de remitente: " + this.nombre + " </div>\n" +
                "\n" +
                "<div class=\".div_contenido\" >Apellidos de remitente: " + this.apellido + "</div>\n" +
                "\n" +
                "\n" +"" +
                "<div class=\".div_contenido\" >El mensaje a sido recivido con exito <br/> Responda a <a href=\"mailto:"+this.email+"?Subject=Respuesta%20de%20empleo\">" + this.email + "</a>"+
                "\n" +
                "</body>\n" +
                "</html>\n";

        return html;
    }

    /*Metodos publicos*/
    private boolean sendEmail() {
        Session session = Session.getDefaultInstance(properties);
        MimeMessage msg = new MimeMessage(session);
        TemplateEngine templateEngine = new TemplateEngine();

        try {

            Thread.sleep(3000);
            msg.setFrom(new InternetAddress(REMITENTE));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(DESTINATARIO));
            msg.setSubject("Peticion de empleo");
            BodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText("Informacion del solicitante");
            /*Email de plantilla*/
            /*///////////////////////// */
            messageBodyPart.setContent(readHTML(), "text/html");
            Multipart archive = new MimeMultipart();
            this.addAttach(archive);
            archive.addBodyPart(messageBodyPart);
            msg.setContent(archive);
            System.out.println(Arrays.toString(msg.getAllRecipients()));
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", REMITENTE, CLAVE);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            deleteFile();
            return true;
        } catch (MessagingException me) {
            me.printStackTrace();   //Si se produce un error
            System.out.println(me.getMessage());
            return false;
        } catch (InterruptedException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean saveFile(InputStream inputStream, String path, String fileName) {
        String applicationPath = path;
        System.out.println(applicationPath);
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
        // creates the save directory if it does not exists
        // new File(uploadFilePath + fileName);
        InputStream input = null;
        OutputStream out = null;
        try {
            input = inputStream;
            out = new FileOutputStream(new File(uploadFilePath + fileName));
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = input.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            pathActual = uploadFilePath;
            nombreActual = fileName;
            out.close();
            input.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteFile() {
        try {
            File file = new File(pathActual + this.nombreActual);
            this.pathActual = "";
            this.nombreActual = "";
            return file.delete();
        } catch (Exception e) {
            return false;
        }
    }

    public boolean execute() {
        this.setProperties();
        return this.sendEmail();
    }


    public static final String CLAVE = "gpuiqysalqvxhcjn";
    public static final String REMITENTE = "sendmessageinformation40@gmail.com";
    public static final String DESTINATARIO = "sfd@safedelivery.es";
    public static final String PATH = "src/main/resources/";
    public static final String PATH_HTML = "src/main/resources/template/curriculum.html";
    private static final String UPLOAD_DIR = "uploads";
}
