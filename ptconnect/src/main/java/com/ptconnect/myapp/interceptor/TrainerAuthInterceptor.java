package com.ptconnect.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//�α��� üũ ���� ���ͼ��� Ŭ���� 
public class TrainerAuthInterceptor  extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception{
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("mbAuth") == null) {

			String location =request.getContextPath()+"/error/loginAuthError";
			response.sendRedirect(location);			
			return false;			
		}else if(!"T".equals((String)session.getAttribute("mbAuth"))){
			String location =request.getContextPath()+"/error/authError";
			response.sendRedirect(location);
			return false;			
		}	
		return true;
	}
	

	public void saveUrl(HttpServletRequest req) {
		
		String uri = req.getRequestURI();   //
		System.out.println(uri);
		String query =req.getQueryString();  //
		System.out.println(query);
		
		if (query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" +query;
		}
		System.out.println(uri+query);
		
		if (req.getMethod().equals("GET")) {   
			req.getSession().setAttribute("saveUrl", uri+query);
		}		
	}
	
	
	
	
}
