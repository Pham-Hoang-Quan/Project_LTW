package vn.edu.hcmuaf.ttt.common.types;

import java.util.List;

public class ProductFilterQuery {
    private double maxPrice;
    private double minPrice;

    private int pageIndex;

    public double getMinPrice() {
        if (this.minPrice == 0) {
            this.minPrice = Double.MIN_VALUE;
        }
        return minPrice;
    }

    public ProductFilterQuery(double maxPrice, double minPrice, int pageIndex, List<String> classifies) {
        this.maxPrice = maxPrice;
        this.minPrice = minPrice;
        this.pageIndex = pageIndex;
        this.classifies = classifies;
    }

    public int getOffset() {
        return (pageIndex - 1) * 12;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    private int offset;

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
