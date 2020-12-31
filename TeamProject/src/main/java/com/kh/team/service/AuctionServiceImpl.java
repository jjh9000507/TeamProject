package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.AuctionDao;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionVo;

@Service
public class AuctionServiceImpl implements AuctionService {

	@Inject
	private AuctionDao auctionDao;
	
	@Override
	public List<AuctionVo> getAuctionList() throws Exception {
		List<AuctionVo> list = auctionDao.getAuctionList();
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionImgMain() throws Exception {
		List<AuctionImgVo> imglist = auctionDao.getAuctionImgMain();
		return imglist;
	}

	
}
