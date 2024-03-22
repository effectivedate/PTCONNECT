package com.ptconnect.myapp.service;

import java.util.ArrayList;

import com.ptconnect.myapp.domain.AdminDTO;
import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;

public interface OrderService {
	
	public ArrayList<PaymentDTO> userProductList(SearchCriteria scri);
	
	public PaymentDTO userProductDetail(String odNo);
	
	public ArrayList<PaymentDTO> trainerSalesList(SearchCriteria scri);
	
	public int trainerSalesTotalCount(SearchCriteria scri);
	
	public int userOrderTotalCount(SearchCriteria scri);
	
	public ArrayList<PaymentDTO> centerTrainerSalesList(SearchCriteria scri);
}
