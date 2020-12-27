package com.kh.team.domain;

public class MemberVo {
	private String m_id;
	private String m_pass;
	private String email;
	private String m_name;
	private String m_phonenumber;
	private int m_point;
	private String m_pic;
	
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phonenumber() {
		return m_phonenumber;
	}
	public void setM_phonenumber(String m_phonenumber) {
		this.m_phonenumber = m_phonenumber;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	@Override
	public String toString() {
		return "MemberVo [m_id=" + m_id + ", m_pass=" + m_pass + ", email=" + email + ", m_name=" + m_name
				+ ", m_phonenumber=" + m_phonenumber + ", m_point=" + m_point + ", m_pic=" + m_pic + "]";
	}
	
	
	
}
