package com.kh.team.service;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;

public interface BuyComputerService {
	//컴퓨터 제품 장바구니에 넣기
	public void putBasketCategory(CartVo cartVo) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오는 기능
	public int getPurchasePercentage(BuyComputerVo buyComputerVo, int purchase_num_plus) throws Exception;
	
}
