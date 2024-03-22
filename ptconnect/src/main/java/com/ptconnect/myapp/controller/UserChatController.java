package com.ptconnect.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserChatController {
	@RequestMapping(value = "userChat", method = RequestMethod.GET)
	public String example() {
		return "userMypage/userChat";
	}

}
