package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.service.OrderService;

@Controller
public class TrainerSalesController {
	
	@Autowired
	OrderService os;
	
//	@RequestMapping(value = "trainerSales", method = RequestMethod.GET)
//	public String trainerSales(HttpSession session) {
//		
//		return "redirect:/trainerMypage/trainerSales/1";
//	}
	
	@RequestMapping(value = "trainerSales{page}")
	public String trainerSales(@PathVariable int page, 
								@RequestParam(required = false) String startDate,
					            @RequestParam(required = false) String endDate,
					            Model model,
								HttpSession session) {
		
		int mbNo = (int)session.getAttribute("mbNo");
		int tnNo = (int)session.getAttribute("tnNo");
		String mbAuth = (String)session.getAttribute("mbAuth");
		System.out.println("mbAuth : " + mbAuth);
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		
		scri.setTnNo(tnNo);
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
		pm.setTotalCount(os.trainerSalesTotalCount(scri));
		
		System.out.println("page : " + page);
		System.out.println("startPage : " + pm.getStartPage());
		System.out.println("endPage : " + pm.getEndPage());
		System.out.println("totalcount : " + pm.getTotalCount());
		
		System.out.println("startDate : " + scri.getStartDate());
		System.out.println("endDate : " + scri.getEndDate());
		
		
		ArrayList<PaymentDTO> trainerSalesList = os.trainerSalesList(scri);
		session.setAttribute("trainerSalesList", trainerSalesList);
		session.setAttribute("pm", pm);
		model.addAttribute("startDate", scri.getStartDate());
	    model.addAttribute("endDate", scri.getEndDate());
		
	        
		return "trainerMypage/trainerSales";
	}
	
//	@RequestMapping(value = "searchByDateRange")
//	public String searchByDateRange(@RequestBody SearchCriteria scri, HttpSession session) {
//		
//		System.out.println("검색startDate : " + scri.getStartDate());
//		System.out.println("검색endDate : " + scri.getEndDate());
//		
//		session.setAttribute("startDate", scri.getStartDate());
//		session.setAttribute("endDate", scri.getEndDate());
//		
//		
//		return "redirect:/trainerSales1?startDate=" + scri.getStartDate() + "&endDate=" + scri.getEndDate();
//	}
	
}