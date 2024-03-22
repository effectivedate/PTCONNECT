package com.ptconnect.myapp.controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.service.MemberService;

@Controller
public class UserPwdModifyController {
	@Autowired
	MemberService ms;
	@Autowired
	private BCryptPasswordEncoder bCrptPasswordEncoderer;

	@ResponseBody
	@RequestMapping(value="memberPwdCheck.ajax", method=RequestMethod.POST)
	public JSONObject memberPwdCheck(
			@RequestParam("mbPwd") String pwd,
			HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		Integer mbNo = (Integer) session.getAttribute("mbNo");
		MemberDTO mo = ms.memberPwdCheck(mbNo);
		JSONObject jo = new JSONObject();
		if(mo!=null) {
			if(bCrptPasswordEncoderer.matches(pwd, mo.getMbPwd())) {
				session.setAttribute("PCA", "T");
				jo.put("msg", "인증이 완료되었습니다.");
				jo.put("value",1);
				return jo;
			}else {
				jo.put("msg", "비밀번호가 일치하지 않습니다..");
				jo.put("value",0);
				return jo;
			}
		}else{
			jo.put("msg", "권한오류");
			jo.put("value",2);
			return jo;
		}
		
	}
	

	@RequestMapping(value = "userPwdModify", method = RequestMethod.GET)
	public String userPwdModify() {
		return "userMypage/userPwdModify";
	}
	
	@RequestMapping(value = "trainerPwdModify", method = RequestMethod.GET)
	public String trainerPwdModify() {
		return "trainerMypage/trainerPwdModify";
	}
	
	@RequestMapping(value = "centerPwdModify", method = RequestMethod.GET)
	public String centerPwdModify() {
		return "centerMypage/centerPwdModify";
	}
	
	@ResponseBody
	@RequestMapping(value = "pwdModifyAction", method = RequestMethod.POST)
	public JSONObject memberPwdUpdate(
			@RequestBody MemberDTO mo,
			BindingResult bindingResult,
			HttpSession session) {
		JSONObject jo = new JSONObject();
		if(mo == null) {
			bindingResult.addError(new FieldError("mo","mbPwd","비밀번호를 입력해주세요."));
		}else if(mo.getMbPwd().equals("")) {
			bindingResult.addError(new FieldError("mo","mbPwd","비밀번호를 입력해주세요."));
		}else if(!Pattern.matches("^[A-Za-z[0-9]$@$!%*#?&]{8,15}$",mo.getMbPwd())) {
			bindingResult.addError(new FieldError("mo","mbPwd","8자~15자의 비밀번호를 입력해주세요."));
		}
		
		// 벨리데이션 체크
		if(bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			System.out.println(fieldError);
			jo.put("value", 2);
			jo.put("errMsg", fieldError.getDefaultMessage());
			jo.put("err", fieldError);
			return jo;
		}
		if(session.getAttribute("mbNo") != null) {
			
			session.removeAttribute("PCA");
			String mbPwd = bCrptPasswordEncoderer.encode(mo.getMbPwd());
			mo.setMbPwd(mbPwd);
			mo.setMbNo((int)session.getAttribute("mbNo"));
			jo.put("value", ms.memberPwdUpdate(mo));
		}else {
			jo.put("value", 0);
		}
		
		
		return jo;
	}
	
}
