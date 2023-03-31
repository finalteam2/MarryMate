package com.admin.company.model;

import java.sql.Date;

public class CompanyDTO {
	
	private int cidx;
	private Date joindate;
	private String kind;
	private String cname;
	private String intro;
	private String id;
	private String pwd;
	private String tel;
	private String email;
	private String juso;
	private String sjuso;
	private String curl;
	private String sido;
	private String sigungu;
	private int pay;
	private int guest_num;
	private String cnum;
	private String cfile;
	private int clevel;
	private int blind;
	private int watch;
	private int topfix;
	private String img;
	
	public CompanyDTO() {
		super();
	}

	public CompanyDTO(int cidx, Date joindate, String kind, String cname, String intro, String id, String pwd,
			String tel, String email, String juso, String sjuso, String curl, String sido, String sigungu, int pay,
			int guest_num, String cnum, String cfile, int clevel, int blind, int watch, int topfix, String img) {
		super();
		this.cidx = cidx;
		this.joindate = joindate;
		this.kind = kind;
		this.cname = cname;
		this.intro = intro;
		this.id = id;
		this.pwd = pwd;
		this.tel = tel;
		this.email = email;
		this.juso = juso;
		this.sjuso = sjuso;
		this.curl = curl;
		this.sido = sido;
		this.sigungu = sigungu;
		this.pay = pay;
		this.guest_num = guest_num;
		this.cnum = cnum;
		this.cfile = cfile;
		this.clevel = clevel;
		this.blind = blind;
		this.watch = watch;
		this.topfix = topfix;
		this.img = img;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getGuest_num() {
		return guest_num;
	}

	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
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

	public int getTopfix() {
		return topfix;
	}

	public void setTopfix(int topfix) {
		this.topfix = topfix;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
