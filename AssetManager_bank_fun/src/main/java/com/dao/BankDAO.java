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



	public List<BankDTO> bankList(String userid) {
		List<BankDTO> list = template.selectList("BankMapper.bankList", userid);
		return list;
	}

	public void bankAdd(List<BankDTO> list) {
		template.insert("BankMapper.bankAdd", list);
		
	}

	public void bankDel(int no) {
		template.delete("BankMapper.bankDel", no);
	}

	public void bankUpd(BankDTO dto) {
		template.update("BankMapper.bankUpd", dto);
	}

	
	
}
