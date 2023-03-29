package com.admin.admin.model;

public class AdminDTO {
	
	private int admin;
	private int aidx;
	private String id;
	private String pwd;
	private String name;
	private String dept;
	
	public AdminDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AdminDTO(int admin, int aidx, String id, String pwd, String name, String dept) {
		super();
		this.admin = admin;
		this.aidx = aidx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.dept = dept;
	}
	
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	public int getAidx() {
		return aidx;
	}
	public void setAidx(int aidx) {
		this.aidx = aidx;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}

}
