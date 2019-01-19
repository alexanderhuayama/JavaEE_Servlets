package com.alexander.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alexander.beans.ProductDTO;
import com.alexander.interfaces.ProductDAO;
import com.alexander.utils.MySQLConnection;

public class MySQLProductDAO implements ProductDAO {

	@Override
	public List<ProductDTO> getProductsByStatus(int isEnable) {
		List<ProductDTO> products = new ArrayList<ProductDTO>();
		ProductDTO prod = null;
		Connection cn = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		String sql = "call sp_products_by_status(?)";

		try {
			cn = MySQLConnection.getConnection();

			cs = cn.prepareCall(sql);
			cs.setInt(1, isEnable);

			rs = cs.executeQuery();

			while (rs.next()) {
				prod = new ProductDTO();
				prod.setId(rs.getInt("id"));
				prod.setDescription(rs.getString("description"));
				prod.setPrice(rs.getDouble("price"));
				prod.setStock(rs.getInt("stock"));
				prod.setRegisterDate(rs.getString("register_date"));
				prod.setUpdateDate(rs.getString("update_date"));
				prod.setImage(rs.getString("image"));
				prod.setIsEnable(rs.getByte("is_enable"));

				products.add(prod);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySQLConnection.closeConnection(rs, cs, cn);
		}

		return products;
	}

	@Override
	public ProductDTO getProductById(int id) {
		ProductDTO prod = null;
		Connection cn = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		String sql = "call sp_products_by_id(?)";

		try {
			cn = MySQLConnection.getConnection();
			cs = cn.prepareCall(sql);
			cs.setInt(1, id);

			rs = cs.executeQuery();

			if (rs.next()) {
				prod = new ProductDTO();
				prod.setId(rs.getInt("id"));
				prod.setDescription(rs.getString("description"));
				prod.setPrice(rs.getDouble("price"));
				prod.setStock(rs.getInt("stock"));
				prod.setRegisterDate(rs.getString("register_date"));
				prod.setUpdateDate(rs.getString("update_date"));
				prod.setImage(rs.getString("image"));
				prod.setIsEnable(rs.getInt("is_enable"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySQLConnection.closeConnection(rs, cs, cn);
		}

		return prod;
	}

	@Override
	public int registerProduct(ProductDTO prod) {
		int affectedRows = -1;
		Connection cn = null;
		CallableStatement cs = null;
		String sql = " call sp_register_products(?,?,?,?)";

		try {
			cn = MySQLConnection.getConnection();
			cs = cn.prepareCall(sql);
			cs.setString(1, prod.getDescription());
			cs.setDouble(2, prod.getPrice());
			cs.setInt(3, prod.getStock());
			cs.setString(4, prod.getImage());

			affectedRows = cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySQLConnection.closeConnection(null, cs, cn);
		}

		return affectedRows;
	}

	@Override
	public int updateProduct(ProductDTO prod) {
		int affectedRows = -1;
		Connection cn = null;
		CallableStatement cs = null;
		String sql = " call sp_update_product(?,?,?,?,?)";

		try {
			cn = MySQLConnection.getConnection();
			cs = cn.prepareCall(sql);
			cs.setInt(1, prod.getId());
			cs.setString(2, prod.getDescription());
			cs.setDouble(3, prod.getPrice());
			cs.setInt(4, prod.getStock());
			cs.setString(5, prod.getImage());

			affectedRows = cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySQLConnection.closeConnection(null, cs, cn);
		}

		return affectedRows;
	}

	@Override
	public int changeStatusProduct(int id, int isEnable) {
		int affectedRows = -1;
		Connection cn = null;
		CallableStatement cs = null;
		String sql = "call sp_change_status_product(?,?)";
		
		try {
			cn = MySQLConnection.getConnection();
			cs = cn.prepareCall(sql);
			cs.setInt(1, id);
			cs.setInt(2, isEnable);
			
			affectedRows = cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MySQLConnection.closeConnection(null, cs, cn);
		}
		
		return affectedRows;
	}

}
