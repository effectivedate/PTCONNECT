package com.ptconnect.myapp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.service.PaymentService;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService ps;
	
	@RequestMapping(value = "paymentCancle")
	public void paymentCancle(@RequestBody PaymentDTO po, HttpSession session) throws Exception {
		
		Integer mbNo = (Integer) session.getAttribute("mbNo");
		System.out.println("mbNo : " + mbNo);
	    System.out.println("페이먼트 : " + session.getAttribute("tnNo"));
	    int tnNo = Integer.parseInt(session.getAttribute("tnNo").toString());
	    
	    po.setTnNo(tnNo);
	    System.out.println("tnNo : " + po.getTnNo());
		
		String token = ps.getToken();
        System.out.println("토큰 : " + token);
        
        String amount = ps.paymentInfo(po.getPmNo(), token);
        
        System.out.println("amount : " + amount);
        System.out.println("odPrice : " + Integer.toString(po.getOdPrice()));
        
        ps.payMentCancle(token, po.getOdNo(), po.getPmNo(), amount, "결제 금액 오류", po);
        
        if (session.getAttribute("mbNo") != null) {
	        
	        po.setMbNo(mbNo);
	            
	        int value = ps.orderInsert(po);
	        int value2 = ps.payment(po);
	        int value3 = ps.paymentCancleInsert(po);
	            
	        System.out.println("value : " + value);
	        System.out.println("value2 : " + value2);
	        System.out.println("value3 : " + value3);
	            
	   }else if(session.getAttribute("mbNo") == null) {
	    	
	       int value1 = ps.nonmember(po);
		   System.out.println("비회원정보 : " + value1);
		   System.out.println("nmNo : " + po.getNmNo());
		    	
		   int value2 = ps.nonUserOrderInsert(po);
		   System.out.println("비회원 주문정보 : " + value2);
			    	
		   int value3 = ps.payment(po);
		   System.out.println("결제정보 : " + value3);
			    		
		   int value4 = ps.paymentCancleInsert(po);
		   System.out.println("주문취소 : " + value4);
		    	
	    }
	}
	
	
	@RequestMapping(value = "payment", method = {RequestMethod.POST, RequestMethod.GET})
	public void payment(@RequestBody PaymentDTO po, HttpSession session) throws Exception {
	    
	    Integer mbNo = (Integer) session.getAttribute("mbNo");
		
	    System.out.println("mbNo : " + mbNo);
	    System.out.println("페이먼트 : " + session.getAttribute("tnNo"));
	    int tnNo = Integer.parseInt(session.getAttribute("tnNo").toString());
	    
	    po.setTnNo(tnNo);
	    System.out.println("tnNo : " + po.getTnNo());
	    
	    String token = ps.getToken();
        System.out.println("토큰 : " + token);
        
        String amount = ps.paymentInfo(po.getPmNo(), token);
        System.out.println("amount : " + amount);
        System.out.println("odPrice : " + Integer.toString(po.getOdPrice()));
        
        System.out.println("usepoint : " + po.getUsePoint());

        //        String path = "";
        
	    if (session.getAttribute("mbNo") != null) {	// 회원
	        
	        
	        if (!Integer.toString(po.getOdPrice()).equals(amount)) {	// 결제금액 불일치
	            // 결제 취소
	        	po.setMbNo(mbNo);
	        	
	            ps.payMentCancle(token, po.getOdNo(), po.getPmNo(), amount, "결제 금액 오류", po);
	            
	            int value = ps.orderInsert(po);
	            int value2 = ps.payment(po);
	            int value3 = ps.paymentCancleInsert(po);
	            
	            System.out.println("value : " + value);
	            System.out.println("value2 : " + value2);
	            System.out.println("value3 : " + value3);
	            
//	            path = "redirect:/findtrainer";
	            
	        } else {	// 결제금액 일치 정상 결제 진행
	            
	        	po.setMbNo(mbNo);
	        	
	            int value = ps.orderInsert(po);
	            System.out.println("주문정보 : " + value);
	            
	            int value2 = ps.payment(po);
	            System.out.println("결제정보 : " + value2);
	            
		        int value3 = ps.pointInsert(po);
		        System.out.println("포인트적립 : " + value3);
		        
		        if(po.getUsePoint() != 0) {
				    int value4 = ps.usePoint(po);
				    System.out.println("포인트사용 : " + value4);
				    
//				    usepoint테이블 insert 후 point_ 테이블에서 차감되는 메소드 추가/ usepointdetail에 차감내역 추가
				    
				    int usePoint = po.getUsePoint();
				    System.out.println("최초 usePoint : " + usePoint);
				    
				    int upNo = po.getUpNo();
				    System.out.println("upNo : " + upNo);
			    	
			    	po.setRemainUsePoint(usePoint);
			    	
			    	PaymentDTO newPo = ps.selectPointBalance(mbNo);
			    	int ptBalance = newPo.getPtBalance();
			    	int ptNo = newPo.getPtNo();
			    	po.setPtBalance(ptBalance);
			    	
			    	System.out.println("1번 차감될 ptNo : " + ptNo);
			    	System.out.println("1번 차감될 ptBalance : " + ptBalance);
			    	System.out.println("po.getRemainUsePoint : " + po.getRemainUsePoint());
			    	
			    	int ptbupdate = ps.updatePointBalance(po);
			    	System.out.println("최초 usePoint 차감 ptbupdate : " + ptbupdate);
			    	
//			    	newPo.setUpNo(upNo);
//			    	newPo.setUsePointDetail(ptBalance);
//			    	System.out.println("확인용 upNo : " + newPo.getUpNo());
//			    	System.out.println("확인용 ptNo : " + newPo.getPtNo());
//			    	
//			    	int usePointDetailInsert = ps.usePointDetail(newPo);
//			    	System.out.println("usePointDetailInsert : " + usePointDetailInsert);
			    	
			    	int usePointDetailInsert = 0;
			    	
			    	if(ptBalance <= usePoint) {
		    			
			    		newPo.setUpNo(upNo);
			    		newPo.setUsePointDetail(ptBalance);
			    		System.out.println("확인용 upNo : " + newPo.getUpNo());
				    	System.out.println("확인용 ptNo : " + newPo.getPtNo());
			    		
			    		usePointDetailInsert = ps.usePointDetail(newPo);
				    	System.out.println("usePointDetailInsert : " + usePointDetailInsert);
				    	
		    		}else {
		    			
		    			newPo.setUpNo(upNo);
			    		newPo.setUsePointDetail(usePoint);
			    		System.out.println("확인용 upNo : " + newPo.getUpNo());
				    	System.out.println("확인용 ptNo : " + newPo.getPtNo());
			    		
			    		usePointDetailInsert = ps.usePointDetail(newPo);
				    	System.out.println("usePointDetailInsert : " + usePointDetailInsert);
		    			
		    		}
			    	
			    	
			    	int remainUsePoint = usePoint - ptBalance;
			    	po.setRemainUsePoint(remainUsePoint);
			    	
			    	System.out.println("최초 차감 후 remainUsePoint : " + remainUsePoint);
			    	
//				    if(remainUsePoint >= 0) {
//				    	int ptBalance2 = ps.selectPointBalance(mbNo);
//				    	System.out.println("2번 차감될 ptBalance : " + ptBalance2);
//				    	
//				    	ptbupdate = ps.updatePointBalance(po);
//				    	System.out.println("2번 포인트 차감 ptbupdate2 : " + ptbupdate);
//				    	
//				    	remainUsePoint = remainUsePoint - ptBalance2;
//				    	po.setRemainUsePoint(remainUsePoint);
//				    	
//				    	System.out.println("2번 차감 후 remainUsePoint : " + remainUsePoint);
				    	
				    	while(remainUsePoint > 0) {
				    		
//				    		ptBalance = ps.selectPointBalance(mbNo);
				    		
				    		newPo = ps.selectPointBalance(mbNo);
				    		ptBalance = newPo.getPtBalance();
				    		ptNo = newPo.getPtNo();
				    		
				    		System.out.println("ptBalance : " + ptBalance);
				    		System.out.println("ptNo : " + ptNo);
				    		po.setPtBalance(ptBalance);
				    		
				    		ptbupdate = ps.updatePointBalance(po);
				    		System.out.println("ptbupdate : " + ptbupdate);
				    		
				    		if(ptBalance <= remainUsePoint) {
				    			
					    		newPo.setUpNo(upNo);
					    		newPo.setUsePointDetail(ptBalance);
					    		usePointDetailInsert = ps.usePointDetail(newPo);
						    	System.out.println("usePointDetailInsert : " + usePointDetailInsert);
						    	
				    		}else {
				    			
				    			newPo.setUpNo(upNo);
					    		newPo.setUsePointDetail(remainUsePoint);
					    		usePointDetailInsert = ps.usePointDetail(newPo);
						    	System.out.println("usePointDetailInsert : " + usePointDetailInsert);
				    			
				    		}
				    		
				    		remainUsePoint -= ptBalance;
				    		
				    		System.out.println("다음 차감될 remainUsePoint : " + remainUsePoint);
				    		
				    		po.setRemainUsePoint(remainUsePoint);
				    		
				    	}
				    	
//				    }
				    
		        }
		        
			    if(value <= 0 || value2 <=0 || value3 <= 0) {
			        ps.payMentCancle(token, po.getOdNo(), po.getPmNo(), amount, "결제 금액 오류", po);
			            		
			        int value5 = ps.paymentCancleInsert(po);
			        System.out.println("결제취소 : " + value5);
			    }
			    
//			    path = "redirect:/userOrderList";
	        }
	        
	    } else if(session.getAttribute("mbNo") == null) {	// 비회원
	    	
	        if (!Integer.toString(po.getOdPrice()).equals(amount)) {	// 결제금액 불일치
	        	
	        	ps.payMentCancle(token, po.getOdNo(), po.getPmNo(), amount, "결제 금액 오류", po);
	        	
		    	int value1 = ps.nonmember(po);
		    	System.out.println("비회원정보 : " + value1);
		    	System.out.println("nmNo : " + po.getNmNo());
		    	
			    int value2 = ps.nonUserOrderInsert(po);
			   System.out.println("비회원 주문정보 : " + value2);
			    	
			    int value3 = ps.payment(po);
				System.out.println("결제정보 : " + value3);
			    		
			    int value4 = ps.paymentCancleInsert(po);
	            System.out.println("주문취소 : " + value4);
	            
//	            path = "redirect:/findtrainer";
		    	
	    	}else {	//결제금액 일치 정상결제 진행
	    		int value = ps.nonmember(po);
		    	System.out.println("비회원정보 : " + value);
		    	System.out.println("nmNo : " + po.getNmNo());
	    		
	            int value2 = ps.nonUserOrderInsert(po);
	            System.out.println("비회원주문정보 : " + value2);
	            
	            int value3 = ps.payment(po);
			    System.out.println("결제정보 : " + value3);
			    
			    if(value <= 0 || value2 <= 0 || value3 <= 0) {
			    	
			    	ps.payMentCancle(token, po.getOdNo(), po.getPmNo(), amount, "결제 금액 오류", po);
			    		
			    	int value4 = ps.paymentCancleInsert(po);
	            	System.out.println("value4 : " + value4);
            	
			    }
			    
//			    path = "redirect:/findtrainer";
			    
	    	}
	        
	    }
//		return path;
	}
	
	@RequestMapping(value = "userPaymentCancle")
	public void userPaymentCancle(@RequestBody PaymentDTO po, HttpSession session) throws Exception {
		
		Integer mbNo = (Integer) session.getAttribute("mbNo");
		System.out.println("mbNo : " + mbNo);
		
		String token = ps.getToken();
        System.out.println("토큰 : " + token);
        
        String amount = ps.paymentInfo(po.getPmNo(), token);
        
        System.out.println("amount : " + amount);
        
        ps.payMentCancle(token, po.getOdNo(), po.getPmNo(), amount, "회원 결제 취소", po);
        
        int value = ps.paymentStateUpdate(po);
        int value2 = ps.paymentCancleInsert(po);
	            
        System.out.println("value : " + value);
        System.out.println("value2 : " + value2);
        
        // 멤버번호 < session에서 가져옴, ptPoint < 사용포인트에서 가져옴
        String mbAuth = (String)session.getAttribute("mbAuth");
		System.out.println("mbAuth : " + mbAuth);
		if(mbNo != null) {
			
			if(mbAuth.equals("U")) {
				po.setMbNo(mbNo);
				System.out.println("usePointMbNo : " + po.getMbNo());
			}else if(mbAuth.equals("T")) {
				mbNo = po.getOrderUserMbNo();
				po.setMbNo(mbNo);
				System.out.println("orderUserMbNo_ajax : " + mbNo);
			}
	        PaymentDTO newPo = ps.selectUsePoint(po);
	       	int usePoint = newPo.getOdPoint();
	        System.out.println("usePoint : " + usePoint);
	        
	        if(usePoint >0) {
		        newPo.setMbNo(mbNo);
		        newPo.setPtContent("포인트 환불");
		        newPo.setPtPoint(usePoint);
		        
		        int value3 = ps.pointInsert(newPo);
		        System.out.println("포인트 환불 : " + value3);
	        }
		}
        
	}
}
