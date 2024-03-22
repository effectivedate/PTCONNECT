package com.ptconnect.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptconnect.myapp.domain.AdminDTO;
import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.persistance.AdminServiceMapper;
import com.ptconnect.myapp.persistance.OrderServiceMapper;

@Service
public class OrderServiceImpl implements OrderService{

	private OrderServiceMapper osm;
	
	@Autowired
	public OrderServiceImpl(SqlSession sqlSession) {
		this.osm = sqlSession.getMapper(OrderServiceMapper.class);
	}

	@Override
	public ArrayList<PaymentDTO> userProductList(SearchCriteria scri) {
		
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		
		ArrayList<PaymentDTO> oList = osm.userProductList(scri);
		
		return oList;
	}
	@Override
	public PaymentDTO userProductDetail(String odNo) {
		
		PaymentDTO po = osm.userProductDetail(odNo);
		
		
		return po;
	}
	
	@Override
	public ArrayList<PaymentDTO> trainerSalesList(SearchCriteria scri) {
		
		int value = (scri.getPage()-1)*scri.getPerPageNum();
		scri.setPage(value);
		
		ArrayList<PaymentDTO> trainerSalesList = osm.trainerSalesList(scri);
		
		return trainerSalesList;
	}
	
	@Override
	public int trainerSalesTotalCount(SearchCriteria scri) {
		
		int value = osm.trainerSalesTotalCount(scri);
		
		return value;
	}

	@Override
	public int userOrderTotalCount(SearchCriteria scri) {
		
		int value = osm.userOrderTotalCount(scri);
		
		return value;
	}
	
	@Override
	public ArrayList<PaymentDTO> centerTrainerSalesList(SearchCriteria scri) {
		
		ArrayList<PaymentDTO> centerTrainerSalesList = osm.centerTrainerSalesList(scri);
		
		return centerTrainerSalesList;
	}
}
