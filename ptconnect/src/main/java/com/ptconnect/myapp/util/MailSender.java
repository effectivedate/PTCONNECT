package com.ptconnect.myapp.util;


public interface MailSender {
	public boolean MailSend(String to,String title,String body);
	public String getTempPassword();
}