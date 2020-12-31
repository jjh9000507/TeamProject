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
	public List<ComputerVo> listArray(String[] checkList, String now_cate_no) throws Exception {
		String[] newMap = {"99999","99999","99999","99999","99999","99999"};
		Map<String, Object> map = new HashMap<>();
		for(int i=0; i<checkList.length; i++) {
			newMap[i] = checkList[i];
			System.out.println("checkList_dao:" + checkList[i]);
			System.out.println("newMap_dao:" + newMap[i]);			
		}		
		for(int i=0; i<6; i++) {
			System.out.println("newMap[i]:" + newMap[i]);
			map.put("cate_no" + i, newMap[i]);
			}
		System.out.println("checkList.length:" + checkList.length);	
		List<ComputerVo> list = sqlSession.selectList(NAMESPACE + "getComptersProductListArray", map);
		return list;
		
	}

	@Override
	public List<CategoryVo> categoryInfoArray(String[] checkList, String now_cate_no) throws Exception {
		String[] newMap = {"99999","99999","99999"};
		Map<String, Object> map = new HashMap<>();
		map.put("length", checkList.length);		
		map.put("now_cate_no", now_cate_no);
		for(int i=0; i<checkList.length; i++) {
			newMap[i] = checkList[i];
			if(newMap[i] == null || newMap[i].equals("")) {
				newMap[i] = "gg";
			}
			
			System.out.println("checkList_dao:" + checkList[i]);
			System.out.println("newMap_dao:" + newMap[i]);			
		}		
		
		for(int i=0; i<3; i++) {
		System.out.println("newMap[i]:" + newMap[i]);
		map.put("cate_no" + i, newMap[i]);
		}
		System.out.println("checkList.length:" + checkList.length);
		System.out.println("now_cate_no:" + now_cate_no);
		
		List<CategoryVo> categorylist = sqlSession.selectList(NAMESPACE + "getCategoryInfoArray", map);
		return categorylist;
	}



	@Override
	public List<CategoryVo> categoryInfoArray(String[] checkList) throws Exception {
		System.out.println("checkList[0]:" + checkList[0]);
		List<CategoryVo> list = sqlSession.selectList(NAMESPACE + "getCategoryInfo", checkList[0]);
		return null;
	}

	
}
