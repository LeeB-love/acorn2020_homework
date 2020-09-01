package com.bongha.myhomework.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bongha.myhomework.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {

	@Override
	public void getUsersList(HttpServletRequest request, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getUserInfo(HttpServletRequest request, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addUser(UsersDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(HttpServletRequest request, UsersDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> isExistId(String inputId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUsersPwd(HttpServletRequest request, UsersDto dto, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		// TODO Auto-generated method stub
		return null;
	}

}
