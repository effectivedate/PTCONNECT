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

import com.ptconnect.myapp.domain.BoardDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.AdminService;
import com.ptconnect.myapp.service.TrainerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	TrainerService ts;
	@Autowired
	AdminService as;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		ArrayList<TrainerInfoDTO> tio_alist = ts.trainerSelectAll();
		
		int countMember = ts.countMember();
		int countTrainer = ts.countTrainer();
		int countOrder = ts.countOrder();
		
		model.addAttribute("tio_alist", tio_alist);
		model.addAttribute("countMember", countMember);
		model.addAttribute("countTrainer", countTrainer);
		model.addAttribute("countOrder", countOrder);
		
		return "index";
	}
	
	@RequestMapping(value = "/notice{page}")
	public String notice(@PathVariable int page,
						HttpSession session) {
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(10);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.noticeTotalCount());
		ArrayList<BoardDTO> ntList = as.noticeSelectAll(scri);
		System.out.println("ntList : " + ntList);
		
		session.setAttribute("ntList", ntList);
		session.setAttribute("pm", pm);
		
		
		return "/main/notice";
	}
	
	@RequestMapping(value = "/noticeDetail")
	public String noticeDetail(	@RequestParam(name = "bdNo", required = true) int bdNo,
								BoardDTO bdo,
								Model model,
								HttpSession session) {
		
		bdo = as.boardSelectOne(bdNo);
		
		System.out.println("bdo.getNtTitle() : " + bdo.getNtTitle());
		
		model.addAttribute("bdo", bdo);
		
		
		return "/main/noticeDetail";
	}
	
	@RequestMapping(value = "/FAQ{page}")
	public String FAQ(@PathVariable int page,
					HttpSession session) {
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(8);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		pm.setTotalCount(as.FAQTotalCount());
		ArrayList<BoardDTO> fList = as.FAQSelectAll(scri);
		System.out.println("fList : " + fList);
		
		session.setAttribute("fList", fList);
		session.setAttribute("pm", pm);
		
		return "/main/FAQ";
	}
	
}
