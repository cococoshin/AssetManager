package com.controller.main;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.BankDTO;
import com.dto.MemberDTO;
import com.service.BankService;
import com.service.MemberService;

@Controller
public class BankController {
	
	@Autowired
	BankService service;
	
	@RequestMapping("/bank") //userid를 이용해 사용자의 계좌들을 불러옴
	public String bank(HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String userid = dto.getUserid();
		List<BankDTO> list = service.bankList(userid);
		session.setAttribute("bankList", list); //다른 .jsp에서 활용하기 위해 session에 저장		
		return "bank";
	}//bank end

	
	//no -> 시퀀스를 통해 처리 / userid -> session에 저장된 값 / type, bankname, contents는 유저입력값
	@RequestMapping("/bankAdd") 
	public String bankAdd(HttpSession session, @RequestParam String[] type, @RequestParam String[] bankname, @RequestParam String[] contents, @RequestParam int[] deposit) {
//		parsing이 이방법 말고는 없나??
		
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		System.out.println(userid);
		List<BankDTO> list = new ArrayList<BankDTO>();
		for (int i = 0; i < contents.length; i++) {
			String t = type[i];
			String b = bankname[i];
			String c = contents[i];
			int d = deposit[i];
			BankDTO dto = new BankDTO(1, t, b, c, d, userid);
			list.add(dto);
		}	
		service.bankAdd(list);
		return "redirect:/bank";//redirect시키기
	}//bankAdd end
	
	@RequestMapping("/bankDel")
	public @ResponseBody String bankDel(@RequestParam("no") int no) {
		System.out.println("\nbankDel"+no+"bankDel\n");
		service.bankDel(no);
		return "redirect: /bank";
	}

	@RequestMapping("/bankUpd")
	public @ResponseBody String bankUpd(BankDTO dto) {
		System.out.println("\nbankUpd"+dto+"bankUpd\n");
		service.bankUpd(dto);
		return "redirect: /bank";
	}
	
	
}
