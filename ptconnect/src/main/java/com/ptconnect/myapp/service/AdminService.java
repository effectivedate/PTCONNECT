package com.ptconnect.myapp.service;

import java.util.ArrayList;

import com.ptconnect.myapp.domain.AdminDTO;
import com.ptconnect.myapp.domain.BoardDTO;
import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;

public interface AdminService {
	
	public AdminDTO adminMain();

	public ArrayList<CenterInfoDTO> centerRegisterList(SearchCriteria scri);
	public ArrayList<TrainerInfoDTO> trainerRegisterList(SearchCriteria scri);
	public ArrayList<TrainerInfoDTO> registredProductList(SearchCriteria scri);
	public ArrayList<PaymentDTO> tradedProductList(SearchCriteria scri);

	public int centerRegisterTotalCount();
	public int trainerRegisterTotalCount();
	public int registredProductTotalCount();
	public int tradedProductTotalCount();
	
	public int centerRegist(int ctNo);
	public int trainerRegist(TrainerInfoDTO tio);
	
	public PaymentDTO tradedProductDetail(String odNo);
	
	public int boardWrite(BoardDTO bdo);
	public int noticeWrite(BoardDTO bdo);
	public int FAQWrite(BoardDTO bdo);
	public int boardModify(BoardDTO bdo);
	public int noticeModify(BoardDTO bdo);
	public int FAQModify(BoardDTO bdo);
	public int boardDelete(BoardDTO bdo);
	
	public BoardDTO boardSelectOne(int bdNo);
	public ArrayList<BoardDTO> noticeSelectAll(SearchCriteria scri);
	public ArrayList<BoardDTO> FAQSelectAll(SearchCriteria scri);
	
	public int noticeTotalCount();
	public int FAQTotalCount();
}
