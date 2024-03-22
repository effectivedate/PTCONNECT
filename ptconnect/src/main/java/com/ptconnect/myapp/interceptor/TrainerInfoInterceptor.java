package com.ptconnect.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//�α��� üũ ���� ���ͼ��� Ŭ���� 
public class TrainerInfoInterceptor  extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
			) throws Exception{
		
		HttpSession session = request.getSession();
		if (request.getRequestURI().equals("/ptconnect/trainerInfoModify")) {
			if (session.getAttribute("tnNo") == null) {

				String location =request.getContextPath()+"/trainerInfoWrite";
				response.sendRedirect(location);
				return false;			
			}else {
				return true;
			}
		}
		if (request.getRequestURI().equals("/ptconnect/trainerInfoWrite")) {
			if (session.getAttribute("tnNo") != null) {

				String location =request.getContextPath()+"/trainerInfoModify";
				response.sendRedirect(location);
				return false;			
			}else {
				return true;
			}
		}
		return true;
	}

}
