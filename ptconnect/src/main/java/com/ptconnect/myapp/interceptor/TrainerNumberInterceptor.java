package com.ptconnect.myapp.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//�α��� üũ ���� ���ͼ��� Ŭ���� 
public class TrainerNumberInterceptor  extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception{
		
		String location = request.getContextPath()+"/findTrainer";
		if (request.getParameter("tnNo") == null || request.getParameter("tnNo") == "") {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.println("<script>alert('잘못된 접근입니다!'); location.href = '"+location+"';</script>");
			out.flush();
					
			return false;			
		}
		return true;
	}
	
	
	
	
}
