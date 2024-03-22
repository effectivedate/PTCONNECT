package com.ptconnect.myapp.interceptor;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {
		
//	@Override   
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
//		
//		String mbNo = "";
//		String mbAuth = "";
//		String mbName = "";
//		String mbMapY = "";
//		String mbMapX = "";
//		if(modelAndView.getModel().get("mbNo") != null) {
//			mbNo = modelAndView.getModel().get("mbNo").toString();
//		}
//		if(modelAndView.getModel().get("mbAuth") != null) {
//			mbAuth = modelAndView.getModel().get("mbAuth").toString();
//		}
//		if(modelAndView.getModel().get("mbName") != null) {
//			mbName = modelAndView.getModel().get("mbName").toString();
//		}
//		if(modelAndView.getModel().get("mbMapY") != null) {
//			mbMapY = modelAndView.getModel().get("mbMapY").toString();
//		}
//		if(modelAndView.getModel().get("mbMapX") != null) {
//			mbMapX = modelAndView.getModel().get("mbMapX").toString();
//		}
//		
//		
//		modelAndView.getModel().clear();  
//		
//		if(mbNo!=null){
//
//			request.getSession().setAttribute("mbNo", mbNo);
//			request.getSession().setAttribute("mbAuth", mbAuth);
//			request.getSession().setAttribute("mbName", mbName);
//			request.getSession().setAttribute("mbMapY", mbMapY);
//			request.getSession().setAttribute("mbMapX", mbMapX);	
//		}
//	}
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();	
		boolean tf = false;	 
		if(session != null){
			if (session.getAttribute("mbAuth") == null) {
				session.removeAttribute("mbNo");
				session.removeAttribute("mbAuth");
				session.removeAttribute("mbName");
				session.removeAttribute("mbMapY");
				session.removeAttribute("mbMapX");
				tf = true;			
			}else {
				tf = false;
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter(); 
				out.println("<script>alert('접근오류입니다.'); history.go(-1);</script>");
				out.flush();
			}
		}else {
			tf=true;
		}
		return tf;	
	}


}
