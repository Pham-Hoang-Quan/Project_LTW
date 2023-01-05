package vn.edu.hcmuaf.ttt.model;

import java.io.Serializable;

public class trans implements Serializable {

    private String id;
    private String name;
    private int qty;

    public trans(String id, String name, int qty) {

        this.id = id;
        this.name = name;
        this.qty = qty;
    }



    public String getId() {
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

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "trans{" +
                ", id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", qty=" + qty +
                '}';
    }
}
