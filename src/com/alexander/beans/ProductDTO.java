package com.alexander.beans;

public class ProductDTO {
	private int id;
	private String description;
	private double price;
	private int stock;
	private String registerDate;
	private String updateDate;
	private String image;
	private int isEnable;

	public ProductDTO() {
	}

	public ProductDTO(int id, String description, double price, int stock, String registerDate, String updateDate,
			String image, int isEnable) {
		this.id = id;
		this.description = description;
		this.price = price;
		this.stock = stock;
		this.registerDate = registerDate;
		this.updateDate = updateDate;
		this.image = image;
		this.isEnable = isEnable;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(int isEnable) {
		this.isEnable = isEnable;
	}

}
