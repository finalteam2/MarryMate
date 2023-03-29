package com.marry.company.model;

import org.springframework.web.multipart.MultipartFile;

public class CompanyDTO {
	
	private int cidx;
	private String kind;
	private String cname;
	private String intro;
	private String id;
	private String pwd;
	private String tel;
	private String email;
	private String juso;
	private String sjuso;
	private int pay;
	private int cnum;
	private String cfile;
	private int clevel;
	private int blind;
	private int watch;
	
	public CompanyDTO() {
		super();
	}

	public CompanyDTO(int cidx, String kind, String cname, String intro, String id, String pwd, String tel,
			String email, String juso, String sjuso, int pay, int cnum, String cfile, int clevel, int blind,
			int watch) {
		super();
		this.cidx = cidx;
		this.kind = kind;
		this.cname = cname;
		this.intro = intro;
		this.id = id;
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.juso = juso;
		this.sjuso = sjuso;
		this.pay = pay;
		this.cnum = cnum;
		this.cfile = cfile;
		this.clevel = clevel;
		this.blind = blind;
		this.watch = watch;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJuso() {
		return juso;
	}

	public void setJuso(String juso) {
		this.juso = juso;
	}

	public String getSjuso() {
		return sjuso;
	}

	public void setSjuso(String sjuso) {
		this.sjuso = sjuso;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getCfile() {
		return cfile;
	}

	public void setCfile(String cfile) {
		this.cfile = cfile;
	}

	public int getClevel() {
		return clevel;
	}

	public void setClevel(int clevel) {
		this.clevel = clevel;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}

	public int getWatch() {
		return watch;
	}

	public void setWatch(int watch) {
		this.watch = watch;
	}
	
}
