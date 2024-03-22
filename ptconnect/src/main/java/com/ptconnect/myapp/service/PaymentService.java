package com.ptconnect.myapp.service;

import java.io.IOException;

import org.json.simple.parser.ParseException;

import com.ptconnect.myapp.domain.PaymentDTO;

public interface PaymentService {
	
	public int payment(PaymentDTO po);
	
	public int pointInsert(PaymentDTO po);
	
	public int usePoint(PaymentDTO po);
	
	public int orderInsert(PaymentDTO po);
	
	public String getToken() throws Exception;
	
	public String paymentInfo(String imp_uid, String access_token) throws IOException, ParseException;

	public void payMentCancle(String access_token, String merchant_uid, String imp_uid, String amount,String reason,PaymentDTO po) throws IOException, ParseException;
	
	public int paymentCancleInsert(PaymentDTO po);
	
	public int nonmember(PaymentDTO po);
	
	public int nonUserOrderInsert(PaymentDTO po);
	
	public int paymentStateUpdate(PaymentDTO po);
	
	public int sumPoint(int mbNo);
	
	public PaymentDTO selectPointBalance(int mbNo);
	
	public int updatePointBalance(PaymentDTO po);
	
	public int usePointDetail(PaymentDTO po);
	
	public PaymentDTO selectUsePoint(PaymentDTO po);
}
