package com.ptconnect.myapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptconnect.myapp.domain.CenterInfoDTO;
import com.ptconnect.myapp.domain.MemberDTO;
import com.ptconnect.myapp.domain.TrainerInfoDTO;
import com.ptconnect.myapp.service.MemberService;
import com.ptconnect.myapp.service.TrainerService;
import com.ptconnect.myapp.util.MailSender;

@Controller
public class MemberController {

	@Autowired
	MemberService ms;
	@Autowired
	TrainerService ts;
	@Autowired
	MailSender mail;
	@Autowired
	private BCryptPasswordEncoder bCrptPasswordEncoderer;
	
	@RequestMapping(value = "joinUser", method = RequestMethod.GET)
	public String joinUser() {
		return "member/joinUser";
	}
	@RequestMapping(value = "joinTrainer", method = RequestMethod.GET)
	public String joinTrainer() {
		return "member/joinTrainer";
	}
	
	@RequestMapping(value = "joinCenter", method = RequestMethod.GET)
	public String joinCenter() {
		return "member/joinCenter";
	}
	@ResponseBody
	@RequestMapping(value = "memberEmailCheck.ajax", method = RequestMethod.POST)
	public JSONObject memberEmailCheck(@RequestParam("mbEmail") String email,
			HttpSession session) {
		int value = 0;
		
		value = ms.memberEmailCheck(email);
		JSONObject jo = new JSONObject();
		if (value == 0) {
			String authNumber = mail.getTempPassword();
	        String title = "회원가입 인증 메일입니다.";
	        String body = "인증번호 : " + authNumber;

	        if (mail.MailSend(email, title, body)) {
	            session.removeAttribute("MAIL_NUMBER");
	            session.setAttribute("MAIL_NUMBER", authNumber);
	            System.out.println((String)session.getAttribute("MAIL_NUMBER"));
	            System.out.println("send mail ok");
	        }else {
	        	value=5;
	        }
	    }
		jo.put("value", value);
		return jo;
	}

	@ResponseBody
	@RequestMapping(value = "getsign.ajax", method = RequestMethod.POST)
	public JSONObject getsign(@RequestParam("AuthCode") String code,
			HttpSession session) {
		int value = 0;
		if(code != null) {
			if(code.equals(session.getAttribute("MAIL_NUMBER"))) {
				value=1;
			}else {
				value=2;
			}
		}
		JSONObject jo = new JSONObject();
		jo.put("value", value);
		return jo;
	}

	@ResponseBody
	@RequestMapping(value = "joinUserAction.ajax", method = RequestMethod.POST)
	public JSONObject joinUserAction(@RequestBody @Valid MemberDTO mo,
			 BindingResult bindingResult,
				HttpSession session) {
		int value = 0;
		JSONObject jo = new JSONObject();
		if(mo.getMbEmail() != null) {
			if(session.getAttribute("MAIL_NUMBER")==null) {
				jo.put("msg", "이메일 인증을 진행해주세요.");
			}else if((String)session.getAttribute("MAIL_NUMBER")!=""&&!mo.getMbAuth().equals((String)session.getAttribute("MAIL_NUMBER"))){
				jo.put("msg", "이메일 인증번호를 입력해주세요.");
			}else if(bindingResult.hasErrors()){ // VO로 받은 데이터의 문제가 있을시
				FieldError fieldError = bindingResult.getFieldError();
//				List<ObjectError> allErrors = bindingResult.getAllErrors();
				jo.put("msg", fieldError.getDefaultMessage()); //message를 출력한다.
//				jo.put("error", allErrors);
			}else {
				String mbPwd2 = bCrptPasswordEncoderer.encode(mo.getMbPwd());
				mo.setMbPwd(mbPwd2);
				value=1;		
				ms.memberInsert(mo);		
			}
		}
		jo.put("value", value);
		return jo;
	}
	@ResponseBody
	@RequestMapping(value = "joinTrainerAction.ajax", method = RequestMethod.POST)
	public JSONObject joinTrainerAction(@RequestBody @Valid MemberDTO mo,
			 BindingResult bindingResult,
				HttpSession session) {
		int value = 0;
		JSONObject jo = new JSONObject();
		if(mo.getMbEmail() != null) {
			if(session.getAttribute("MAIL_NUMBER")==null) {
				jo.put("msg", "이메일 인증을 진행해주세요.");
			}else if((String)session.getAttribute("MAIL_NUMBER")!=""&&!mo.getMbAuth().equals((String)session.getAttribute("MAIL_NUMBER"))){
				jo.put("msg", "이메일 인증번호를 입력해주세요.");
			}else if(bindingResult.hasErrors()){ // VO로 받은 데이터의 문제가 있을시
				FieldError fieldError = bindingResult.getFieldError();
				jo.put("msg", fieldError.getDefaultMessage()); //message를 출력한다.
			}else {
				String mbPwd2 = bCrptPasswordEncoderer.encode(mo.getMbPwd());
				mo.setMbPwd(mbPwd2);
				value=1;		
				ms.trainerInsert(mo);		
			}
		}
		jo.put("value", value);
		return jo;
	}
	@ResponseBody
	@RequestMapping(value = "joinCenterAction.ajax", method = RequestMethod.POST)
	public JSONObject joinCenterAction(@RequestBody @Valid CenterInfoDTO cio,
			 BindingResult bindingResult,
				HttpSession session) {
		int value = 0;
		JSONObject jo = new JSONObject();
		if(cio.getMbEmail() != null) {
			if(session.getAttribute("MAIL_NUMBER")==null) {
				jo.put("msg", "이메일 인증을 진행해주세요.");
			}else if((String)session.getAttribute("MAIL_NUMBER")!=""&&!cio.getMbAuth().equals((String)session.getAttribute("MAIL_NUMBER"))){
				jo.put("msg", "이메일 인증번호를 입력해주세요.");
			}else if(bindingResult.hasErrors()){ // VO로 받은 데이터의 문제가 있을시
				FieldError fieldError = bindingResult.getFieldError();
				jo.put("msg", fieldError.getDefaultMessage()); //message를 출력한다.
			}else {
				String mbPwd2 = bCrptPasswordEncoderer.encode(cio.getMbPwd());
				cio.setMbPwd(mbPwd2);
				value=1;		
				ms.centerInsert(cio);
			}
		}
		jo.put("value", value);
		return jo;
	}
	
	

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		session.removeAttribute("nmNo");
		return "member/login";
	}

	@RequestMapping(value = "loginAction", method = RequestMethod.POST)
	public String loginAction(
			@RequestParam("mbEmail") String mbEmail,
			@RequestParam("mbPwd") String mbPwd,
			@RequestParam("cate") String cate,
			HttpSession session, HttpServletRequest request, 
			HttpServletResponse response, 
			RedirectAttributes rttr,
			Model model) throws IOException {

		PrintWriter out = response.getWriter(); 
		MemberDTO mo = ms.memberLogin(mbEmail);
		String path = "";
		if(mo!=null) {
			if(bCrptPasswordEncoderer.matches(mbPwd, mo.getMbPwd())) {

				session.setAttribute("mbNo", mo.getMbNo());
				session.setAttribute("mbAuth", mo.getMbAuth());
				session.setAttribute("mbName", mo.getMbName());
				session.setAttribute("mbMapY", mo.getMbMapY());
				session.setAttribute("mbMapX", mo.getMbMapX());
				if (mo.getMbAuth().equals("T")) {
					System.out.println("mo.getMbAuth T true");
					System.out.println("mbNo : " + mo.getMbNo());
					TrainerInfoDTO tio = ts.trainerSelectOne(mo.getMbNo());
					if(tio!=null) {
						session.setAttribute("tnNo", tio.getTnNo());
						session.setAttribute("tnCtNo", tio.getCtNo());
						System.out.println("tnCtNo : " + tio.getCtNo());
					}
				}
				path = "findTrainer";
			}else {

				response.setContentType("text/html; charset=UTF-8");
				out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
				out.flush();
//				rttr.addFlashAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
//				rttr.addFlashAttribute("mbEmail",mbEmail);
//				rttr.addFlashAttribute("cate",cate);
//				path = "login";
			}
		}else{
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
			out.flush();
//			rttr.addFlashAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
//			rttr.addFlashAttribute("mbEmail",mbEmail);
//			rttr.addFlashAttribute("cate",cate);
//			path = "login";
		}
		
		return "redirect:/"+path;
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(
			HttpSession session) {
		session.removeAttribute("mbNo");
		session.removeAttribute("mbAuth");
		session.removeAttribute("mbName");
		session.removeAttribute("mbMapX");
		session.removeAttribute("mbMapY");
		session.removeAttribute("nmNo");
		session.removeAttribute("nmName");
		session.removeAttribute("tnNo");
		session.removeAttribute("tnCtNo");
		session.removeAttribute("PCA");
		return "redirect:/findTrainer";
	}
	
	@RequestMapping(value = "idFind", method = RequestMethod.GET)
	public String idFind() {
		return "member/idFind";
	}
	
	@ResponseBody
	@RequestMapping(value = "emailFindCheck.ajax", method = RequestMethod.POST)
	public JSONObject emailFindCheck(@RequestBody MemberDTO mo,
			BindingResult bindingResult) {
		JSONObject jo = new JSONObject();
		if(mo==null) {
	    	jo.put("msg","이름,전화번호를 입력해주세요.");
		}else if(mo.getMbName()==null||mo.getMbPhone()==null){
	    	jo.put("msg","이름,전화번호를 입력해주세요.");
		}else {
			String mbEmail = ms.memberEmailFind(mo.getMbName(), mo.getMbPhone());
			if (mbEmail != null) {
		        String star = "";
		        String[] mbId = mbEmail.split("@");
		        for (int i = 0; i < (mbId[0].length() - 4); i++) {
		            star += "*";
		        }
		        String mbId0 = mbId[0].substring(0, 2) + star + mbId[0].substring(mbId[0].length() - 2);
		        mbEmail = mbId0 + "@" + mbId[1];
		        
			    //아이디 일부 가리기
		        jo.put("mbEmail",mbEmail);
		    }else {
		    	jo.put("msg","일치하는 이메일이 없습니다.");
		    }
		}
		return jo;
	}
	@RequestMapping(value = "pwdFind", method = RequestMethod.GET)
	public String pwdFind() {
		return "member/pwdFind";
	}

	@ResponseBody
	@RequestMapping(value = "pwdFindCheck.ajax", method = RequestMethod.POST)
	public JSONObject pwdFindCheck(@RequestBody MemberDTO mo,
			BindingResult bindingResult,
			HttpSession session) {
		JSONObject jo = new JSONObject();
		if(mo==null) {
	    	jo.put("msg","이메일,전화번호를 입력해주세요.");
		}else if(mo.getMbEmail()==null||mo.getMbPhone()==null){
	    	jo.put("msg","이메일,전화번호를 입력해주세요.");
		}else {
			int value = ms.memberPwdFind(mo.getMbEmail(), mo.getMbPhone());
			System.out.println(mo.getMbEmail());
			System.out.println(mo.getMbPhone());
			System.out.println(value);
			if(value>0) {
				String authNumber = mail.getTempPassword();
		        String title = "임시 비밀번호입니다.";
		        String body = "임시 비밀번호 : " + authNumber;

		        if (mail.MailSend(mo.getMbEmail(), title, body)) {
		            session.removeAttribute("MAIL_PWD");
		            session.setAttribute("MAIL_PWD", authNumber);
		            session.setAttribute("mbEmail", mo.getMbEmail());
		            System.out.println((String)session.getAttribute("MAIL_PWD"));
		            System.out.println("send mail ok");
					jo.put("value", value);
		        }else {
			    	jo.put("msg","잘못된 계정입니다. 확인해주세요.");
		        }
			}else {
		    	jo.put("msg","일치하는 계정 정보가 없습니다.");
		    	jo.put("value",value);
			}
		}
		return jo;
	}

	@ResponseBody
	@RequestMapping(value = "tempPwdCheck.ajax", method = RequestMethod.POST)
	public JSONObject tempPwdCheck(@RequestParam("mbPwd") String mbPwd,
			HttpSession session) {
		int value = 0;
		if(mbPwd != null) {
			if(mbPwd.equals(session.getAttribute("MAIL_PWD"))) {
				value=1;
			}else {
				value=2;
			}
		}
		JSONObject jo = new JSONObject();
		jo.put("value", value);
		return jo;
	}
	@RequestMapping(value = "pwdFound", method = RequestMethod.GET)
	public String pwdFound(@RequestParam("mbPwd") String mbPwd,
			HttpSession session) {
		String path="";
		if(mbPwd != null) {
			if(mbPwd.equals(session.getAttribute("MAIL_PWD"))) {
				String mbEmail=(String)session.getAttribute("mbEmail");
				session.removeAttribute("mbEmail");
				session.removeAttribute("MAIL_PWD");
				session.setAttribute("PCA", "T");
				MemberDTO mo = ms.memberLogin(mbEmail);
				session.setAttribute("mbNo", mo.getMbNo());
				session.setAttribute("mbAuth", mo.getMbAuth());
				session.setAttribute("mbName", mo.getMbName());
				session.setAttribute("mbMapY", mo.getMbMapY());
				session.setAttribute("mbMapX", mo.getMbMapX());
				if(mo.getMbAuth().equals("U")) {
					path="userPwdModify";
				}else if(mo.getMbAuth().equals("T")) {
					path="trainerPwdModify";
				}else if(mo.getMbAuth().equals("C")) {
					path="centerPwdModify";
				}
				
			}else {
				path="/error/authError";
			}
		}
		return "redirect:/"+path;
	}
	
	@RequestMapping(value = "/adminLoginAction", method=RequestMethod.POST)
	public String adminLoginAction(@RequestParam("mbEmail") String mbEmail,
			@RequestParam("mbPwd") String mbPwd,
			RedirectAttributes rttr,
			HttpSession session) {
		MemberDTO mo = ms.memberLogin(mbEmail);
		String path = "";
		if(mo!=null) {
			if(bCrptPasswordEncoderer.matches(mbPwd, mo.getMbPwd())) {

				session.setAttribute("mbNo", mo.getMbNo());
				session.setAttribute("mbAuth", mo.getMbAuth());
				session.setAttribute("mbName", mo.getMbName());
				session.setAttribute("mbMapY", mo.getMbMapY());
				session.setAttribute("mbMapX", mo.getMbMapX());
				path = "admin/admin_index";
			}else {
				rttr.addFlashAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
				rttr.addFlashAttribute("mbEmail",mbEmail);
				path = "admin/admin_login";
			}
		}else{
			rttr.addFlashAttribute("errMsg","아이디 또는 비밀번호가 일치하지 않습니다.");
			rttr.addFlashAttribute("mbEmail",mbEmail);
			path = "admin/admin_login";
		}
		
		return "redirect:/"+path;
	}
}
