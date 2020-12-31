package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionVo;

@Repository
public class AuctionDaoImpl implements AuctionDao{

	private static final String NAMESPACE="com.kh.team.auction.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<AuctionVo> getAuctionList() throws Exception {
		List<AuctionVo> list = sqlSession.selectList(NAMESPACE + "getAuctionList");
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionImgMain() throws Exception {
		List<AuctionImgVo> imglist = sqlSession.selectList(NAMESPACE + "getAuctionImgMain");
		return imglist;
	}

}
