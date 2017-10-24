package com.common.shop;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.util.CommonUtil;
import com.member.model.MemberVO;
import com.member.model.NotUserException;
import com.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommonUtil util;
	
	
	@RequestMapping(value="/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/join")
	public String join() {
		return "member/join"; 
	}
	
	@RequestMapping(value="/joinEnd")
	public String joinEnd(Model m, @ModelAttribute("member") MemberVO member) {
		int n = memberService.insertUser(member);
		String msg=(n>0)? "가입성공":"가입실패";
		String loc="index";
		return util.addMsgLoc(m, msg, loc);
	}
	
	@RequestMapping(value="/idCheck")
	public @ResponseBody Integer idCheck(@RequestParam(defaultValue="") String id){
		boolean isUse=memberService.idCheck(id);
		Integer value=(isUse)? 1:0;
		return value;
	}
	
	@RequestMapping(value="/loginEnd")
	public String loginEnd(@RequestParam(defaultValue="") String id,
						   @RequestParam(defaultValue="") String pwd,
						   HttpSession ses) throws NotUserException{
		if(id.trim().isEmpty() || pwd.trim().isEmpty()) {
			return "redirect:/login";
		}
		
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setPwd(pwd);
		
		System.out.println(id);
		System.out.println(pwd);
		
		MemberVO loginMember = memberService.loginCheck(member);
		
		if(loginMember!=null) {
			ses.setAttribute("loginMember", loginMember);
		} 
		
		String returnpage=(String)ses.getAttribute("returnPage");
		if(returnpage==null) {
			return "redirect:/index";
		}else {
			return "redirect:"+returnpage;
		}
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession ses) {
		ses.invalidate();
		return "redirect:/index";
	}
	
	@ExceptionHandler(NotUserException.class)
	public String exceptionHandler(Exception ex) {
		return "member/loginError";
	}
	
}
