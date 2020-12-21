package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.WhitegoodsVo;

@Repository
public class WhiteGoodsDaoImpl implements WhiteGoodsDao {

	private final static String NAMESPACE = "com.kh.team.whitegoods.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<WhitegoodsVo> list(String cate_no) throws Exception {
		List<WhitegoodsVo> goodsList = sqlSession.selectList(NAMESPACE + "getWhiteGoodsList", cate_no);
		return goodsList;
	}

	@Override
	public void insertWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertWhite", whiteGoodsVo);
	}

	@Override
	public void updateWhiteGoods(WhitegoodsVo whiteGoodsVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateWhite", whiteGoodsVo);
	}

	@Override
	public void deleteWhiteGoods(int p_no, String p_seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("p_seller", p_seller);
		sqlSession.delete(NAMESPACE + "deleteWhite", map);
	}

	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> cateList = sqlSession.selectList(NAMESPACE + "getCategoryList", cate_ref);
		return cateList;
	}

	@Override
	public WhitegoodsVo detailWhitegoods(int p_no) throws Exception {
		WhitegoodsVo detailWhitegoods = sqlSession.selectOne(NAMESPACE + "detailWhiteGoods", p_no);
		return detailWhitegoods;
	}

}
