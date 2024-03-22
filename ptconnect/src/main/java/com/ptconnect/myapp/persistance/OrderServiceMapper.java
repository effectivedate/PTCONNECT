package com.ptconnect.myapp.persistance;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ptconnect.myapp.domain.AdminDTO;
import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;

public interface OrderServiceMapper {
	
	public ArrayList<PaymentDTO> userProductList(SearchCriteria scri);
	
	public PaymentDTO userProductDetail(@Param("odNo")String odNo);
	
	public ArrayList<PaymentDTO> trainerSalesList(SearchCriteria scri);
	
	public int trainerSalesTotalCount(SearchCriteria scri);

	public int userOrderTotalCount(SearchCriteria scri);
	
	public ArrayList<PaymentDTO> centerTrainerSalesList(SearchCriteria scri);
}
