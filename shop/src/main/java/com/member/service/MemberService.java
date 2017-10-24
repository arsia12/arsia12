package com.member.service;

import com.member.model.MemberVO;

public interface MemberService {
	int insertUser(MemberVO member);

	boolean idCheck(String id);
}
