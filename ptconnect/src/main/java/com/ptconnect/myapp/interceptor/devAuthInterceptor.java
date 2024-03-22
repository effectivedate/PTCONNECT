package com.ptconnect.myapp.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class devAuthInterceptor  extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception{
				

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		out.println("<script>alert('현재 개발중인 페이지입니다!'); history.go(-1);</script>");
		out.flush();
		
		return false;
	}
//	
//
//	public void saveUrl(HttpServletRequest req) {
//		
//		String uri = req.getRequestURI();   //주소창의 프로젝트명+파일경로 ex) spring0803/board/boardList.do
//		System.out.println(uri);
//		String query =req.getQueryString();  //주소창의 parameter 부분
//		System.out.println(query);
//		
//		if (query == null || query.equals("null")) {
//			query = "";
//		}else {
//			query = "?" +query;
//		}
//		System.out.println(uri+query);
//		
//		if (req.getMethod().equals("GET")) {   
//			req.getSession().setAttribute("saveUrl", uri+query);
//		}		
//	}
//	
	
	
	
}
