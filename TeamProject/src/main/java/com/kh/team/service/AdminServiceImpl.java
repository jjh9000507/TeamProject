package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.AdminDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDao adminDao;
	
	@Override
	public List<ProductVo> allProductList() throws Exception {
		List<ProductVo> allProductList = adminDao.allProductList();
		return allProductList;
	}

	@Override
	public void adminClothesDelete(int p_no) throws Exception {
		adminDao.adminClothesDelete(p_no);
	}

	@Override
	public void adminComputerDelete(int p_no) throws Exception {
		adminDao.adminComputerDelete(p_no);
	}

	@Override
	public void adminWhitegoodsDelete(int p_no) throws Exception {
		adminDao.adminWhitegoodsDelete(p_no);
	}

	@Override
	public void adminFBedDelete(int p_no) throws Exception {
		adminDao.adminFBedDelete(p_no);
	}

	@Override
	public void adminFInteriorDelete(int p_no) throws Exception {
		adminDao.adminFInteriorDelete(p_no);
	}

	@Override
	public void adminFKitchenDelete(int p_no) throws Exception {
		adminDao.adminFKitchenDelete(p_no);
	}

	@Override
	public void adminFLifeDelete(int p_no) throws Exception {
		adminDao.adminFLifeDelete(p_no);
	}

	@Override
	public void adminCategoryInput(CategoryVo categoryVo) throws Exception {
		adminDao.adminCategoryInput(categoryVo);
	}

	@Override
	public void adminCategoryDelete(String cate_no) throws Exception {
		adminDao.adminCategoryDelete(cate_no);
	}

	@Override
	public List<CategoryVo> getCategoryList() throws Exception {
		List<CategoryVo> getCategoryList = adminDao.getCategoryList();
		return getCategoryList;
	}

	@Override
	public List<ProductVo> productCateList(String cate_no) throws Exception {
		List<ProductVo> productCateList = adminDao.productCateList(cate_no);
		return productCateList;
	}

	@Override
	public List<CategoryVo> categoryDeleteList(String cate_no) throws Exception {
		List<CategoryVo> categoryDeleteList = adminDao.categoryDeleteList(cate_no);
		return categoryDeleteList;
	}

}
