package com.safeDelivery.SafeDelibery.controller;

import com.safeDelivery.SafeDelibery.controller.utils.SendEmail;
import org.junit.jupiter.api.*;

import java.io.*;
import java.util.function.BooleanSupplier;

import static org.junit.jupiter.api.Assertions.*;

class SendEmailTest {
    @Test
    void testSendMessage() throws IOException {
        SendEmail sendEmail = new SendEmail("Javier","Paz", "lujapak@gmail.com");
        File file = new File("C:/Users/lujap/Documents/DocumentodU/Cuarto Ciclo/EX4_LJPAZ.pdf");
        InputStream inputStreamFile = new FileInputStream(file);
        boolean save =sendEmail.saveFile(null, null, null);
        boolean send = sendEmail.execute();
        boolean delete = sendEmail.deleteFile();
        Assertions.assertTrue(save && send && delete);
    }

    @Test
    void testSaveFile() throws IOException {
        SendEmail sendEmail= new SendEmail();
        File file = new File("C:/Users/lujap/Documents/DocumentodU/Cuarto Ciclo/EX4_LJPAZ.pdf");
        InputStream inputStreamFile = new FileInputStream(file);
        Assertions.assertTrue(sendEmail.saveFile(null, null, null));
    }

    @Test void  testDeleteFile() throws IOException{
        SendEmail sendEmail = new SendEmail();
        Assertions.assertTrue(sendEmail.deleteFile());
    }
}