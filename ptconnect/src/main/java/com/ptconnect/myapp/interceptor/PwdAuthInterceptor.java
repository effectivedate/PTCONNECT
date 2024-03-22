package com.ptconnect.myapp.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//�α��� üũ ���� ���ͼ��� Ŭ���� 
public class PwdAuthInterceptor  extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception{
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("PCA") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('잘못된 접근입니다!'); history.go(-1);</script>");
			out.flush();		
			return false;			
		}else if(!"T".equals((String)session.getAttribute("PCA"))){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('잘못된 접근입니다!'); history.go(-1);</script>");
			out.flush();		
			return false;			
		}
		
		
		return true;
	}
	

	public void saveUrl(HttpServletRequest req) {
		
		String uri = req.getRequestURI();   //주소창의 프로젝트명+파일경로 ex) spring0803/board/boardList.do
		System.out.println(uri);
		String query =req.getQueryString();  //주소창의 parameter 부분
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
