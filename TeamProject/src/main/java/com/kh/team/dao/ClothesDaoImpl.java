package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.ClothesVo;

@Repository
public class ClothesDaoImpl implements ClothesDao {

	private static final String NAMESPACE = "com.kh.team.cloth.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ClothesVo> getClothesList(String cate_no) throws Exception {
		List<ClothesVo> getClothesList = sqlSession.selectList(NAMESPACE + "getClothesList", cate_no);
		return getClothesList;
	}

	@Override
	public void insertClothes(ClothesVo clothesVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertClothes", clothesVo);

	}

	@Override
	public void updateClothes(ClothesVo clothesVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateClothes", clothesVo);

	}

	@Override
	public void deleteClothes(int p_no, String p_seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("p_no", p_no);
		map.put("p_seller", p_seller);
		
		sqlSession.delete(NAMESPACE + "deleteClothes", map);

	}

}
