package vn.edu.hcmuaf.ttt.service;

import vn.edu.hcmuaf.ttt.db.JDBiConnector;
import vn.edu.hcmuaf.ttt.model.Category;

import java.util.List;
import java.util.stream.Collectors;

public class CategoryService {
    private static CategoryService instance;

    private CategoryService(){

    }

    public static CategoryService getInstance(){
        if(instance == null){
            instance = new CategoryService();

        }
        return instance;
    }

    public static List<Category> getCategoriesBasedOnId(String[] cids) {
        if (cids == null || cids.length == 0) {
            return null;
        }

        List<Category> categories = JDBiConnector.me().withHandle(handle -> handle.createQuery(
                        "SELECT * FROM category WHERE cid IN (<cids>)"
                )
                .bindList("cids", cids)
                .mapToBean(Category.class)
                .stream()
                .collect(Collectors.toList()));

        return categories;
    }
}
