package com.bongha.myhomework.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bongha.myhomework.users.dao.UsersDao;
import com.bongha.myhomework.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;
	
	@Override
	public void getUsersList(ModelAndView mView) {
		List<UsersDto> list = usersDao.getList();
		mView.addObject("list", list);
	}

	@Override
	public void getUserInfo(HttpServletRequest request, ModelAndView mView) {
		String id = (String)request.getSession().getAttribute("id");
		UsersDto dto = usersDao.getData(id);
		mView.addObject("dto", dto);
	}

	@Override
	public void addUser(UsersDto dto) {
		//받은 비밀번호 암호화해서 dao에 전달하기
		String inputPwd = dto.getPwd();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(inputPwd);
		dto.setPwd(encodedPwd);
		
		usersDao.insert(dto);
	}

	@Override
	public void deleteUser(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		usersDao.delete(id);
		
	}

	@Override
	public void updateUser(HttpServletRequest request, UsersDto dto) {
		String id = (String)request.getSession().getAttribute("id");
		dto.setId(id);
		usersDao.update(dto);
		
	}

	@Override
	public Map<String, Object> isExistId(String inputId) {
		//inputId와 기존에 있는 id를 비교하여 결과 boolean값을 map에 담아 리턴
		boolean isExist = usersDao.isExist(inputId);
		Map<String, Object> map = new HashMap<>();
		map.put("isExist", isExist);
		return map;
	}

	@Override
	public void updateUsersPwd(HttpServletRequest request, UsersDto dto, ModelAndView mView) {
		
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void loginProcess(UsersDto dto, ModelAndView mView, HttpSession session) {
		boolean isValid=false; //초기값 false
		//입력한 아이디랑 기존에 저장되어있는 아이디랑 비교
		UsersDto resultDto=usersDao.getData(dto.getId());
		if(resultDto != null) {
			//아이디 비교 완료, 비밀번호 비교 ㄱㄱ
			String encodedPwd=resultDto.getPwd();
			String inputPwd=dto.getPwd();
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		}
		
		if(isValid) {
			//일치하면 일치한다고 응답
			session.setAttribute("id", dto.getId());
			mView.addObject("isSuccess", true);
		}else {
			mView.addObject("isSuccess", false);
		}
		
	}



}
















