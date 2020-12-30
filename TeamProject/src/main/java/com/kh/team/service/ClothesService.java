package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.ClothesVo;

public interface ClothesService {
	public List<ClothesVo> getClothesList(String cate_no) throws Exception;
	public void insertClothes(ClothesVo clothesVo) throws Exception;
	public void updateClothes(ClothesVo clothesVo) throws Exception;
	public void deleteClothes(int p_no, String p_seller) throws Exception;
}
