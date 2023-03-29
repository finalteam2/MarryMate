package com.marry.company.model;

import org.springframework.web.multipart.MultipartFile;

public class CompanyDTO {
	
	private int cidx;
	private String cname;
	private String kind;
	private String cid;
	private String pwd;
	private String tel;
	private String email;
	private String juso;
	private String sjuso;
	private String curl;
	private String sido;
	private String sigungu;
	private String intro;
	private int pay;
	private String cnum;
	private MultipartFile cfile;
	private int clvel;
	private int blind;
	
	public CompanyDTO() {
		super();
	}

	public CompanyDTO(int cidx, String cname, String kind, String cid, String pwd, String tel, String email,
			String juso, String sjuso, String curl, String sido, String sigungu, String intro, int pay, String cnum,
			MultipartFile cfile, int clvel, int blind) {
		super();
		this.cidx = cidx;
		this.cname = cname;
		this.kind = kind;
		this.cid = cid;
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.juso = juso;
		this.sjuso = sjuso;
		this.curl = curl;
		this.sido = sido;
		this.sigungu = sigungu;
		this.intro = intro;
		this.pay = pay;
		this.cnum = cnum;
		this.cfile = cfile;
		this.clvel = clvel;
		this.blind = blind;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
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

	public String getCurl() {
		return curl;
	}

	public void setCurl(String curl) {
		this.curl = curl;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public MultipartFile getCfile() {
		return cfile;
	}

	public void setCfile(MultipartFile cfile) {
		this.cfile = cfile;
	}

	public int getClvel() {
		return clvel;
	}

	public void setClvel(int clvel) {
		this.clvel = clvel;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}
	
}
