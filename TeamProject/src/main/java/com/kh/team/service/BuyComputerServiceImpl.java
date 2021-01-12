package com.kh.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.BuyComputerDao;
import com.kh.team.domain.CartVo;

@Service
public class BuyComputerServiceImpl implements BuyComputerService {
	
	@Inject
	private BuyComputerDao buyComputerDao;
	
	@Override
	public void putBasketCategory(CartVo cartVo) throws Exception {
		buyComputerDao.putBasketCategory(cartVo);		
	}

}
