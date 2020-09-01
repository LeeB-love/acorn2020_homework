package com.bongha.myhomework.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bongha.myhomework.users.dto.UsersDto;

public interface UsersService {

	public void getUsersList(ModelAndView mView);
	public void getUserInfo(HttpServletRequest request, ModelAndView mView);
	
	public void addUser(UsersDto dto);
	public void deleteUser(HttpServletRequest request);
	public void updateUser(HttpServletRequest request, UsersDto dto);
	
	public Map<String, Object> isExistId(String inputId);
	public void updateUsersPwd(HttpServletRequest request, UsersDto dto, ModelAndView mView);
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile);
}
