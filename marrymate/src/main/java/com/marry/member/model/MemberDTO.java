package com.marry.member.model;

public class MemberDTO {
	
    private int midx;
    private String name;
    private String birthday;
    private String gender;
    private String nick;
    private String id;
    private String pwd;
    private String juso;
    private String sjuso;
    private String gname;
    private int point;
    private String joindate;
    private char e_check;
    private String img;
    private String marrydate;
    private String pname;
    
	public MemberDTO() {
		super();
	}

	public MemberDTO(int midx, String name, String birthday, String gender, String nick, String id, String pwd,
			String juso, String sjuso, String gname, int point, String joindate, char e_check, String img,
			String marrydate, String pname) {
		super();
		this.midx = midx;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.nick = nick;
		this.id = id;
		this.pwd = pwd;
		this.juso = juso;
		this.sjuso = sjuso;
		this.gname = gname;
		this.point = point;
		this.joindate = joindate;
		this.e_check = e_check;
		this.img = img;
		this.marrydate = marrydate;
		this.pname = pname;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
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

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public char getE_check() {
		return e_check;
	}

	public void setE_check(char e_check) {
		this.e_check = e_check;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMarrydate() {
		return marrydate;
	}

	public void setMarrydate(String marrydate) {
		this.marrydate = marrydate;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	
}