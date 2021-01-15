package com.kh.team.dao;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.BuyComputerVo;
import com.kh.team.domain.CartVo;
import com.kh.team.domain.ComputerVo;

@Repository
public class BuyComputerDaoImpl implements BuyComputerDao {
	 
	
	//알맞은 맵퍼를 찾기위한 상수 지정
	private final String NAMESPACE = "com.kh.team.buycomputerproduct.";
		
	//인젝
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void putBasketCategory(CartVo cartVo) throws Exception {
		sqlSession.insert(NAMESPACE + "putBasketCategory", cartVo);		
	}

	@Override
	public int getPkForTakePurchasePercentage(BuyComputerVo buyComputerVo) throws Exception {
		ComputerVo computerVo = sqlSession.selectOne(NAMESPACE + "getComNoForPercentage", buyComputerVo);
		int c_com_no = computerVo.getC_com_no();
		return c_com_no;		
	}
	
	@Override
	public void pushNumForGetPurchasePercentage(int c_com_no) throws Exception {		
		sqlSession.insert(NAMESPACE + "pushNumForPercentage", c_com_no);
	}
	
	@Override
	public int updateNumForGetPurchasePercentage(int c_com_no, int purchase_num, int purchase_num_plus)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_no", c_com_no);
		map.put("purchase_num", purchase_num);
		map.put("purchase_num_plus", purchase_num_plus);
		
		int count = sqlSession.update(NAMESPACE + "updateNumForPercentage", map);
		return count;
		
	}

	@Override
	public int selectNumForGetPurchasePercentage(int c_com_no) throws Exception {
		int purchase_num = sqlSession.selectOne(NAMESPACE + "selectNumForPercentage", c_com_no);
		return purchase_num;
	}

	@Override
	public int selectNumForCheck(int c_com_no) throws Exception {
		
		int check_no = sqlSession.selectOne(NAMESPACE + "selectNumForCheck", c_com_no);
		return check_no;
	}

	@Override
	public int updateTotalNumPlus(String nok,int purchase_num_plus,int select_number) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("nok", nok);
		map.put("purchase_num_plus", purchase_num_plus);
		map.put("select_number", select_number);
		int count = sqlSession.update(NAMESPACE + "updateTotalNumPlus", map);
		return count;
	}

	@Override
	public int selectTotalTable(String nok) throws Exception {
		int select_number = sqlSession.selectOne(NAMESPACE + "selectTotalTable", nok);
		return select_number;		
	}

	// -----------------------------------------------------
	
	@Override
	public int updateNumForGetPurchaseLike(int c_com_no,int like_num_plus, int select_number) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_no", c_com_no);
		map.put("like_num", select_number);		
		map.put("like_num_plus", like_num_plus);		
		
		int count = sqlSession.update(NAMESPACE + "updateNumForLike", map);
		System.out.println("updateNumForGetPurchaseLike_like_count:" + count);
		return count;
	}

	@Override
	public int selectNumForGetPurchaseLike(int c_com_no) throws Exception {
		int like_num = sqlSession.selectOne(NAMESPACE + "selectNumForLike", c_com_no);
		System.out.println("selectNumForGetPurchaseLike_like_num:" + like_num);
		return like_num;
	}

	@Override
	public int updateTotalNumLikePlus(String nok,int like_num_plus, int select_number) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("nok", nok);
		map.put("select_number", select_number);		
		map.put("like_num_plus", like_num_plus);		
		int count = sqlSession.update(NAMESPACE + "updateTotalNumLikePlus", map);
		System.out.println("updateTotalNumLikePlus_count:" + count);
		return count;
	}

	@Override
	public int selectTotalTableLike(String nok) throws Exception {
		int totallike = sqlSession.selectOne(NAMESPACE + "selectTotalTableLike", nok);
		System.out.println("selectTotalTableLike_totallike:" + totallike);
		return totallike;
	}

	
	
	// -----------------------------------------------------
		
	@Override
	public void insertProductRef(String productName, String m_id, String c_com_comment_content) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("productName", productName);
		map.put("m_id", m_id);		
		map.put("c_com_comment_content", c_com_comment_content);	
		sqlSession.insert(NAMESPACE + "insertProductRef", map);		
	}
		
}
