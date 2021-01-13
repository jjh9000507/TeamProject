package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.weaver.patterns.HasThisTypePatternTriedToSneakInSomeGenericOrParameterizedTypePatternMatchingStuffAnywhereVisitor;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.AuctionAddressVo;
import com.kh.team.domain.AuctionBidVo;
import com.kh.team.domain.AuctionDateAndTimeVo;
import com.kh.team.domain.AuctionSellVo;
import com.kh.team.domain.AuctionSoldVo;
import com.kh.team.domain.AuctionTempBidVo;
import com.kh.team.domain.AuctionEDateVo;
import com.kh.team.domain.AuctionImgVo;
import com.kh.team.domain.AuctionMainImgVo;
import com.kh.team.domain.AuctionRDateVo;
import com.kh.team.domain.AuctionSDateVo;
import com.kh.team.domain.AuctionVo;
import com.kh.team.domain.MemberVo;
import com.thoughtworks.qdox.model.Member;

@Repository
public class AuctionDaoImpl implements AuctionDao{

	private static final String NAMESPACE="com.kh.team.auction.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<AuctionSellVo> getAuctoionMainList() throws Exception {
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctoionMainList");
		return list;
	}
	
	@Override
	public List<AuctionMainImgVo> getAuctionMainImg() throws Exception {
		List<AuctionMainImgVo> list = sqlSession.selectList(NAMESPACE + "getAuctionMainImg");
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionImg() throws Exception {
		List<AuctionImgVo> list = sqlSession.selectList(NAMESPACE + "getAuctionImg");
		return list;
	}
	
	@Override
	public int getNextSeqNumber() throws Exception {
		int currentSeq = sqlSession.selectOne(NAMESPACE + "getNextSeqNumber");
		return currentSeq;
	}

	@Override
	public void insertAuction(AuctionVo auctionVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuction", auctionVo);
	}

	@Override
	public void insertAuctionAddress(AuctionAddressVo auctionAddressVo) throws Exception {
		//System.out.println("DaoImpl auctionAddressVo:"+auctionAddressVo);
		sqlSession.insert(NAMESPACE+"insertAuctionAddress", auctionAddressVo);
	}

	@Override
	public void insertAuctionRegisterDate(AuctionRDateVo auctionRDateVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuctionRegisterDate", auctionRDateVo);
	}

	@Override
	public void insertAuctionExpirationDate(AuctionEDateVo auctionEDateVo) throws Exception {
		//System.out.println("DaoImpl auctionEDateVo:"+auctionEDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionExpirationDate", auctionEDateVo);
	}

	@Override
	public void insertAuctionSoldDate(AuctionSDateVo auctionSDateVo) throws Exception {
		System.out.println("DaoImpl auctionSDateVo:"+auctionSDateVo);
		sqlSession.insert(NAMESPACE+"insertAuctionSoldDate", auctionSDateVo);
	}

	@Override
	public void insertAuctionMainImg(AuctionMainImgVo auctionMainImgVo) throws Exception {
		sqlSession.insert(NAMESPACE+"insertAuctionMainImg", auctionMainImgVo);
	}
	
	@Override
	public void insertAuctionImg(AuctionImgVo auctionImgVo) throws Exception {
		System.out.println("DaoImpl auctionImgVo:"+auctionImgVo);
		sqlSession.insert(NAMESPACE+"insertAuctionImg", auctionImgVo);
	}

	@Override
	public List<AuctionSellVo> getAuctionBidingList(String m_id, AuctionDateAndTimeVo dtVo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("dtVo", dtVo);
		//System.out.println("auctionDaoImpl m_id:"+m_id+" ,dtVo:"+dtVo.toString());
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctionBidingList", map);
		//System.out.println("auctioinDaoImpl Bidinglist:"+list);
		return list;
	}

	@Override
	public List<AuctionSellVo> getAuctionBidingFinishList(String m_id, AuctionDateAndTimeVo dtVo)
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("dtVo", dtVo);
		List<AuctionSellVo> list = sqlSession.selectList(NAMESPACE+"getAuctionBidingFinishList", map);
		//System.out.println("auctioinDaoImpl BidingFinishlist:"+list);
		return list;
	}
	
	
	@Override
	public List<AuctionSoldVo> getAuctionUserMemberListSold(String m_id) throws Exception {
		List<AuctionSoldVo> list = sqlSession.selectList(NAMESPACE+"getAuctionUserMemberListSold", m_id);
		return list;
	}

	@Override
	public AuctionSellVo getAuctionSelectedItem(int p_no) throws Exception {
		AuctionSellVo list = sqlSession.selectOne(NAMESPACE+"getAuctionSelectedItem", p_no);
		return list;
	}

	@Override
	public List<AuctionImgVo> getAuctionSelectedImg(int p_no) throws Exception {
		List<AuctionImgVo> list = sqlSession.selectList(NAMESPACE+"getAuctionSelectedImg", p_no);
		return list;
	}

	@Override
	public MemberVo AuctionLogin(String m_id, String m_pass) throws Exception {

		Map<String, String> member = new HashMap<>();
		member.put("m_id", m_id);
		member.put("m_pass", m_pass);
		
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "AuctionLogin", member);
		
		return memberVo;
	}

	@Override
	public void deleteAuction_temp_bid(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_temp_bid", p_no);
	}

	@Override
	public void deleteAuction_bid(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_bid", p_no);
	}

	@Override
	public void deleteAuction_address(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_address", p_no);
	}

	@Override
	public void deleteAuction_expration_date(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_expration_date", p_no);
	}

	@Override
	public void deleteAuction_img(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_img", p_no);
	}

	@Override
	public void deleteAuction_main_img(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_main_img", p_no);
	}

	@Override
	public void deleteAuction_register_date(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_register_date", p_no);
	}

	@Override
	public void deleteAuction_sold_date(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction_sold_date", p_no);
	}

	@Override
	public void deleteAuction(int p_no) throws Exception {
		sqlSession.delete(NAMESPACE+"deleteAuction", p_no);
	}

	@Override
	public List<AuctionTempBidVo> getAuctionTempBid(int p_no) throws Exception {
		List<AuctionTempBidVo> auctionTempBidVo = sqlSession.selectList(NAMESPACE + "getAuctionTempBid", p_no);
		return auctionTempBidVo;
	}

	@Override
	public AuctionBidVo getAuctionBid(int p_no) throws Exception {
		AuctionBidVo auctionBidVo = sqlSession.selectOne(NAMESPACE + "getAuctionBid", p_no);
		return auctionBidVo;
	}

	@Override 
	public int getAuctionTempBidMaxPrice(int p_no) throws Exception {
		String tempBidMaxPrice = sqlSession.selectOne(NAMESPACE + "getAuctoinTempBidMaxPrice", p_no);
		
		int max=0;
		if(tempBidMaxPrice != null) {
			max = Integer.parseInt(tempBidMaxPrice);
		}
			
		return max;
	}

	@Override
	public int getAuctionCountBid(int p_no) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE + "getAuctionCountBid", p_no);
		return count;
	}

	@Override
	public void insertAuctionTempBid(String purchaser, String seller, int bidPrice, int p_no) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("purchaser", purchaser);
		map.put("seller", seller);
		map.put("bidPrice", bidPrice);
		map.put("p_no", p_no);
		
		sqlSession.insert(NAMESPACE + "insertAuctionTempBid", map);
	}

	@Override
	public AuctionEDateVo getAuctionExpirationDate(int p_no) throws Exception {
		AuctionEDateVo auctionEDateVo = sqlSession.selectOne(NAMESPACE + "getAuctionExpirationDate", p_no);
		return auctionEDateVo;
	}

	@Override
	public void updateAuctionEDate(AuctionEDateVo auctionEDateVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateAuctionEDate", auctionEDateVo);
		
	}

	@Override
	public AuctionTempBidVo getTempBidFromMaxPrice(int p_no) throws Exception {
		AuctionTempBidVo auctionTempBidVo = sqlSession.selectOne(NAMESPACE + "getTempBidFromMaxPrice", p_no);
		return auctionTempBidVo;
	}

	@Override
	public void insertAutoCommitBid(int p_no) throws Exception {
		sqlSession.insert(NAMESPACE + "insertAutoCommitBid", p_no); 
	}

	@Override
	public void updateAuctionAfterFinish(String purchaser, int sold_price, int p_no, String seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("purchaser", purchaser);
		map.put("sold_price", sold_price);
		map.put("p_no", p_no);
		map.put("seller", seller);
		sqlSession.update(NAMESPACE + "updateAuctionAfterFinish", map);
	}

	@Override
	public List<AuctionSoldVo> getAuctionPurchaserList(String m_id) throws Exception {
		List<AuctionSoldVo> list = sqlSession.selectList(NAMESPACE + "getAuctionPurchaserList", m_id);
		return list;
	}

	@Override
	public void updateAuctionExpriationDeadline(int p_no) throws Exception {
		sqlSession.update(NAMESPACE + "updateAuctionExpriationDeadline", p_no);
	}

	@Override
	public AuctionSellVo getAuctionModifyList(int p_no) throws Exception {
		AuctionSellVo auctionSellVo = sqlSession.selectOne(NAMESPACE + "getAuctionModifyList", p_no);
		return auctionSellVo;
	}

	@Override
	public List<String> getAuctionImgModify(int p_no) throws Exception {
		List<String> imgModify = sqlSession.selectList(NAMESPACE + "getAuctionImgModify", p_no);
		return imgModify;
	}

	@Override
	public void modifyAuction_imgDel(String fileAllName, int p_no) throws Exception {
		System.out.println("AuctionDaoImpl modifyAuction_imgDel:"+fileAllName);
		
		Map<String, Object> map = new HashMap<>();
		map.put("fileAllName", fileAllName);
		map.put("p_no", p_no);
		
		sqlSession.delete(NAMESPACE + "modifyAuction_imgDel", map);
	}

	@Override
	public void modifyAuction_imgInsert(String fileAllName, int p_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("fileAllName", fileAllName);
		map.put("p_no", p_no);
		
		sqlSession.insert(NAMESPACE + "modifyAuction_imgInsert", map);
	}
}
