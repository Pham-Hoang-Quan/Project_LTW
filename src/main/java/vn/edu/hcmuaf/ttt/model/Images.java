package vn.edu.hcmuaf.ttt.model;

public class Images {
    private String img_id;
    private String name_id;
    private String id_pro;
    private String status;
    private String link_img;

    public Images(String img_id, String name_id, String id_pro, String status, String link_img) {
        this.img_id = img_id;
        this.name_id = name_id;
        this. id_pro= id_pro;
        this.status = status;
        this.link_img = link_img;
    }

    public Images() {
    }

    public String getImg_id() {
        return img_id;
    }

    public void setImg_id(String img_id) {
        this.img_id = img_id;
    }

    public String getName_id() {
        return name_id;
    }

    public void setName_id(String name_id) {
        this.name_id = name_id;
    }

    public String getId_pro() {
        return id_pro;
    }

    public void setId_pro(String pro_id) {
        this.id_pro = pro_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLink_img() {
        return link_img;
    }

    public void setLink_img(String link_img) {
        this.link_img = link_img;
    }

    @Override
    public String toString() {
        return "Images{" +
                "img_id='" + img_id + '\'' +
                ", name_id='" + name_id + '\'' +
                ", pro_id='" + id_pro + '\'' +
                ", status='" + status + '\'' +
                ", link_img='" + link_img + '\'' +
                '}';
    }
}
