package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.FileDetailDTO;
import com.ptconnect.myapp.domain.PageMaker;
import com.ptconnect.myapp.domain.SearchCriteria;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.AdminService;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.TrainerService;



@Controller
public class CenterMyTrainerController {
	@Autowired
	CenterService cs;
	@Autowired
	TrainerService ts;
	@Autowired
	AdminService as;
	
	@RequestMapping(value = "/centerMyTrainer{page}")
	public String trainerRegisterList(@PathVariable int page,
									HttpSession session) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		
		PageMaker pm = new PageMaker();
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setPerPageNum(6);
		pm.setCurrentPage(page);
		pm.setScri(scri);
		
		CenterInfoDTO cio = cs.centerSelectOne(mbNo);
		scri.setCtNo(cio.getCtNo());
		pm.setTotalCount(cs.centerTrainerTotalCount(cio.getCtNo()));
		
		System.out.println("cio.getCtNo() : " + cio.getCtNo());
		
		ArrayList<TrainerInfoDTO> centerTrainerList = cs.centerTrainerInfo(scri);
		
		session.setAttribute("centerTrainerList", centerTrainerList);
		session.setAttribute("pm", pm);
		
		return "centerMypage/centerMyTrainer";
	}
	
}
