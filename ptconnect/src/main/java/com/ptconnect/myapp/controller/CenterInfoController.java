package com.ptconnect.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.CenterService;
import com.ptconnect.myapp.service.TrainerService;

@Controller
public class CenterInfoController {
	
	@Autowired
	TrainerService ts;
	@Autowired
	CenterService cs;
	
	@RequestMapping(value = "centerInfo", method = RequestMethod.GET)
	public String centerInfo(HttpSession session, Model model) {
		
		int mbNo = Integer.parseInt(session.getAttribute("mbNo").toString());
		System.out.println("mbNo : " + mbNo);
		
		MemberDTO mo = ts.memberSelectOne(mbNo);
		
		if(cs.centerSelectOne(mbNo) != null) {
			
			CenterInfoDTO cio = cs.centerSelectOne(mbNo);
			System.out.println("ctdelyn : " + cio.getCtDelYN());
			
			
			model.addAttribute("cio",cio);			
		}
		
		System.out.println("mbName :" + mo.getMbName());
		model.addAttribute("mo",mo);
		
		
		return "centerMypage/centerInfo";
	}

}
