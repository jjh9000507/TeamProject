package com.kh.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.BuyComputerDao;
import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;

@Service
public class BuyComputerServiceImpl implements BuyComputerService {
	
	private int CHECK_FOR_INDEX = 0;
	
	@Inject
	private BuyComputerDao buyComputerDao;
	
	@Override
	public void putBasketCategory(CartVo cartVo) throws Exception {
		buyComputerDao.putBasketCategory(cartVo);		
	}

	@Override
	public int getPurchasePercentage(BuyComputerVo buyComputerVo, int purchase_num_plus, String nok) throws Exception {
		int c_com_no = buyComputerDao.getPkForTakePurchasePercentage(buyComputerVo);
		System.out.println("c_com_no:" + c_com_no);
		int check_no = CHECK_FOR_INDEX;
		check_no = buyComputerDao.selectNumForCheck(c_com_no);
		System.out.println("check_no:" + check_no);
		if(check_no == 0) {
			buyComputerDao.pushNumForGetPurchasePercentage(c_com_no);			
		}else {
			System.out.println("이미 존재");
		}	
		int purchase_num = buyComputerDao.selectNumForGetPurchasePercentage(c_com_no);
		System.out.println("purchase_num:" + purchase_num);
		int count = buyComputerDao.updateNumForGetPurchasePercentage(c_com_no, purchase_num, purchase_num_plus);
		System.out.println("count:" + count);
		int select_number = buyComputerDao.selectTotalTable(nok);
		System.out.println("select_number:" + select_number);
		
		int countRe = buyComputerDao.updateTotalNumPlus(nok, purchase_num_plus, select_number);
		System.out.println("countRe:" + countRe);
		
		return count;
		
	}

	@Override
	public int getTotalNum(String nok) throws Exception {
		int select_number = buyComputerDao.selectTotalTable(nok);
		return select_number;
	}

	@Override
	public int getProductNum(int c_com_no) throws Exception {
		int check_no = CHECK_FOR_INDEX;
		check_no = buyComputerDao.selectNumForCheck(c_com_no);
		System.out.println("check_no:" + check_no);
		if(check_no == 0) {
			buyComputerDao.pushNumForGetPurchasePercentage(c_com_no);			
		}else {
			System.out.println("이미 존재");
		}	
		int productNum = 0;
		productNum = buyComputerDao.selectNumForGetPurchasePercentage(c_com_no);
		return productNum;
	}

	@Override
	public void insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception {
		buyComputerDao.insertProductRef(productName, m_id, c_com_comment_content);
		
	}

	
}
