package vn.edu.hcmuaf.ttt.properties;

import vn.edu.hcmuaf.ttt.db.DBPropties;

import java.io.IOException;
import java.util.Properties;

public class MailProperties {
    private  static final Properties prop = new Properties();


    static {
        try{
            prop.load(DBPropties.class.getClassLoader().getResourceAsStream("mail.properties"));

        }catch (IOException ioException){
            ioException.printStackTrace();
        }


    }
    public static Properties getSMTPPro(){
        Properties pro = new Properties();
        pro.put("mail.smtp.host", getMailHost());
        pro.put("mail.smtp.port", getMailPort());
        pro.put("mail.smtp.auth", getMailAuth());
        pro.put("mail.smtp.starttls.enable", getMailStarttls());
        return pro;


    }

    public static String getMailHost(){
        return prop.get("mail.smtp.host").toString();
    }
    public static String getMailPort(){
        return prop.get("mail.smtp.port").toString();
    }
    public static String getMailAuth(){
        return prop.get("mail.smtp.auth").toString();
    }
    public static String getMailStarttls(){
        return prop.get("mail.smtp.starttls.enable").toString();
    }
    public static String getMailUsername(){
        return prop.get("mail.username").toString();
    }
    public static String getMailPassword(){
        return prop.get("mail.password").toString();
    }
    public static String getMailFrom(){
        return prop.get("mail.from").toString();
    }
    public static String getMailName(){
        return prop.get("mail.name").toString();
    }

}
