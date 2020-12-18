package com.kh.team.domain;

public class MemberVo {
	private String m_id;
	private String m_pass;
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
	@Override
	public String toString() {
		return "MemberVo [m_id=" + m_id + ", m_pass=" + m_pass + "]";
	}
	
	
}
