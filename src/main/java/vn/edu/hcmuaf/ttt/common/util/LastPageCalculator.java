package vn.edu.hcmuaf.ttt.common.util;

import vn.edu.hcmuaf.ttt.common.types.ProductFilterParams;
import vn.edu.hcmuaf.ttt.service.ProductService;

public class LastPageCalculator {
    public static int getEndPage(ProductFilterParams params) {
        int count = ProductService.countTotalProducts(params);
        int endPage = count /12;
        if(count % 12 != 0){
            endPage++;
        }
        return endPage;
    }
}
