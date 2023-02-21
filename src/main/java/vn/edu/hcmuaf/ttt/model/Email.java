package vn.edu.hcmuaf.ttt.model;

public class Email {
    private String from, to, fromPasswork, content, subject;

    public Email() {
        this.from = from;
        this.to = to;
        this.fromPasswork = fromPasswork;
        this.content = content;
        this.subject = subject;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFromPasswork() {
        return fromPasswork;
    }

    public void setFromPasswork(String fromPasswork) {
        this.fromPasswork = fromPasswork;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
}
