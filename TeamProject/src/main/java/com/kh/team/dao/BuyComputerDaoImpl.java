package com.kh.team.dao;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.ComputerVo;

@Repository
public class BuyComputerDaoImpl implements BuyComputerDao {
	 
	
	//알맞은 맵퍼를 찾기위한 상수 지정
	private final String NAMESPACE = "com.kh.team.buycomputerproduct.";
		
	//인젝
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void putBasketCategory(CartVo cartVo) throws Exception {
		sqlSession.insert(NAMESPACE + "putBasketCategory", cartVo);		
	}

	@Override
	public int getPkForTakePurchasePercentage(BuyComputerVo buyComputerVo) throws Exception {
		ComputerVo computerVo = sqlSession.selectOne(NAMESPACE + "getComNoForPercentage", buyComputerVo);
		int c_com_no = computerVo.getC_com_no();
		return c_com_no;		
	}
	
	@Override
	public void pushNumForGetPurchasePercentage(int c_com_no) throws Exception {		
		sqlSession.insert(NAMESPACE + "pushNumForPercentage", c_com_no);
	}
	
	@Override
	public int updateNumForGetPurchasePercentage(int c_com_no, int purchase_num, int purchase_num_plus)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_no", c_com_no);
		map.put("purchase_num", purchase_num);
		map.put("purchase_num_plus", purchase_num_plus);
		
		int count = sqlSession.update(NAMESPACE + "updateNumForPercentage", map);
		return count;
		
	}

	@Override
	public int selectNumForGetPurchasePercentage(int c_com_no) throws Exception {
		int purchase_num = sqlSession.selectOne(NAMESPACE + "selectNumForPercentage", c_com_no);
		return purchase_num;
	}

	@Override
	public int selectNumForCheck(int c_com_no) throws Exception {
		
		int check_no = sqlSession.selectOne(NAMESPACE + "selectNumForCheck", c_com_no);
		return check_no;
	}

	
		
}
