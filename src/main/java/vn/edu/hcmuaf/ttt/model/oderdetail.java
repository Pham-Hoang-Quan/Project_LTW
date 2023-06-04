package vn.edu.hcmuaf.ttt.model;

public class oderdetail {
    private int soHD;
    private int discountFee;
    private int transportFee;
    private int totalPrice;

    public oderdetail(){

    }

    public oderdetail(int soHD, int discountFee, int transportFee, int totalPrice) {
        this.soHD = soHD;
        this.discountFee = discountFee;
        this.transportFee = transportFee;
        this.totalPrice = totalPrice;
    }

    public int getSoHD() {
        return soHD;
    }

    public void setSoHD(int soHD) {
        this.soHD = soHD;
    }

    public int getDiscountFee() {
        return discountFee;
    }

    public void setDiscountFee(int discountFee) {
        this.discountFee = discountFee;
    }

    public int getTransportFee() {
        return transportFee;
    }

    public void setTransportFee(int transportFee) {
        this.transportFee = transportFee;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "oderdetail{" +
                "soHD=" + soHD +
                ", discountFee=" + discountFee +
                ", transportFee=" + transportFee +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
