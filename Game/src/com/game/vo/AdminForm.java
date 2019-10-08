package com.game.vo;

import java.util.Date;



public class AdminForm {
	 private Integer adminId;
	 private String adminName;
	 private String adminPassWord;
	 private Integer adminSex;
	 private String adminTel;
	 private String adminBirth;
	 private String adminRemarks;
	 private Integer adminType;
	 
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
	
	public String getAdminBirth() {
		return adminBirth;
	}
	public void setAdminBirth(String adminBirth) {
		this.adminBirth = adminBirth;
	}
	public String getAdminRemarks() {
		return adminRemarks;
	}
	public void setAdminRemarks(String adminRemarks) {
		this.adminRemarks = adminRemarks;
	}
}
