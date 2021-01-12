package com.kh.team.dao;

import com.kh.team.domain.CartVo;

public interface BuyComputerDao {
	//컴퓨터 제품 장바구니에 넣기
	public void putBasketCategory(CartVo cartVo) throws Exception;
	
}
