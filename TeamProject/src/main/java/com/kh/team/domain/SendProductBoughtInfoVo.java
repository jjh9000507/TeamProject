package com.kh.team.domain;

public class SendProductBoughtInfoVo {
	private int price;
	private String seller;
	private int productNum;
	private String productName;
	private String sendMethod;
	private int p_no;
	private String radioVal;
	private int memberOfTelephone;
	private String messageForDriver;	
	private int postcode;
	private String roadAddress;
	private String extraAddress;		
	private String detailAddress;
	private String m_id;
	private int todayValueYear;
	private int todayValueMonth;
	private int todayValueDate;
	
	
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
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getRadioVal() {
		return radioVal;
	}
	public void setRadioVal(String radioVal) {
		this.radioVal = radioVal;
	}
	public int getMemberOfTelephone() {
		return memberOfTelephone;
	}
	public void setMemberOfTelephone(int memberOfTelephone) {
		this.memberOfTelephone = memberOfTelephone;
	}
	public String getMessageForDriver() {
		return messageForDriver;
	}
	public void setMessageForDriver(String messageForDriver) {
		this.messageForDriver = messageForDriver;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getTodayValueYear() {
		return todayValueYear;
	}
	public void setTodayValueYear(int todayValueYear) {
		this.todayValueYear = todayValueYear;
	}
	public int getTodayValueMonth() {
		return todayValueMonth;
	}
	public void setTodayValueMonth(int todayValueMonth) {
		this.todayValueMonth = todayValueMonth;
	}
	public int getTodayValueDate() {
		return todayValueDate;
	}
	public void setTodayValueDate(int todayValueDate) {
		this.todayValueDate = todayValueDate;
	}
	@Override
	public String toString() {
		return "SendProductBoughtInfoVo [price=" + price + ", seller=" + seller + ", productNum=" + productNum
				+ ", productName=" + productName + ", sendMethod=" + sendMethod + ", p_no=" + p_no + ", radioVal="
				+ radioVal + ", memberOfTelephone=" + memberOfTelephone + ", messageForDriver=" + messageForDriver
				+ ", postcode=" + postcode + ", roadAddress=" + roadAddress + ", extraAddress=" + extraAddress
				+ ", detailAddress=" + detailAddress + ", m_id=" + m_id + ", todayValueYear=" + todayValueYear
				+ ", todayValueMonth=" + todayValueMonth + ", todayValueDate=" + todayValueDate + "]";
	}	
	
}
