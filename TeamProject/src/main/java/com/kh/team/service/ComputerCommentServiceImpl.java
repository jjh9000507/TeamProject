package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.ComputerCommentDao;
import com.kh.team.domain.ComputerCommentVo;
import com.kh.team.domain.ProductExplainVo;

@Service
public class ComputerCommentServiceImpl implements ComputerCommentService {

	@Inject
	private ComputerCommentDao computerCommentDao;
	
	@Override
	public List<ComputerCommentVo> getCommentList(int p_no) throws Exception {
		List<ComputerCommentVo> list = computerCommentDao.getCommentList(p_no);
		return list;
				
	}

	@Override
	public List<ProductExplainVo> getInquireList(int p_no) throws Exception {
		List<ProductExplainVo> list = computerCommentDao.getInquireList(p_no);
		return list;
	}

	@Override
	public int changeCommentContent(int c_com_comment_no, String c_com_comment_content) throws Exception {
		int count =computerCommentDao.changeCommentContent(c_com_comment_no, c_com_comment_content);
		return count;
	}

	@Override
	public void deleteComment(int c_com_comment_no) throws Exception {
		computerCommentDao.deleteComment(c_com_comment_no);		
	}

	@Override
	public void insetInquire(ProductExplainVo productExplainVo) throws Exception {
		computerCommentDao.insetInquire(productExplainVo);
		
	}
	

}
