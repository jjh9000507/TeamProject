package com.kh.team.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.ProductVo;

@Repository
public class PageDaoImpl implements PageDao {

	private static final String NAMESPACE = "com.kh.team.page.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert() throws Exception {
		
	}

	// 상품 더 보기
	@Override
	public List<ProductVo> moreList(int startNum) throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "morePage" , startNum);
		return list;
	}
	
	//검색 
	@Override
	public List<ProductVo> search(String searchName) throws Exception {
		List<ProductVo> list = sqlSession.selectList(NAMESPACE + "search" , searchName);
//		System.out.println("Dao , list : " + list);
		return list;
	}
	

}
