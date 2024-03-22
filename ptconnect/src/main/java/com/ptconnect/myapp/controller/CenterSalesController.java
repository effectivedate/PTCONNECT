package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.AdminService;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.OrderService;
import com.ptconnect.myapp.service.TrainerService;

@Controller
public class CenterSalesController {
	
	@Autowired
	OrderService os;
	@Autowired
	CenterService cs;
	@Autowired
	TrainerService ts;
	@Autowired
	AdminService as;
	
	@RequestMapping(value = "centerSales{page}")
	public String example(@PathVariable int page,
							@RequestParam(required = false) String startDate,
				            @RequestParam(required = false) String endDate,
				            Model model,
							HttpSession session) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(6);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		
		if(scri.getStartDate() != null || scri.getStartDate() != "") {
			System.out.println("startDate : " + scri.getStartDate());
			System.out.println("endDate : " + scri.getEndDate());
		}
		
		CenterInfoDTO cio = cs.centerSelectOne(mbNo);
		scri.setCtNo(cio.getCtNo());
		pm.setTotalCount(cs.centerTrainerTotalCount(cio.getCtNo()));
		
		System.out.println("cio.getCtNo() : " + cio.getCtNo());
		
		ArrayList<TrainerInfoDTO> centerTrainerList = cs.centerTrainerInfo(scri);
		
		// 각 트레이너에 대한 판매 내역을 조회하여 해당 트레이너 객체에 추가
		for (TrainerInfoDTO trainer : centerTrainerList) {
			scri.setTnNo(trainer.getTnNo());
		    ArrayList<PaymentDTO> trainerSalesList = os.centerTrainerSalesList(scri);
		    trainer.setSalesList(trainerSalesList);
		    
		    int totalSales = 0;
		    for (PaymentDTO payment : trainerSalesList) {
		    	totalSales += payment.getOdPrice();
		    }
		    trainer.setTotalSales(totalSales);
		}
		
		
		session.setAttribute("centerTrainerList", centerTrainerList);
		session.setAttribute("pm", pm);
		model.addAttribute("startDate", scri.getStartDate());
	    model.addAttribute("endDate", scri.getEndDate());
	        
		return "centerMypage/centerSales";
	}

}
