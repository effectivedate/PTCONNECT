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

import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.service.OrderService;

@Controller
public class UserOrderListController {
	@Autowired
	OrderService os;
	
	@RequestMapping(value = "userOrderList{page}")
	public String userOrderList(@PathVariable int page, 
								@RequestParam(required = false) String startDate,
					            @RequestParam(required = false) String endDate,
					            Model model,
								HttpSession session) {
		
		int mbNo = (int)session.getAttribute("mbNo");
		String mbAuth = (String)session.getAttribute("mbAuth");
		System.out.println("mbAuth : " + mbAuth);
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		
		scri.setMbNo(mbNo);
		scri.setStartDate(startDate);
		scri.setEndDate(endDate);
		scri.setPage(page);
		scri.setPerPageNum(10);
		
		if(scri.getStartDate() != null || scri.getStartDate() != "") {
			System.out.println("startDate : " + scri.getStartDate());
			System.out.println("endDate : " + scri.getEndDate());
		}
		
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(os.userOrderTotalCount(scri));
		
		System.out.println("page : " + page);
		System.out.println("startPage : " + pm.getStartPage());
		System.out.println("endPage : " + pm.getEndPage());
		System.out.println("totalcount : " + pm.getTotalCount());
		
		System.out.println("startDate : " + scri.getStartDate());
		System.out.println("endDate : " + scri.getEndDate());
		
		ArrayList<PaymentDTO> pList = os.userProductList(scri);
		session.setAttribute("pList", pList);
		session.setAttribute("pm", pm);
		model.addAttribute("startDate", scri.getStartDate());
	    model.addAttribute("endDate", scri.getEndDate());
		
		return "userMypage/userOrderList";
	}

}
