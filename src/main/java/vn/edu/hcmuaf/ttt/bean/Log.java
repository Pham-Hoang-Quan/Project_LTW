package vn.edu.hcmuaf.ttt.bean;

import org.jdbi.v3.core.Jdbi;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Log extends AbBean  implements Serializable {
    int id;
    int level;
    String scr;

    int user_id;
    String content;
    Date creatAt;
    int status;

    static Map<Integer, String> levelMapping = new HashMap<>();
    static {
        levelMapping.put(0,"INFO");
        levelMapping.put(1,"ALERT");
        levelMapping.put(2,"WARNING");
        levelMapping.put(3,"DANGER");

    }
   public static int INFO =0;
    public static int ALERT =1;
    public static int WARNING =2;
    public static int DANGER =3;


    public Log() {

    }

    public Log(int level,int user_id, String scr, String content, Date creatAt, int status) {

        this.level = level;
        this.scr = scr;
        this.user_id = user_id;
        this.content = content;
        this.creatAt = creatAt;
        this.status = status;
    }
    public Log(int level,int user_id, String scr,  String content, int status) {

        this.level = level;
        this.scr = scr;
        this.user_id = user_id;
        this.content = content;

        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getLevelWithName() {

        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
    }
    public String getScr() {
        return scr;
    }

    public void setScr(String scr) {
        this.scr = scr;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(Date creatAt) {
        this.creatAt = creatAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public boolean insert(Jdbi db){
      Integer i =  db.withHandle(handle ->
                handle.execute("INSERT INTO log(`level`, `user`, `src`, `content`, `createAt`,`status`) VALUES (?,?,?,?, NOW(), ?)",
                        this.level, getUser_id()==-1?null:getUser_id(), this.scr, this.content, this.status)
        );
        return  i==1;
    }
}