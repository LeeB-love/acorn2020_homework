package com.bongha.myhomework.users.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bongha.myhomework.users.dto.UsersDto;
import com.bongha.myhomework.users.service.UsersService;

@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;
	
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
	
	//회원가입 요청 처리
	@RequestMapping("/users/signup")
	public ModelAndView signup(ModelAndView mView, UsersDto dto) {
		usersService.addUser(dto);
		mView.setViewName("/users/signup");
		return mView;
	}
	
	//=====로그인 관련===========
	
	//로그인 폼 요청 처리
	@RequestMapping("/users/loginform")
	public String loginform(HttpServletRequest request) {
		// url 파라미터가 넘어오는지 읽어와 보기 
		String url=request.getParameter("url");
		if(url==null){//목적지 정보가 없다면
			String cPath=request.getContextPath();
			url=cPath+"/home.do"; //로그인후 인덱스 페이지로 가도록 하기 위해 
		}
		//request 에 담는다. 
		request.setAttribute("url", url);
		return "users/loginform";
	}
	
	@RequestMapping("/users/login")
	public ModelAndView login(UsersDto dto, ModelAndView mView, HttpSession session, HttpServletRequest request) {
		//로그인후 가야하는 목적지 정보
		String url=request.getParameter("url");
		//목적지 정보도 미리 인코딩 해 놓는다.
		String encodedUrl=URLEncoder.encode(url);
		//view  페이지에 전달하기 위해 ModelAndView 객체에 담아준다. 
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		//service 객체를 이용해서 로그인 관련 처리를 한다.
		usersService.loginProcess(dto, mView, session);
		mView.setViewName("users/login");
		return mView;
	}

	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
	
	
	//===== 개인정보 페이지 관련===========
	
	//개인정보 페이지 요청처리
	@RequestMapping("/users/private/info")
	public ModelAndView info(HttpServletRequest request, ModelAndView mView) {
		usersService.getUserInfo(request, mView);
		mView.setViewName("/users/private/info");
		return mView;
	}

	//비밀번호 변경 폼 요청처리
	@RequestMapping("/users/private/pwd_updateform")
	public String pwdUpdateForm() {
		return "users/private/pwd_updateform";
	}
	
	//비밀번호 변경 시 현재 비밀번호 확인
	@RequestMapping("/users/private/checkPwd")
	@ResponseBody
	public Map<String, Object> checkPwd(@RequestParam String inputPwd, HttpServletRequest request){
		return usersService.isValidPwd(inputPwd, request);
	}
	
	//비밀번호 변경 요청
	@RequestMapping("/users/private/pwd_update")
	public ModelAndView pwdUpdate(ModelAndView mView, UsersDto dto, HttpServletRequest request) {
		usersService.updateUsersPwd(request, dto, mView);
		mView.setViewName("users/private/pwd_update");
		return mView;
	}
}
