package vn.edu.hcmuaf.ttt.admin.model;

import java.util.Date;

public class Slider {
    private String img;
    private String name;
    private Date created;

    public Slider(String img, String name, Date created) {
        this.img = img;
        this.name = name;
        this.created = created;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}
