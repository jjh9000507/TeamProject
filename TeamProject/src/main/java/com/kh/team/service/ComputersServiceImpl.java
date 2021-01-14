package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.BuyComputerDao;
import com.kh.team.dao.ComputersDao;
import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ComputerVo;
import com.kh.team.domain.ProductExplainVo;

@Service
public class ComputersServiceImpl implements ComputersService {
	
	private int CHECK_FOR_INDEX = 0;
	
	@Inject
	private ComputersDao computersDao;
	
	@Inject
	private BuyComputerDao buyComputerDao;

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

	@Override
	public int buyComputerComment(String c_com_product) throws Exception {
		int count = computersDao.buyComputerComment(c_com_product);
		return count;
	}

	@Override
	public int buyComputerExplain(String c_com_product) throws Exception {
		int count = computersDao.buyComputerExplain(c_com_product);
		return count;
	}

	
	
	@Override
	public int getPurchaseLike(BuyComputerVo buyComputerVo,int like_num_plus, String nok) throws Exception {
		int c_com_no = buyComputerDao.getPkForTakePurchasePercentage(buyComputerVo);
		System.out.println("c_com_no_like:" + c_com_no);
		int check_no = CHECK_FOR_INDEX;
		check_no = buyComputerDao.selectNumForCheck(c_com_no);
		System.out.println("check_no_like:" + check_no);
		if(check_no == 0) {
			buyComputerDao.pushNumForGetPurchasePercentage(c_com_no);			
		}else {
			System.out.println("이미 존재_like");
		}	
		int select_like = buyComputerDao.selectNumForGetPurchaseLike(c_com_no);
		System.out.println("select_like:" + select_like);
		int count = buyComputerDao.updateNumForGetPurchaseLike(c_com_no, like_num_plus, select_like);
		System.out.println("count_like:" + count);
		int select_number = buyComputerDao.selectTotalTableLike(nok);
		System.out.println("select_number_like:" + select_number);
		
		int countRe = buyComputerDao.updateTotalNumLikePlus(nok, like_num_plus, select_number);
		System.out.println("countRe_like:" + countRe);
		
		return count;
	}

	@Override
	public int getTotalNumLike(String nok) throws Exception {
		int count =buyComputerDao.selectTotalTableLike(nok);
		System.out.println("count_like:" + count);
		return count;
	}

	@Override
	public int getProductNumLike(int c_com_no) throws Exception {
		int check_no = CHECK_FOR_INDEX;
		check_no = buyComputerDao.selectNumForCheck(c_com_no);
		System.out.println("check_no_like:" + check_no);
		if(check_no == 0) {
			buyComputerDao.pushNumForGetPurchasePercentage(c_com_no);			
		}else {
			System.out.println("이미 존재_like_get");
		}	
		int likeNum = 0;
		likeNum = buyComputerDao.selectNumForGetPurchaseLike(c_com_no);
		System.out.println("likeNum_like:" + likeNum);
		return likeNum;
	}
	
}
