package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BankDTO;
import com.dto.MemberDTO;

@Repository
public class BankDAO {

	@Autowired
	SqlSessionTemplate template;

//	public MemberDTO login(Map<String, String> map) {
//		MemberDTO dto =  template.selectOne("MemberMapper.login", map);
//		return dto;
//	}
//
//	public MemberDTO idDuplicateCheck(String userid) {
//		MemberDTO dto = template.selectOne("MemberMapper.idDuplicateCheck", userid);
//		return dto;
//	}
//
//	public void signUp(MemberDTO dto) {
//		template.insert("MemberMapper.signUp", dto);
//		
//	}

	public List<BankDTO> bankList(String userid) {
		List<BankDTO> list = template.selectList("BankMapper.bankList", userid);
		return list;
	}

	public void bankAdd(List<BankDTO> list) {
		template.insert("BankMapper.bankAdd", list);
		
	}

	
	
}
