package com.admin.admin_cs.model;

public class Admin_csDTO {
	
	private int ascidx;
	private String question;
	private String answer;
	
	public Admin_csDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin_csDTO(int ascidx, String question, String answer) {
		super();
		this.ascidx = ascidx;
		this.question = question;
		this.answer = answer;
	}

	public int getAscidx() {
		return ascidx;
	}
	public void setAscidx(int ascidx) {
		this.ascidx = ascidx;
	}

	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	

}
