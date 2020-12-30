package com.kh.team.dao;

import java.util.List;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ProductVo;

public interface AdminDao {
	public List<ProductVo> allProductList() throws Exception;
	public void adminClothesDelete(int p_no) throws Exception;
	public void adminComputerDelete(int p_no) throws Exception;
	public void adminWhitegoodsDelete(int p_no) throws Exception;
	public void adminFBedDelete(int p_no) throws Exception;
	public void adminFInteriorDelete(int p_no) throws Exception;
	public void adminFKitchenDelete(int p_no) throws Exception;
	public void adminFLifeDelete(int p_no) throws Exception;
	
	public void adminCategoryInput(CategoryVo categoryVo) throws Exception;
	public void adminCategoryDelete(String cate_no) throws Exception;
	public List<CategoryVo> getCategoryList() throws Exception;
}
