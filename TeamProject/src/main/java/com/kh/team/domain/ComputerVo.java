package com.kh.team.domain;

import java.sql.Timestamp;

public class ComputerVo {
	private int c_com_no;
	private String c_com_name;
	private String c_com_seller;
	private int c_com_price;
	private String c_com_cate_no;
	private String c_com_content;
	private String c_com_pic;
	private int p_no;
	private Timestamp c_com_regdate;
	public int getC_com_no() {
		return c_com_no;
	}
	public void setC_com_no(int c_com_no) {
		this.c_com_no = c_com_no;
	}
	public String getC_com_name() {
		return c_com_name;
	}
	public void setC_com_name(String c_com_name) {
		this.c_com_name = c_com_name;
	}
	public String getC_com_seller() {
		return c_com_seller;
	}
	public void setC_com_seller(String c_com_seller) {
		this.c_com_seller = c_com_seller;
	}
	public int getC_com_price() {
		return c_com_price;
	}
	public void setC_com_price(int c_com_price) {
		this.c_com_price = c_com_price;
	}
	public String getC_com_cate_no() {
		return c_com_cate_no;
	}
	public void setC_com_cate_no(String c_com_cate_no) {
		this.c_com_cate_no = c_com_cate_no;
	}
	public String getC_com_content() {
		return c_com_content;
	}
	public void setC_com_content(String c_com_content) {
		this.c_com_content = c_com_content;
	}
	public String getC_com_pic() {
		return c_com_pic;
	}
	public void setC_com_pic(String c_com_pic) {
		this.c_com_pic = c_com_pic;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public Timestamp getC_com_regdate() {
		return c_com_regdate;
	}
	public void setC_com_regdate(Timestamp c_com_regdate) {
		this.c_com_regdate = c_com_regdate;
	}
	@Override
	public String toString() {
		return "ComputerVo [c_com_no=" + c_com_no + ", c_com_name=" + c_com_name + ", c_com_seller=" + c_com_seller
				+ ", c_com_price=" + c_com_price + ", c_com_cate_no=" + c_com_cate_no + ", c_com_content="
				+ c_com_content + ", c_com_pic=" + c_com_pic + ", p_no=" + p_no + ", c_com_regdate=" + c_com_regdate
				+ "]";
	}
	
	
}
