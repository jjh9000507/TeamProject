package com.kh.team;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AuctionDao;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionImgVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AuctionDaoTest {

	@Inject
	private AuctionDao auctionDao;
	
	@Test
	public void getAuctoionMainListTest() throws Exception {
		List<AuctionSellVo> list = auctionDao.getAuctoionMainList();
	}
	
	@Test
	public void insertAuctionImg() throws Exception{
		AuctionImgVo auctionImgVo = new AuctionImgVo();
		auctionImgVo.setImg_name("image name");
		auctionDao.insertAuctionImg(auctionImgVo);
	}
	
	@Test
	public void getAuctionUserMemberListSell() throws Exception{
		auctionDao.getAuctionUserMemberListSell("user03");
	}
}
