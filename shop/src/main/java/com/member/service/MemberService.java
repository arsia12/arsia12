package com.member.service;

import com.member.model.MemberVO;
import com.member.model.NotUserException;

public interface MemberService {
	int insertUser(MemberVO member);

	boolean idCheck(String id);
	
	MemberVO loginCheck(MemberVO member) throws NotUserException;
}
