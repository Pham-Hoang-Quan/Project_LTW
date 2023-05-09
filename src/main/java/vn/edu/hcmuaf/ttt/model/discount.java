package vn.edu.hcmuaf.ttt.model;

import java.sql.Timestamp;

public class discount {
    private int id_dis;
    private String name;
    private String reduce;
    private int reducedPrice;
    private Timestamp created_at;
    private Timestamp expires_at;
    private int status;


    public discount(){

    }

    public discount(int id_dis, String name, String reduce, int reducedPrice, Timestamp created_at, Timestamp expires_at, int status) {
        this.id_dis = id_dis;
        this.name = name;
        this.reduce = reduce;
        this.reducedPrice = reducedPrice;
        this.created_at = created_at;
        this.expires_at = expires_at;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getReducedPrice() {
        return reducedPrice;
    }

    public void setReducedPrice(int reducedPrice) {
        this.reducedPrice = reducedPrice;
    }

    public int getId_dis() {
        return id_dis;
    }

    public void setId_dis(int id_dis) {
        this.id_dis = id_dis;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getReduce() {
        return reduce;
    }

    public void setReduce(String reduce) {
        this.reduce = reduce;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getExpires_at() {
        return expires_at;
    }

    public void setExpires_at(Timestamp expires_at) {
        this.expires_at = expires_at;
    }

    @Override
    public String toString() {
        return "discount{" +
                "id_dis=" + id_dis +
                ", name='" + name + '\'' +
                ", reduce='" + reduce + '\'' +
                ", reducedPrice=" + reducedPrice +
                ", created_at=" + created_at +
                ", expires_at=" + expires_at +
                ", status=" + status +
                '}';
    }
}
