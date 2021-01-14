package com.kh.team.domain;

public class SendProductBoughtInfoVo {
	
	private String radioVal;
	private int memberOfTelephone;
	private String messageForDriver;	
	private int postcode;
	private String roadAddress;
	private String extraAddress;		
	private String detailAddress;
	private int p_no;
	private String m_id;
	private int todayValueYear;
	private int todayValueMonth;
	private int todayValueDate;
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
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
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
		return "SendProductBoughtInfoVo [radioVal=" + radioVal + ", memberOfTelephone=" + memberOfTelephone
				+ ", messageForDriver=" + messageForDriver + ", postcode=" + postcode + ", roadAddress=" + roadAddress
				+ ", extraAddress=" + extraAddress + ", detailAddress=" + detailAddress + ", p_no=" + p_no + ", m_id="
				+ m_id + ", todayValueYear=" + todayValueYear + ", todayValueMonth=" + todayValueMonth
				+ ", todayValueDate=" + todayValueDate + "]";
	}	
}
