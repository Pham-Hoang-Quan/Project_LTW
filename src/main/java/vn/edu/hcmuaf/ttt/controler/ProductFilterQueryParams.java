package vn.edu.hcmuaf.ttt.controler;

import java.util.List;

public class ProductFilterQueryParams {
    private double maxPrice;
    private double minPrice;

    public double getMinPrice() {
        return minPrice;
    }

    public ProductFilterQueryParams(double maxPrice, double minPrice, int index, List<String> classifies) {
        this.maxPrice = maxPrice;
        this.minPrice = minPrice;
        this.index = index;
        this.classifies = classifies;
    }

    public int getIndex() {
        return (index -1) * 12;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    private int index;

    public List<String> getClassifies() {
        return classifies;
    }

    private List<String> classifies;

    public double getMaxPrice() {
        return maxPrice;
    }
}
