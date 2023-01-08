package vn.edu.hcmuaf.ttt.Mail;


import vn.edu.hcmuaf.ttt.service.MailService;

import java.util.Map;

public class Mail {
    public static void main(String[] args) {
        MailService.sendMail("tn6994050@gmail.com", "Test", "Hello  ");
    }
}
