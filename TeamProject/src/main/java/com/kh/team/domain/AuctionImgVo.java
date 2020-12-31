package com.kh.team.domain;

public class AuctionImgVo {
	private int img_no;
	private String img;
	private String main_img;
	private int p_no;
	
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	@Override
	public String toString() {
		return "AuctionImgVo [img_no=" + img_no + ", img=" + img + ", main_img=" + main_img + ", p_no=" + p_no + "]";
	}
}
