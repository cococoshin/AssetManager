package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BankDAO;
import com.dao.MemberDAO;
import com.dto.BankDTO;
import com.dto.MemberDTO;

@Service
public class BankService {
	@Autowired
	BankDAO dao;

	public List<BankDTO> bankList(String userid) {
		List<BankDTO> list = dao.bankList(userid);
		return list;
	}

	public void bankAdd(List<BankDTO> list) {
		dao.bankAdd(list);
	}


	
}
