package Reponsive.impl;

import Model.Product;
import Reponsive.IProductReponsitory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductReponsitoryImpl implements IProductReponsitory {
    private static Map<Integer, Product> productMap;
static {
    productMap = new HashMap<>();
    productMap.put(1,new Product(1,"tivi",2000000.0,"Viet Nam","2 nam"));
    productMap.put(2,new Product(2,"tủ lạnh",800000.0,"Nhật Bản","3 nam"));
    productMap.put(3,new Product(3,"Máy giặt",750000.0,"Nhật Bản","1 nam"));
    productMap.put(4,new Product(4,"Tủ",370000.0,"Thái Lan","1 nam"));

}

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
productMap.put(product.getIdProduct(),product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
productMap.put(id,product);
    }

    @Override
    public void remove(int id) {
productMap.remove(id);
    }
}
