package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.SellProductDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;

@Service
public class SellProductServiceImpl implements SellProductService {

	@Inject
	private SellProductDao sellProductDao;
	
	@Override
	public List<CategoryVo> getCategoryList(String cate_ref) throws Exception {
		List<CategoryVo> getCategoryList = sellProductDao.getCategoryList(cate_ref);
		return getCategoryList;
	}

	@Override
	public void sellerReg(String m_id) throws Exception {
		sellProductDao.sellerReg(m_id);
	}

	@Override
	public List<MemberVo> sellerList() throws Exception {
		List<MemberVo> sellerList = sellProductDao.sellerList();
		return sellerList;
	}

	@Override
	public void rollbackSeller(String m_id) throws Exception {
		sellProductDao.rollbackSeller(m_id);
	}


}
