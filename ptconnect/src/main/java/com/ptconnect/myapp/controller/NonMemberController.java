package com.ptconnect.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptconnect.myapp.domain.NonMemberDTO;
import com.ptconnect.myapp.domain.PaymentDTO;
import com.ptconnect.myapp.service.MemberService;

@Controller
public class NonMemberController {
	
	@Autowired
	MemberService ms;
	

	@RequestMapping(value = "nonLoginAction", method = RequestMethod.POST)
	public String nonLoginAction(
			@RequestParam("nmPhone") String nmPhone,
			@RequestParam("nmPwd") String mbPwd,
			HttpSession session, HttpServletRequest request, 
			HttpServletResponse response, 
			RedirectAttributes rttr,
			Model model) {

		NonMemberDTO nmo = ms.nonMemberLogin(nmPhone);
		String path = "";
		if(nmo!=null) {
			if(mbPwd.equals(nmo.getNmPwd())) {

				session.setAttribute("nmNo", nmo.getNmNo());
				session.setAttribute("nmName", nmo.getNmName());
				path = "nonMemberMypage";
			}else {
				rttr.addFlashAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
				path = "login";
			}
		}else{
			rttr.addFlashAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
			path = "login";
		}
		
		return "redirect:/"+path;
	}

	@RequestMapping(value = "nonMemberMypage", method = RequestMethod.GET)
	public String nonMemberMypage(HttpSession session) {
		int nmNo = (int)session.getAttribute("nmNo");
		ArrayList<PaymentDTO> pList = ms.nonMemberOrderList(nmNo);
		session.setAttribute("pList", pList);
		for(PaymentDTO po : pList) {
			System.out.println(po.getNmNo());
			System.out.println(po.getOdNo());
		}
		return "member/nonMemberMypage";
	}

}
