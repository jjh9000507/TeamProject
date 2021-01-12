package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.PageDao;
import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.CategoryVo;
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

	// 메인 카테고리 뿌려주기
	@Override
	public List<CategoryVo> mainCategories(int distinct_num) throws Exception {
		List<CategoryVo> list = pageDao.mainCatagories(distinct_num);
		return list;
	}

	// 등록한 상품 주소 받아오기
	@Override
	public List<AuctionAddressVo> addrList() throws Exception {
		List<AuctionAddressVo> list = pageDao.addrList();
		return list;
	}

	@Override
	public List<ProductVo> selectAll_List() throws Exception {
		List<ProductVo> list = pageDao.selectAll_List();
		return list;
	}

	@Override
	public void updateReadCount(int p_no) throws Exception {
		pageDao.updateReadCount(p_no);
	}

	@Override
	public ProductVo content(int p_no) throws Exception {
		ProductVo productVo = pageDao.content(p_no);
		return productVo;
	}

}
