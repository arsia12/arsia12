package com.member.model;

public interface MemberDAO {

	int insertUser(MemberVO member);
	
	boolean idCheck(String id);
	
	MemberVO loginCheck(MemberVO member);
}
 