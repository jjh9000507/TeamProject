package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.ComputerVo;

@Repository
public class ComputersDaoImpl implements ComputersDao {

//알맞은 맵퍼를 찾기위한 상수 지정
private final String NAMESPACE = "com.kh.team.computers.";

	//체크박스를 통한 제품정보와 카테고리를 얻어오기 위해 sql에 쓰이는 상수 만들기
	private String CONSTNAT_CHAR = "99999";
	
	//인젝
	@Inject
	private SqlSession sqlSession;

	//제품정보를 카테고리 테이블과 컴퓨터 제품 테이블에 동시에 존재하여 참조된 cate_no를 이용하여 받아오기
	@Override
	public List<ComputerVo> list(String cate_no) throws Exception {
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductList", cate_no);
		return list;
	}

	//선택된 제품 정보 받기
	@Override
	public ComputerVo detailComputerInfo(int p_no) throws Exception {
		ComputerVo computerVo = sqlSession.selectOne(NAMESPACE + "detailComputerInfo", p_no);
		return computerVo;
	}

	//체크박스에 체크된 값을 이용하여 컴퓨터 정보를 다중 검색
	@Override
	public List<ComputerVo> listArray(String[] checkList) throws Exception {
		String[] newMap = {CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR};
		Map<String, Object> map = new HashMap<>();
		for(int i=0; i<checkList.length; i++) {
			newMap[i] = checkList[i];
			if(checkList[i] == null || checkList[i].equals("")) {
				newMap[i] = CONSTNAT_CHAR;
			}
			System.out.println("checkList_dao:" + checkList[i]);
			System.out.println("newMap_dao_list:" + newMap[i]);			
		}		
		for(int i=0; i<6; i++) {
			System.out.println("list_cate_no:" + newMap[i]);
			map.put("cate_no" + i, newMap[i]);
			}
		System.out.println("checkList.length:" + checkList.length);	
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductListArray", map);
		return list;
		
	}

	//체크박스에 체크된 값을 이용하여 카테고리 정보를 다중 검색
	@Override
	public List<CategoryVo> categoryInfoArray(String[] checkList) throws Exception {
		String[] newMap = {CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR};
		Map<String, Object> map = new HashMap<>();		
		for(int i=0; i<checkList.length; i++) {
			newMap[i] = checkList[i];
			if(checkList[i] == null || checkList[i].equals("")) {
				newMap[i] = CONSTNAT_CHAR;
			}
			
			System.out.println("checkCategory_dao:" + checkList[i]);
			System.out.println("newMap_dao_category:" + newMap[i]);			
		}		
		
		for(int i=0; i<6; i++) {
		System.out.println("category_cate_no:" + newMap[i]);
		map.put("cate_no" + i, newMap[i]);
		}
		System.out.println("checkList.length:" + checkList.length);		
		
		List<CategoryVo> categorylist = sqlSession.selectList(NAMESPACE + "getCategoryInfoArray", map);
		return categorylist;
	}

	//카테고리 정보 받아오기
	@Override
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception {
		List<CategoryVo> list = sqlSession.selectList(NAMESPACE + "getCategoryInfo", cate_no);
		return list;
	}

	//해당 카테고리 내의 결과내 검색기능 
	@Override
	public List<ComputerVo> listSearch(String c_com_name,String[] confirmList) throws Exception {
		String[] newMap = {CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR};
		Map<String, Object> map = new HashMap<>();
		map.put("c_com_name", c_com_name);
		for(int i=0; i<confirmList.length; i++) {
			newMap[i] = confirmList[i];
			if(confirmList[i] == null || confirmList[i].equals("")) {
				newMap[i] = CONSTNAT_CHAR;
			}
			
			System.out.println("searchComputer_dao:" + confirmList[i]);
			System.out.println("newMap_dao_searchComputer:" + newMap[i]);			
		}		
		
		for(int i=0; i<6; i++) {
		System.out.println("searchComputer_cate_no:" + newMap[i]);
		map.put("cate_no" + i, newMap[i]);
		}
		System.out.println("confirmList.length:" + confirmList.length);
		
		
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductListSearch", map);
		return list;		
	}

	//해당 카테고리내의 가격대 검색기능
	@Override
	public List<ComputerVo> listSearchPrice(int firstPrice, int lastPrice, String[] confirmList)
			throws Exception {
		String[] newMap = {CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR};
		Map<String, Object> map = new HashMap<>();
		map.put("firstPrice", firstPrice);
		map.put("lastPrice", lastPrice);
		System.out.println("firstPrice:"+firstPrice);
		System.out.println("lastPrice:"+lastPrice);
		for(int i=0; i<confirmList.length; i++) {
			newMap[i] = confirmList[i];
			if(confirmList[i] == null || confirmList[i].equals("")) {
				newMap[i] = CONSTNAT_CHAR;
			}
			
			System.out.println("searchComputer_dao:" + confirmList[i]);
			System.out.println("newMap_dao_searchComputer:" + newMap[i]);			
		}		
		
		for(int i=0; i<6; i++) {
		System.out.println("searchComputer_cate_no:" + newMap[i]);
		map.put("cate_no" + i, newMap[i]);
		}
		System.out.println("confirmList.length:" + confirmList.length);
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductListPrice", map);
		return list;
	}

	//구매하기 폼으로 선택된 제품정보보내기
	@Override
	public ComputerVo buyComputerProduct(int p_no) throws Exception {
		ComputerVo computerVo = sqlSession.selectOne(NAMESPACE + "buyComputerProduct", p_no);
		return computerVo;
	}
	
	//구매하기 폼으로 선택된 제품정보경로보내기
	@Override
	public String[] buyCategoryInfoGet(String c_com_cate_no) throws Exception {
		CategoryVo categoryVoFirst = sqlSession.selectOne(NAMESPACE + "buyCategoryInfoGet", c_com_cate_no);
		String cate_name_first = categoryVoFirst.getCate_name();
		String cate_ref_first = categoryVoFirst.getCate_ref();
		System.out.println("firstName:" + cate_name_first);
		System.out.println("firstRef:" + cate_ref_first);
		CategoryVo categoryVoSeccond = sqlSession.selectOne(NAMESPACE + "buyCategoryInfoGet", cate_ref_first);
		String cate_name_seccond = categoryVoSeccond.getCate_name();
		String cate_ref_seccond = categoryVoSeccond.getCate_ref();
		System.out.println("seccondName:" + cate_name_seccond);
		System.out.println("seccondRef:"+ cate_ref_seccond);
		CategoryVo categoryVoThird = sqlSession.selectOne(NAMESPACE + "buyCategoryInfoGet", cate_ref_seccond);
		String cate_name_third = categoryVoThird.getCate_name();
		String cate_ref_third = categoryVoThird.getCate_ref();
		System.out.println("thirdName:"+ cate_name_third);
		System.out.println("thirdRef:" + cate_ref_third);
		
		String[] indexName = {cate_name_first,cate_name_seccond,cate_name_third};
		return indexName;		
	}
	
	//판매자 아이디를 통한 제품 검색
	@Override
	public List<ComputerVo> listSearchById(String c_com_seller, String[] confirmList) throws Exception {
				
		String[] newMap = {CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR,CONSTNAT_CHAR};
		Map<String, Object> map = new HashMap<>();
				
		map.put("c_com_seller", c_com_seller);		
		
		for(int i=0; i<confirmList.length; i++) {
			newMap[i] = confirmList[i];
			if(confirmList[i] == null || confirmList[i].equals("")) {
				newMap[i] = CONSTNAT_CHAR;
			}
			
			System.out.println("searchById_dao:" + confirmList[i]);
			System.out.println("newMap_dao_searchById:" + newMap[i]);			
		}		
		
		for(int i=0; i<6; i++) {
		System.out.println("searchById_cate_no:" + newMap[i]);
		map.put("cate_no" + i, newMap[i]);
		}
		
		System.out.println("confirmList.length:" + confirmList.length);
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductListById", map);
		return list;
	}

	@Override
	public int getSearchById(String c_com_seller) throws Exception {
		System.out.println("c_com_seller:" + c_com_seller);
		int count = sqlSession.selectOne(NAMESPACE + "getSearchById", c_com_seller);
		System.out.println("count:" + count);
		return count;
	}
	
}
