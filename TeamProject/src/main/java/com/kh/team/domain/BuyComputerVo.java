package com.kh.team.domain;

public class BuyComputerVo {
	
	private int price;
	private String seller;
	private int productNum;
	private String productName;
	private String sendMethod;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSendMethod() {
		return sendMethod;
	}
	public void setSendMethod(String sendMethod) {
		this.sendMethod = sendMethod;
	}
	@Override
	public String toString() {
		return "BuyComputerVo [price=" + price + ", seller=" + seller + ", productNum=" + productNum + ", productName="
				+ productName + ", sendMethod=" + sendMethod + "]";
	}
	
	
}
