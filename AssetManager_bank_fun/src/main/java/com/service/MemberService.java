package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO dao;

	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = dao.login(map);
		return dto;
	}

	public MemberDTO idDuplicateCheck(String userid) {
		MemberDTO dto = dao.idDuplicateCheck(userid);
		return dto;
	}

	public void signUp(MemberDTO dto) {
		dao.signUp(dto);
		
	}
	
}
