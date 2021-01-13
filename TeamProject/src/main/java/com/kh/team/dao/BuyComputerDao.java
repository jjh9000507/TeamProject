package com.kh.team.dao;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;

public interface BuyComputerDao {
	//컴퓨터 제품 장바구니에 넣기
	public void putBasketCategory(CartVo cartVo) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 제품명을 통해 pk값 구하기
	public int getPkForTakePurchasePercentage(BuyComputerVo buyComputerVo) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 구매수량을 해당 품목에 넣기
	public void pushNumForGetPurchasePercentage(int c_com_no) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 해당 품목의  기존 구매수량 업데이트
	public int updateNumForGetPurchasePercentage(int c_com_no, int purchase_num, int purchase_num_plus) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 해당 품목의  기존 구매수량 가져오기
	public int selectNumForGetPurchasePercentage(int c_com_no) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 구매수량 저장 테이블에 해당 품목 컬럼이 있는지 중복체크
	public int selectNumForCheck(int c_com_no) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 전체 구매수량 저장 테이블에 갯수 더하기
	public int updateTotalNumPlus(String nok,int purchase_num_plus, int select_number) throws Exception;
	//해당 제품 구매시 컴퓨터 카테고리내의 구매한 품목의 구매율 구해오기 위해 전체 구매수량 저장 테이블을 선택하기
	public int selectTotalTable(String nok) throws Exception;
}
