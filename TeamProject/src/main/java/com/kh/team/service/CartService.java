package com.kh.team.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.team.domain.CartVo;
import com.kh.team.domain.ProductVo;

public interface CartService {
	//회원 카트 리스트 가져오기
	public List<CartVo> cartList(String m_id) throws Exception;
	//전체 상품 리스트 가져오기(상품 이름 띄워야해서)
	public List<ProductVo> productList() throws Exception;
	//장바구니 넣기
	public void cartInput(CartVo cartVo) throws Exception;
	//장바구니안의 상품 삭제
	public void cartOutput(int cart_no) throws Exception;
	//장바구니 넣기 전 장바구니에 상품 있는지 확인
	public List<CartVo> searchCart(int p_no, String m_id) throws Exception;
}