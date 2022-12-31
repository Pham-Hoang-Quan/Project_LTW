package vn.edu.hcmuaf.ttt.model;

import vn.edu.hcmuaf.ttt.bean.User;
import vn.edu.hcmuaf.ttt.service.UserService;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Cart implements Serializable {
    HashMap<String, Product> data;
    User custemer;
    long total;
    int quantily;

    public Cart(){
        data = new HashMap<>();
        custemer = new User();
        total = 0;
        quantily = 0;

    }

    public Cart(User custemer, long total, int quantily) {
        data = new HashMap<>();
        this.custemer = custemer;
        this.total = total;
        this.quantily = quantily;
    }
    public void put(Product p){
        if(data.containsKey(p.getKey())){
            Product p1 = data.get(p.getKey());
                p1.setQuantily(p1.getQuantily() +1);
                data.put(p.getKey(),p1);
            }else{
            data.put(p.getKey(),p);

            }
        updateTotalMoneyAndQuantily();
        }
        public  void put(String key, int quantily){
        if(data.containsKey(key)){
            Product p1 = data.get(key);
            p1.setQuantily(quantily);
            data.put(key,p1);
        }
            updateTotalMoneyAndQuantily();
        }
      public void update(Product p){
        if(data.containsKey(p.getKey())){
            data.put(p.getKey(),p);
        }
        updateTotalMoneyAndQuantily();
}
        public Collection<Product> getListproduct(){
        return  data.values();

        }

        public  void remove(String key){

            data.remove(key);
            updateTotalMoneyAndQuantily();
        }

        public int getQuantily(){
        return quantily;
        }



    private void updateTotalMoneyAndQuantily() {
        total = 0;
        quantily =0;
        for (Product p : data.values()){
            total += p.getQuantily()*p.getPrice();
            quantily += p.getQuantily();
    }
}
}
