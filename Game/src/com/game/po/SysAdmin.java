package com.game.po;

import java.util.Date;

public class SysAdmin  implements java.io.Serializable {
	 private static final long serialVersionUID = 1L;
	 private Integer adminId;
	 private String adminName;
	 private String adminPassWord;
	 private Integer adminType;
	 private Integer adminSex;
	 private String adminTel;
	 private Date adminBirth;
	 private String adminRemarks;
	 
	public Integer getAdminType() {
		return adminType;
	}
	public void setAdminType(Integer adminType) {
		this.adminType = adminType;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPassWord() {
		return adminPassWord;
	}
	public void setAdminPassWord(String adminPassWord) {
		this.adminPassWord = adminPassWord;
	}
	public Integer getAdminSex() {
		return adminSex;
	}
	public void setAdminSex(Integer adminSex) {
		this.adminSex = adminSex;
	}
	public String getAdminTel() {
		return adminTel;
	}
	public void setAdminTel(String adminTel) {
		this.adminTel = adminTel;
	}
	public Date getAdminBirth() {
		return adminBirth;
	}
	public void setAdminBirth(Date adminBirth) {
		this.adminBirth = adminBirth;
	}
	public String getAdminRemarks() {
		return adminRemarks;
	}
	public void setAdminRemarks(String adminRemarks) {
		this.adminRemarks = adminRemarks;
	}
	 
}