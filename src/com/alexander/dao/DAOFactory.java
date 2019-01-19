package com.alexander.dao;

import com.alexander.interfaces.ProductDAO;

public abstract class DAOFactory {
	// Constantes para el acceso de datos
	public static final int MYSQL = 1;
	public static final int SQL_SERVER = 2;
	public static final int ORACLE = 3;
	
	// Indicando los DAO  (interfaces) a implementar
	public abstract ProductDAO getProductDAO();
	
	// Obteniendo un origen de datos
	public static DAOFactory getDAOFactory(int database) {
		switch (database) {
		case MYSQL: return new MySQLDAOFactory();
		default:
			return null;
		}
	}
}
