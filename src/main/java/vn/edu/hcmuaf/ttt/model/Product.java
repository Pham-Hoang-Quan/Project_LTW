package vn.edu.hcmuaf.ttt.model;

import java.io.Serializable;

public class Product implements Serializable {
    private String id;
    private String name;
    private String img;
    private long price;
    private String classify;
    private String oldPrice;
    private int isNew;
    private String percent;
    private String img2;
    private String img3;
    private String img4;
    private int quantily;
    private String content;
    private String info;
//    private  String link_img;



    public Product(){

    }

    public Product(String id, String name, String img, long price, String classify, String oldPrice, int isNew, String percent, String img2, String img3, String img4, int quantily, String content, String info) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.price = price;
        this.classify = classify;
        this.oldPrice = oldPrice;
        this.isNew = isNew;
        this.percent = percent;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.quantily = quantily;
        this.content = content;
        this.info = info;
    }


    public String getId() {
        return id;
    }
    public String getKey(){
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public String getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(String oldPrice) {
        this.oldPrice = oldPrice;
    }

    public int getIsNew() {
        return isNew;
    }

    public void setIsNew(int isNew) {
        this.isNew = isNew;
    }

    public String getPercent() {
        return percent;
    }

    public void setPercent(String percent) {
        this.percent = percent;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public int getQuantily() {
        return quantily;
    }

    public void setQuantily(int quantily) {
        this.quantily = quantily;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", img='"  + '\'' +
                ", price=" + price +
                ", classify='" + classify + '\'' +
                ", oldPrice='" + oldPrice + '\'' +
                ", isNew=" + isNew +
                ", percent='" + percent + '\'' +
                ", img2='" + '\'' +
                ", img3='"  + '\'' +
                ", img4='"  + '\'' +
                ", quantily=" + quantily +
                ", content='" + content + '\'' +
                ", info='" + info + '\'' +
                ", img= '"+ '\'' +
                '}';
    }


}