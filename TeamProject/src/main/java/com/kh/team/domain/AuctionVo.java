package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionVo {
	private int p_no;
	private String seller;
	private String address;
	private String p_title;
	private String p_content;
	private String img;
	private int present_price;
	private int instant_price;
	private Timestamp register_date;
	private Timestamp sell_date;
	private Timestamp expiration_date;
	private String purchaser;
	private int sold_price;
	private String  sell_status;
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPresent_price() {
		return present_price;
	}
	public void setPresent_price(int present_price) {
		this.present_price = present_price;
	}
	public int getInstant_price() {
		return instant_price;
	}
	public void setInstant_price(int instant_price) {
		this.instant_price = instant_price;
	}
	public Timestamp getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Timestamp register_date) {
		this.register_date = register_date;
	}
	public Timestamp getSell_date() {
		return sell_date;
	}
	public void setSell_date(Timestamp sell_date) {
		this.sell_date = sell_date;
	}
	public Timestamp getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Timestamp expiration_date) {
		this.expiration_date = expiration_date;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public int getSold_price() {
		return sold_price;
	}
	public void setSold_price(int sold_price) {
		this.sold_price = sold_price;
	}
	public String getSell_status() {
		return sell_status;
	}
	public void setSell_status(String sell_status) {
		this.sell_status = sell_status;
	}
	@Override
	public String toString() {
		return "AuctionVo [p_no=" + p_no + ", seller=" + seller + ", address=" + address + ", p_title=" + p_title
				+ ", p_content=" + p_content + ", img=" + img + ", present_price=" + present_price + ", instant_price="
				+ instant_price + ", register_date=" + register_date + ", sell_date=" + sell_date + ", expiration_date="
				+ expiration_date + ", purchaser=" + purchaser + ", sold_price=" + sold_price + ", sell_status="
				+ sell_status + "]";
	}
}
