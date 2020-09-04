package com.bongha.myhomework.users.dao;

import java.util.List;

import com.bongha.myhomework.users.dto.UsersDto;

public interface UsersDao {
	public List<UsersDto> getList();
	public UsersDto getData(String id);
	
	public void insert(UsersDto dto);
	public void delete(String id);
	public void update(UsersDto dto);

	public boolean isExist(String inputId);
	public boolean updatePwd(UsersDto dto);
	
}
