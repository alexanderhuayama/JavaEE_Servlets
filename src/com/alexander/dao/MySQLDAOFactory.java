package com.alexander.dao;

import com.alexander.interfaces.ProductDAO;

public class MySQLDAOFactory extends DAOFactory {

	@Override
	public ProductDAO getProductDAO() {
		return new MySQLProductDAO();
	}

}
