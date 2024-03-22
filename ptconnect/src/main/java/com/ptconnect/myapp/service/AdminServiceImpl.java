package com.ptconnect.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptconnect.myapp.domain.AdminDTO;
import com.ptconnect.myapp.domain.BoardDTO;
import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.persistance.AdminServiceMapper;

@Service
public class AdminServiceImpl implements AdminService{

	private AdminServiceMapper asm;
	
	@Autowired
	public AdminServiceImpl(SqlSession sqlSession) {
		this.asm = sqlSession.getMapper(AdminServiceMapper.class);
	}

	@Override
	public AdminDTO adminMain() {
		
		AdminDTO ao = new AdminDTO();
		
		return ao;
	}
	@Override
	public ArrayList<TrainerInfoDTO> trainerRegisterList(SearchCriteria scri) {
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		ArrayList<TrainerInfoDTO> tList = asm.trainerRegisterList(scri);
		
		
		return tList;
	}
	@Override
	public ArrayList<CenterInfoDTO> centerRegisterList(SearchCriteria scri) {
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		ArrayList<CenterInfoDTO> cList = asm.centerRegisterList(scri);
		
		
		return cList;
	}
	@Override
	public ArrayList<PaymentDTO> tradedProductList(SearchCriteria scri) {
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		ArrayList<PaymentDTO> oList = asm.tradedProductList(scri);
		
		
		return oList;
	}
	@Override
	public ArrayList<TrainerInfoDTO> registredProductList(SearchCriteria scri) {
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		ArrayList<TrainerInfoDTO> tList = asm.registredProductList(scri);
		
		
		return tList;
	}
	@Override
	public int registredProductTotalCount() {

		int value = asm.registredProductTotalCount();
		
		
		return value;
	}
	@Override
	public int trainerRegisterTotalCount() {
		
		int value = asm.trainerRegisterTotalCount();
		
		
		return value;
	}
	@Override
	public int centerRegisterTotalCount() {
		
		int value = asm.centerRegisterTotalCount();
		
		
		return value;
	}
	@Override
	public int tradedProductTotalCount() {
		
		int value = asm.tradedProductTotalCount();
		
		
		return value;
	}
	@Override
	public int centerRegist(int ctNo) {
		
		int value = asm.centerRegist(ctNo);
		
		
		return value;
	}
	@Override
	public int trainerRegist(TrainerInfoDTO tio) {

		int value = asm.trainerRegist(tio.getTnNo());
		int value2 = 0;
		if(asm.otherTrainerSelect(tio.getMbNo()) > 1) {
			value2 = asm.otherTrainerUnregist(tio);
		}else {
			value = value + 1;			
		}
		
		
		return value+value2;
	}
	@Override
	public PaymentDTO tradedProductDetail(String odNo) {
		
		PaymentDTO po = asm.tradedProductDetail(odNo);
		
		
		return po;
	}
	@Override
	public int boardWrite(BoardDTO bdo) {
		
		int value = asm.boardWrite(bdo);
		
		return value;
	}
	
	@Override
	public int noticeWrite(BoardDTO bdo) {
		
		int value = asm.noticeWrite(bdo);
		
		return value;
	}
	
	@Override
	public int FAQWrite(BoardDTO bdo) {
		
		int value = asm.FAQWrite(bdo);
		
		return value;
	}
	
	@Override
	public int boardModify(BoardDTO bdo) {
		
		int value = asm.boardModify(bdo);
		
		return value;
	}
	
	@Override
	public int noticeModify(BoardDTO bdo) {
		
		int value = asm.noticeModify(bdo);
		
		return value;
		
	}
	
	@Override
	public int FAQModify(BoardDTO bdo) {
		
		int value = asm.FAQModify(bdo);
		
		return value;
	}
	
	@Override
	public int boardDelete(BoardDTO bdo) {
		
		int value = asm.boardDelete(bdo);
		
		return value;
	}
	
	@Override
	public BoardDTO boardSelectOne(int bdNo) {
		
		BoardDTO bdo = asm.boardSelectOne(bdNo);
		
		return bdo;
	}
	
	@Override
	public ArrayList<BoardDTO> noticeSelectAll(SearchCriteria scri) {
		
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		
		ArrayList<BoardDTO> ntList = asm.noticeSelectAll(scri);
		
		return ntList;
	}
	
	@Override
	public ArrayList<BoardDTO> FAQSelectAll(SearchCriteria scri) {
		
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		
		ArrayList<BoardDTO> FAQList = asm.FAQSelectAll(scri);
		
		return FAQList;
	}
	
	@Override
	public int noticeTotalCount() {

		int value = 0;
		value = asm.noticeTotalCount();

		return value;
	}
	
	@Override
	public int FAQTotalCount() {

		int value = 0;
		value = asm.FAQTotalCount();

		return value;
	}
}
