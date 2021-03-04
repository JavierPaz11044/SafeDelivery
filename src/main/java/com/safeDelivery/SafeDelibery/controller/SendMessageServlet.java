package com.safeDelivery.SafeDelibery.controller;

import com.safeDelivery.SafeDelibery.controller.utils.SendEmail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Enumeration;

@MultipartConfig
@WebServlet(name = "SendMessageServlet", value = "/home/send")
public class SendMessageServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Enumeration<String> names= request.getParameterNames();
        while (names.hasMoreElements()){
            System.out.println(names.nextElement());
        }
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        Part filePart = request.getPart("archivo"); // Retrieves <input type="file" name="file">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        System.out.println(fileName);
        send(nombre,apellido,email,filePart,fileName, request);
    }


    public void send(String nombre, String apellido, String email, Part part , String fileName, HttpServletRequest request){
        SendEmail sendEmail = new SendEmail(nombre,apellido,email);
        try {
            Thread sendMEssageSecondPLane = new Thread(new Runnable() {
                @Override
                public void run() {
                    sendEmail.saveFile(part, request, fileName);
                    sendEmail.execute();
                    sendEmail.deleteFile();
                }
            });
            sendMEssageSecondPLane.start();
            return;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return;
        }
    }
}
