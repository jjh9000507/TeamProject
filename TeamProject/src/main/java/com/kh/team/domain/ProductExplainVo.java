package com.kh.team.domain;

import java.sql.Timestamp;

public class ProductExplainVo {
	private int p_e_no;
	private String p_e_answer_status;
	private String p_e_inquiry_status;
	private String p_e_title;
	private String p_e_id;
	private Timestamp p_e_regdate;
	private String p_e_product;
	private String p_e_re;
	public int getP_e_no() {
		return p_e_no;
	}
	public void setP_e_no(int p_e_no) {
		this.p_e_no = p_e_no;
	}
	public String getP_e_answer_status() {
		return p_e_answer_status;
	}
	public void setP_e_answer_status(String p_e_answer_status) {
		this.p_e_answer_status = p_e_answer_status;
	}
	public String getP_e_inquiry_status() {
		return p_e_inquiry_status;
	}
	public void setP_e_inquiry_status(String p_e_inquiry_status) {
		this.p_e_inquiry_status = p_e_inquiry_status;
	}
	public String getP_e_title() {
		return p_e_title;
	}
	public void setP_e_title(String p_e_title) {
		this.p_e_title = p_e_title;
	}
	public String getP_e_id() {
		return p_e_id;
	}
	public void setP_e_id(String p_e_id) {
		this.p_e_id = p_e_id;
	}
	public Timestamp getP_e_regdate() {
		return p_e_regdate;
	}
	public void setP_e_regdate(Timestamp p_e_regdate) {
		this.p_e_regdate = p_e_regdate;
	}
	public String getP_e_product() {
		return p_e_product;
	}
	public void setP_e_product(String p_e_product) {
		this.p_e_product = p_e_product;
	}
	public String getP_e_re() {
		return p_e_re;
	}
	public void setP_e_re(String p_e_re) {
		this.p_e_re = p_e_re;
	}
	@Override
	public String toString() {
		return "ProductExplainVo [p_e_no=" + p_e_no + ", p_e_answer_status=" + p_e_answer_status
				+ ", p_e_inquiry_status=" + p_e_inquiry_status + ", p_e_title=" + p_e_title + ", p_e_id=" + p_e_id
				+ ", p_e_regdate=" + p_e_regdate + ", p_e_product=" + p_e_product + ", p_e_re=" + p_e_re + "]";
	}
	
	
}
