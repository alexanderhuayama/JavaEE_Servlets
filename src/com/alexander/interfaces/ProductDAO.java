package com.alexander.interfaces;

import java.util.List;

import com.alexander.beans.ProductDTO;

public interface ProductDAO {
	// Obtiene la lista de productos por estado
	public List<ProductDTO> getProductsByStatus(int isEnable);

	// Obtiene un producto por id
	public ProductDTO getProductById(int id);

	// Registra un producto
	public int registerProduct(ProductDTO prod);

	// Actualiza un producto
	public int updateProduct(ProductDTO prod);

	// Habilita o deshabilita un producto
	public int changeStatusProduct(int id, int isEnable);
}
