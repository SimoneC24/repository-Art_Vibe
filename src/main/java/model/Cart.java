package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<OperaBean> products;
	
	public Cart() {
		products = new ArrayList<OperaBean>();
	}
	
	public void addProduct(OperaBean product) {
		products.add(product);
	}
	
	public void deleteProduct(OperaBean product) {
		for(OperaBean prod : products) {
			if(prod.getId() == product.getId()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<OperaBean> getProducts() {
		return  products;
	}
}
