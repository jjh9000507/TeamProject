package com.kh.team;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.WhiteGoodsDao;
import com.kh.team.domain.WhitegoodsVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class WhiteGoodsDaoTest {
	
	@Inject
	private WhiteGoodsDao whiteGoodsDao;
	
	@Test
	public void testWhiteGoodsList() throws Exception {
		List<WhitegoodsVo> list = whiteGoodsDao.list("302");
		System.out.println(list);
	}
	
	@Test
	public void testWhiteGoodsInsert() throws Exception {
		WhitegoodsVo whiteGoodsVo = new WhitegoodsVo();
		whiteGoodsVo.setP_name("전기난로");
		whiteGoodsVo.setP_seller("user02");
		whiteGoodsVo.setP_price(20000);
		whiteGoodsVo.setCate_no("30223");
		whiteGoodsVo.setP_content("신품같은 난로 팜");
		whiteGoodsVo.setP_thumbimg("0.png");
		System.out.println("whiteGoodsVo: " + whiteGoodsVo);
		whiteGoodsDao.insertWhiteGoods(whiteGoodsVo);
	}
	
	@Test
	public void testUpdateGoods() throws Exception {
		WhitegoodsVo whiteGoodsVo = new WhitegoodsVo();
		whiteGoodsVo.setP_no(24);
		whiteGoodsVo.setP_name("온풍기");
		whiteGoodsVo.setP_seller("user02");
		whiteGoodsVo.setP_price(15000);
		whiteGoodsVo.setCate_no("30222");
		whiteGoodsVo.setP_content("사용감 없는 온풍기 팝니다");
		whiteGoodsVo.setP_thumbimg("1.png");
		whiteGoodsDao.updateWhiteGoods(whiteGoodsVo);
	}
	
	@Test
	public void testDeleteGoods() throws Exception {
		whiteGoodsDao.deleteWhiteGoods(23, "user02");
	}

}
