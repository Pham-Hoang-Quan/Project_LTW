package vn.edu.hcmuaf.ttt.controler;

import vn.edu.hcmuaf.ttt.model.Category;

import java.util.List;
import java.util.stream.Collectors;

public class ProductFilterQuery {
    private double maxPrice;
    private double minPrice;

    public double getMinPrice() {
        if (this.minPrice == 0) {
            this.minPrice = Double.MIN_VALUE;
        }
        return minPrice;
    }

    public ProductFilterQuery(double maxPrice, double minPrice, int index, List<String> classifies) {
        this.maxPrice = maxPrice;
        this.minPrice = minPrice;
        this.index = index;
        this.classifies = classifies;
    }

    public int getIndex() {
        return (index - 1) * 12;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    private int index;

    public List<String> getClassifies() {
        return this.classifies;
    }

    private List<String> classifies;

    public double getMaxPrice() {
        if (this.maxPrice == 0) {
            this.maxPrice = Double.MAX_VALUE;
        }
        return maxPrice;
    }
}
