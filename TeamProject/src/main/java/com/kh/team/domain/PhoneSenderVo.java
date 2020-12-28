package com.kh.team.domain;

public class PhoneSenderVo {
	private String api_key = "NCSPZBDNMXWXI2FY";
	private String api_secret = "YSK6MRNJIZW71OJDRNCB5MNAAHGPIV1D";
	private String sender_phone_num = "01042327310";
	
	public String getApi_key() {
		return api_key;
	}
	public void setApi_key(String api_key) {
		this.api_key = api_key;
	}
	public String getApi_secret() {
		return api_secret;
	}
	public void setApi_secret(String api_secret) {
		this.api_secret = api_secret;
	}
	public String getSender_phone_num() {
		return sender_phone_num;
	}
	public void setSender_phone_num(String sender_phone_num) {
		this.sender_phone_num = sender_phone_num;
	}
	@Override
	public String toString() {
		return "PhoneSenderVo [api_key=" + api_key + ", api_secret=" + api_secret + ", sender_phone_num="
				+ sender_phone_num + "]";
	}
	
	
		
}
