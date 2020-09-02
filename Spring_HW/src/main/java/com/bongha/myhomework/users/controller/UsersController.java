package com.bongha.myhomework.users.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bongha.myhomework.users.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/users/loginform")
	public String loginform() {
		return "users/loginform";
	}
	
	//=======회원가입 관련============
	
	//회원가입 폼 요청 처리
	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "users/signup_form";
	}
	
	//아이디 중복검사
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		//service의 isExistId가 리턴한 Map객체를 받아서 다시 리턴
		return usersService.isExistId(inputId);
	}
}
