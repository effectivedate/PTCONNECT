package com.ptconnect.myapp.persistance;

import com.ptconnect.myapp.domain.PaymentDTO;

public interface PaymentServiceMapper {
	
	public int payment(PaymentDTO po);
	
	public int orderInsert(PaymentDTO po);
	
	public int orderProductInsert(PaymentDTO po);
	
	public int paymentCancleInsert(PaymentDTO po);
	
	public int pointInsert(PaymentDTO po);
	
	public int usePoint(PaymentDTO po);
	
	public int usePointDetail(PaymentDTO po);
	
	public int nonmember(PaymentDTO po);
	
	public int nonUserOrderInsert(PaymentDTO po);
	
	public int paymentStateUpdate(PaymentDTO po);
	
	public int sumPoint(int mbNo);
	
	public PaymentDTO selectPointBalance(int mbNo);
	
	public int updatePointBalance(PaymentDTO po);
	
	public PaymentDTO selectUsePoint(PaymentDTO po);
	
}
