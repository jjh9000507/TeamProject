package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.PageDao;
import com.kh.team.domain.ProductVo;

@Service
public class PageServiceImpl implements PageService {

	@Inject
	PageDao pageDao;
	
	// 더보기 버튼
	@Override
	public List<ProductVo> moreList(int startNum) throws Exception {
		List<ProductVo> list = pageDao.moreList(startNum);
		return list;
	}

	// 검색 창
	@Override
	public List<ProductVo> search(String searchName) throws Exception {
		List<ProductVo> list = pageDao.search(searchName);
//		System.out.println("Service , list : " + list);
		return list;
	}

}
