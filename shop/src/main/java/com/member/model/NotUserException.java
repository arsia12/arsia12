package com.member.model;

public class NotUserException extends Exception{
	
	public NotUserException() {
		super("에러메시지[NotUserException]");
	}
	public NotUserException(String msg) {
		super(msg);
	}
}
