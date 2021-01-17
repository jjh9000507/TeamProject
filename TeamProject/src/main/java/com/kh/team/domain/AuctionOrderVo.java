package com.kh.team.domain;

import java.sql.Timestamp;

public class AuctionOrderVo {
	private int order_id;
	private String seller;
	private String purchaser;
	private String order_name;
	private String phonenumber;
	private Timestamp order_date;
	private String imp_uid;
	private String merchant_uid;
	private int order_price;
	private String card_approval_number;
	private String purchase_confirm;
	private String order_msg;
	private String zip;
	private String road_address;
	private String jibun_address;
	private String detail_address;
	private int p_no;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getCard_approval_number() {
		return card_approval_number;
	}
	public void setCard_approval_number(String card_approval_number) {
		this.card_approval_number = card_approval_number;
	}
	public String getPurchase_confirm() {
		return purchase_confirm;
	}
	public void setPurchase_confirm(String purchase_confirm) {
		this.purchase_confirm = purchase_confirm;
	}
	public String getOrder_msg() {
		return order_msg;
	}
	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	public String getJibun_address() {
		return jibun_address;
	}
	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionOrderVo [order_id=" + order_id + ", seller=" + seller + ", purchaser=" + purchaser
				+ ", order_name=" + order_name + ", phonenumber=" + phonenumber + ", order_date=" + order_date
				+ ", imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", order_price=" + order_price
				+ ", card_approval_number=" + card_approval_number + ", purchase_confirm=" + purchase_confirm
				+ ", order_msg=" + order_msg + ", zip=" + zip + ", road_address=" + road_address + ", jibun_address="
				+ jibun_address + ", detail_address=" + detail_address + ", p_no=" + p_no + "]";
	}
}
