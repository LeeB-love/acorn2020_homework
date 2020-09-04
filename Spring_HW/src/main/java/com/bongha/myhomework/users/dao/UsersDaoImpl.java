package com.bongha.myhomework.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bongha.myhomework.users.dto.UsersDto;

//dao에 붙이는 어노테이션 - @Repository
@Repository
public class UsersDaoImpl implements UsersDao{

	//의존객체 SqlSession 주입
	@Autowired
	private SqlSession session;
	
	//전체 회원 리스트 가져오기
	@Override
	public List<UsersDto> getList() {
		return session.selectList("users.getList");
	}

	//회원 한 명의 정보 가져오기
	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	//회원 추가
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
		
	}

	//회원 삭제
	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
		
	}

	//회원 정보 업뎃
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
		
	}

	//아이디 중복 검사
	@Override
	public boolean isExist(String inputId) {
		String id = session.selectOne("users.isExist", inputId);
		if(id==null) {
			//중복되는 아이디가 없으면 false
			return false;
		}else {
			//중복되는 아이디가 있으면 true
			return true;
		}
	}

	//비번 수정
	@Override
	public boolean updatePwd(UsersDto dto) {
		int result = session.update("users.updatePwd", dto);
		if(result == 0) {
			return false;
		}else {
			return true;
		}
		
	}

}
