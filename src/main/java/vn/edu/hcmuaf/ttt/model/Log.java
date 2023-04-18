package vn.edu.hcmuaf.ttt.model;

import java.util.Date;

public class Log {
    private String id;
    private int level;
    private String user;
    private String src;
    private String content ;
    private Date create;
    private String status;

    public Log() {
    }

    public Log(String id, int level, String user, String src, String content, Date create, String status) {
        this.id = id;
        this.level = level;
        this.user = user;
        this.src = src;
        this.content = content;
        this.create = create;
        this.status = status;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id='" + id + '\'' +
                ", level='" + level + '\'' +
                ", user='" + user + '\'' +
                ", content='" + content + '\'' +
                ", create='" + create + '\'' +
                '}';
    }
}
