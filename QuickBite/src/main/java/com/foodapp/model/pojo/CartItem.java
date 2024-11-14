package com.foodapp.model.pojo;

public class CartItem {
	private int itemId;
	private int resturantId;
	private String name;
	private int quantity;
	private double price;
	
	public CartItem() {
		super();
	}

	public CartItem(int resturantId, String name,int quantity, double price) {
		super();
		this.resturantId = resturantId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public CartItem(int itemId, int resturantId, String name, int quantity,  double price) {
		super();
		this.itemId = itemId;
		this.resturantId = resturantId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getResturantId() {
		return resturantId;
	}

	public void setResturantId(int resturantId) {
		this.resturantId = resturantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartItem [itemId=" + itemId + ", resturantId=" + resturantId + ", name=" + name + ", price=" + price
				+ "]";
	}
	
	
}
