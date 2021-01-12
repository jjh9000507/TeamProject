package com.kh.team.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CartVo;

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
		
}
