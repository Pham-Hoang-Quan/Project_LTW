package vn.edu.hcmuaf.ttt.common.util;

import vn.edu.hcmuaf.ttt.common.types.ProductFilterParams;
import vn.edu.hcmuaf.ttt.model.Category;
import vn.edu.hcmuaf.ttt.service.CategoryService;

import java.util.List;

public class ProductQueryRetriever {
    private static ProductQueryRetriever instance;

    public static ProductQueryRetriever getInstance() {
        if (instance == null) {
            instance = new ProductQueryRetriever();

        }
        return instance;
    }

    public static ProductFilterParams getProductFilterParams(String minPriceQuery, String maxPriceQuery, String[] categories, String pageIndex) {
        if (pageIndex == null) {
            pageIndex = "1";
        }
        int index = Integer.parseInt(pageIndex);

        PriceRange priceRange = extracted(minPriceQuery, maxPriceQuery);

        List<Category> classifies = CategoryService.getCategoriesBasedOnId(categories);
        return new ProductFilterParams(priceRange.getMaxPrice(), priceRange.getMinPrice(), index, classifies);
    }

    private static PriceRange extracted(String minPriceQuery, String maxPriceQuery) {
        double minPrice;
        double maxPrice;
        try {
            minPrice = Double.parseDouble(minPriceQuery);
            maxPrice = Double.parseDouble(maxPriceQuery);
        } catch (NullPointerException e) {
            minPrice = 0;
            maxPrice = 0;
        }

        return new PriceRange(minPrice, maxPrice);
    }

    private static class PriceRange {
        public double getMinPrice() {
            return minPrice;
        }

        public double getMaxPrice() {
            return maxPrice;
        }

        private double minPrice;

        private double maxPrice;

        public PriceRange(double minPrice, double maxPrice) {
            this.minPrice = minPrice;
            this.maxPrice = maxPrice;
        }

    }
}
