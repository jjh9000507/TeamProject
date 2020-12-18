package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.WhitegoodsVo;

@Repository
public class WhiteGoodsDaoImpl implements WhiteGoodsDao {

	private final static String NAMESPACE = "";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<WhitegoodsVo> list() throws Exception {
		return null;
	}

	@Override
	public void insertWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertWhite", whiteGoodsVo);
	}

	@Override
	public void updateWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		sqlSession.update(NAMESPACE);
	}

	@Override
	public void deleteWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		sqlSession.delete(NAMESPACE);
	}

}
