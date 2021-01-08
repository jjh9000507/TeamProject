package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.ComputersDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

@Service
public class ComputersServiceImpl implements ComputersService {
	
	@Inject
	private ComputersDao computersDao;

	@Override
	public List<ComputerVo> list(String cate_no) throws Exception {
		List<ComputerVo> list = computersDao.list(cate_no);
		return list;
	}

	@Override
	public ComputerVo detailComputerInfo(int p_no) throws Exception {
		ComputerVo categoryVo = computersDao.detailComputerInfo(p_no);
		return categoryVo;
	}

	@Override
	public List<ComputerVo> listArray(String[] checkList) throws Exception {
		List<ComputerVo> list = computersDao.listArray(checkList);
		return list;
	}

	@Override
	public List<CategoryVo> categoryInfoArray(String[] checkList) throws Exception {
		List<CategoryVo> categoryList = computersDao.categoryInfoArray(checkList);
		return categoryList;
	}

	@Override
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception {
		List<CategoryVo> categoryList = computersDao.categoryInfo(cate_no);
		return categoryList;
	}

	@Override
	public List<ComputerVo> listSearch(String c_com_name, String[] confirmList) throws Exception {
		List<ComputerVo> computerList = computersDao.listSearch(c_com_name, confirmList);
		return computerList;
	}

	@Override
	public List<ComputerVo> listSearchPrice(int firstPrice, int lastPrice, String[] confirmList)
			throws Exception {
		List<ComputerVo> computerList = computersDao.listSearchPrice(firstPrice, lastPrice, confirmList);
		return computerList;
	}

	@Override
	public ComputerVo buyComputerProduct(int p_no) throws Exception {
		ComputerVo computerVo = computersDao.buyComputerProduct(p_no);
		return computerVo;
	}

	@Override
	public String[] buyCategoryInfoGet(String c_com_cate_no) throws Exception {
		String[] indexName = computersDao.buyCategoryInfoGet(c_com_cate_no);
		 return indexName;
	}

	@Override
	public List<ComputerVo> listSearchById(String c_com_seller, String[] confirmList) throws Exception {
		List<ComputerVo> list = computersDao.listSearchById(c_com_seller, confirmList);
		return list;
	}

	@Override
	public int getSearchById(String c_com_seller) throws Exception {
		int count = computersDao.getSearchById(c_com_seller);
		return count;
	}
	
}
