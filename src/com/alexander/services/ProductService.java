package com.alexander.services;

import java.util.List;

import com.alexander.beans.ProductDTO;
import com.alexander.dao.DAOFactory;
import com.alexander.interfaces.ProductDAO;

public class ProductService {
	private static final int DATABASE = DAOFactory.MYSQL;

	DAOFactory factory = DAOFactory.getDAOFactory(DATABASE);
	ProductDAO dao = factory.getProductDAO();

	public List<ProductDTO> getProductsByStatus(int isEnable) {
		return dao.getProductsByStatus(isEnable);
	}

	public ProductDTO getProductById(int id) {
		return dao.getProductById(id);
	}

	public int registerProduct(ProductDTO prod) {
		return dao.registerProduct(prod);
	}

	public int updateProduct(ProductDTO prod) {
		return dao.updateProduct(prod);
	}

	public int changeStatusProduct(int id, int isEnable) {
		return dao.changeStatusProduct(id, isEnable);
	}
}
