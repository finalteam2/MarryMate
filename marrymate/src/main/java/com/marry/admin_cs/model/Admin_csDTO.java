package com.marry.admin_cs.model;

public class Admin_csDTO {
	
	private int acsidx;
	private String question;
	private String answer;
	
	public Admin_csDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin_csDTO(int acsidx, String question, String answer) {
		super();
		this.acsidx = acsidx;
		this.question = question;
		this.answer = answer;
	}

	public int getAcsidx() {
		return acsidx;
	}
	public void setAcsidx(int acsidx) {
		this.acsidx = acsidx;
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
