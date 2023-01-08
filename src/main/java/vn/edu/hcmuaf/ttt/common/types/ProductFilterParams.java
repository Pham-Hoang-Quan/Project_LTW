package vn.edu.hcmuaf.ttt.common.types;

import vn.edu.hcmuaf.ttt.model.Category;

import java.util.List;
import java.util.stream.Collectors;

public class ProductFilterParams {
    private double maxPrice;
    private double minPrice;

    public double getMinPrice() {
        if (this.minPrice == 0) {
            this.minPrice = Double.MIN_VALUE;
        }
        return minPrice;
    }

    public ProductFilterParams(double maxPrice, double minPrice, int index, List<Category> classifies) {
        this.maxPrice = maxPrice;
        this.minPrice = minPrice;
        this.index = index;
        this.classifies = classifies;
    }

    public int getOffset() {
        return (index - 1) * 12;
    }

    public int getPageIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    private int index;

    public List<String> getClassifies() {
        if (this.classifies == null || this.classifies.size() == 0) {
            return null;
        }

        return classifies.stream().map(classify -> classify.getcName()).collect(Collectors.toList());
    }

    private List<Category> classifies;

    public double getMaxPrice() {
        if (this.maxPrice == 0) {
            this.maxPrice = Double.MAX_VALUE;
        }
        return maxPrice;
    }
}
