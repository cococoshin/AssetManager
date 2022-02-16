package com.controller.main;

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

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	MemberService service;
	
	//main(=summary)
	@RequestMapping("/loginCheck/main") 
	public String main() {
		System.out.println("\n\ncontrollermaincontrollermaincontrollermain\n\n");
		return "redirect:../main"; //모든 메인을 거쳐서 가는 웹페이지들은 loginCheckInterceptor를 거치게 됨 
	}//maibn end
	
	
	
	//login
	@RequestMapping("/login") 
	public String login(@RequestParam Map<String, String> map, HttpSession session, Model m) {
		MemberDTO dto = service.login(map);
		if (dto != null) {
			session.setAttribute("login", dto);
			return  "redirect:/loginCheck/main"; //redirect사용 main method가 실행되게 만듦
		} else {
			//로그인 실패시 다시 로그인페이지
			String mesg = "로그인 정보가 틀렸습니다.";
			m.addAttribute("mesg",mesg);
			return "loginForm";
		}
	}//login end

	//로그인 중복체크 
	@RequestMapping(value = "/idDuplicateCheck", produces="text/plain;charset=UTF-8") //login 시켜줌
	public @ResponseBody String idDuplicateCheck(@RequestParam("id") String userid) { //mesg를 data로 memberForm.jsp의 ajax에게 넘김
		System.out.println("idDuplicateCheck" + userid);
		MemberDTO dto = service.idDuplicateCheck(userid);
		
		String mesg = null;
		if (dto != null) {
			mesg = "아이디 사용불가능";
		} else {
			mesg = "아이디 사용가능";
		}	
		return mesg;
	}//idDuplicateCheck end
	
	
	//회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.GET) 
	public ModelAndView signUp(MemberDTO dto) { 
		System.out.println(dto);
		ModelAndView mav = new ModelAndView();
		String mesg = null;
		service.signUp(dto);
		mesg = "회원가입 성공";
		mav.setViewName("loginForm"); //회원가입 성공시 메시지 출력 + loginForm.jsp로 이동
		mav.addObject("mesg",mesg);
		return mav;
	} 
	
	
	
}
