package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("BankDTO")
public class BankDTO {
	int no;
	String type;
	String bankname;
	String contents;
	String userid;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "BankDTO [no=" + no + ", type=" + type + ", bankname=" + bankname + ", contents=" + contents
				+ ", userid=" + userid + "]";
	}
	public BankDTO() {
		super();
	}
	public BankDTO(int no, String type, String bankname, String contents, String userid) {
		super();
		this.no = no;
		this.type = type;
		this.bankname = bankname;
		this.contents = contents;
		this.userid = userid;
	}
	
	
	
	
	
}
