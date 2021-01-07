package com.kh.team.domain;

import java.sql.Timestamp;

public class ComputerCommentVo {
	private int c_com_comment_no;
	private String c_com_comment_content;
	private String c_com_comment_writer;
	private Timestamp c_com_comment_regdate;
	
	public int getC_com_comment_no() {
		return c_com_comment_no;
	}
	public void setC_com_comment_no(int c_com_comment_no) {
		this.c_com_comment_no = c_com_comment_no;
	}
	public String getC_com_comment_content() {
		return c_com_comment_content;
	}
	public void setC_com_comment_content(String c_com_comment_content) {
		this.c_com_comment_content = c_com_comment_content;
	}
	public String getC_com_comment_writer() {
		return c_com_comment_writer;
	}
	public void setC_com_comment_writer(String c_com_comment_writer) {
		this.c_com_comment_writer = c_com_comment_writer;
	}
	public Timestamp getC_com_comment_regdate() {
		return c_com_comment_regdate;
	}
	public void setC_com_comment_regdate(Timestamp c_com_comment_regdate) {
		this.c_com_comment_regdate = c_com_comment_regdate;
	}
	@Override
	public String toString() {
		return "ComputerCommentVo [c_com_comment_no=" + c_com_comment_no + ", c_com_comment_content="
				+ c_com_comment_content + ", c_com_comment_writer=" + c_com_comment_writer + ", c_com_comment_regdate="
				+ c_com_comment_regdate + "]";
	}
	
	
	
}
