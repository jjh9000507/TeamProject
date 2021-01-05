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

private final String NAMESPACE = "com.kh.team.computers.";
	private String CONSTNAT_CHAR = "99999";
	

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ComputerVo> list(String cate_no) throws Exception {
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductList", cate_no);
		return list;
	}

	

	@Override
	public ComputerVo detailComputerInfo(int p_no) throws Exception {
		ComputerVo categoryVo = sqlSession.selectOne(NAMESPACE + "detailComputerInfo", p_no);
		return categoryVo;
	}

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


	@Override
	public List<CategoryVo> categoryInfo(String cate_no) throws Exception {
		List<CategoryVo> list = sqlSession.selectList(NAMESPACE + "getCategoryInfo", cate_no);
		return list;
	}



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

	
}
