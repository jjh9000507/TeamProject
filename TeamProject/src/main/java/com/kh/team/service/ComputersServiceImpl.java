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
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception {
		List<CategoryVo> categoryList = computersDao.categoryInfo(cate_no);
		return categoryList;
	}

	@Override
	public ComputerVo detailComputerInfo(int p_no) throws Exception {
		ComputerVo categoryVo = computersDao.detailComputerInfo(p_no);
		return categoryVo;
	}
}
