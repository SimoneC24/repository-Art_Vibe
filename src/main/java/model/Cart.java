package model;

import java.util.HashMap;
import java.util.Iterator;

public class Cart{
    private HashMap<OperaBean, Integer> products;

    public Cart() {
        products = new HashMap<OperaBean, Integer>();
    }

    public void addProduct(OperaBean product, int quantity) {
        products.put(product, quantity);
    }

    public void updateProductQuantity(OperaBean product, int quantity) {
        if (quantity > 0) {
            products.put(product, quantity);
        } else {
            products.remove(product);
        }
    }

    public void incrementProductQuantity(OperaBean product, int amount) {
        int currentQuantity = products.getOrDefault(product, 0);
        products.put(product, currentQuantity + amount);
    }

    public void decrementProductQuantity(OperaBean product, int amount) {
        int currentQuantity = products.getOrDefault(product, 0) - amount;
        if (currentQuantity > 0) {
            products.put(product, currentQuantity);
        } else {
            products.remove(product);
        }
    }

    public void deleteProduct(OperaBean product) {
        products.remove(product);
    }
    
    public void clear() {
        products.clear(); // Rimuove tutti i prodotti dal carrello
    }

    public HashMap<OperaBean, Integer> getProducts() {
        return products;
    }
}
