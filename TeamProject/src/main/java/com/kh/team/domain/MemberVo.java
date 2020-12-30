package com.kh.team.domain;

import java.sql.Timestamp;

public class MemberVo {
	private String m_id;
	private String m_pass;
	private String email;
	private int admin_check;
	private int m_selling;
	private String m_name;
	private String m_phonenumber;
	private int m_point;
	private String m_pic;
	private Timestamp m_regdate;
	private Timestamp m_selling_regdate;
	
	
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
	
	public int getAdmin_check() {
		return admin_check;
	}
	public void setAdmin_check(int admin_check) {
		this.admin_check = admin_check;
	}
	public int getM_selling() {
		return m_selling;
	}
	public void setM_selling(int m_selling) {
		this.m_selling = m_selling;
	}
	public Timestamp getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Timestamp m_regdate) {
		this.m_regdate = m_regdate;
	}
	public Timestamp getM_selling_regdate() {
		return m_selling_regdate;
	}
	public void setM_selling_regdate(Timestamp m_selling_regdate) {
		this.m_selling_regdate = m_selling_regdate;
	}
	@Override
	public String toString() {
		return "MemberVo [m_id=" + m_id + ", m_pass=" + m_pass + ", email=" + email + ", admin_check=" + admin_check
				+ ", m_selling=" + m_selling + ", m_name=" + m_name + ", m_phonenumber=" + m_phonenumber + ", m_point="
				+ m_point + ", m_pic=" + m_pic + ", m_regdate=" + m_regdate + ", m_selling_regdate=" + m_selling_regdate
				+ "]";
	}
	
}
