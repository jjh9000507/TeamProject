package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionVo;

public interface AuctionService {

	//main에서 보여주는 판매자 리스트
	public List<AuctionVo> getAuctionList() throws Exception;
	//main이미지 가져오기
	public List<AuctionImgVo> getAuctionImgMain() throws Exception;
}
