package com.game.po;

import java.util.Date;

public class SysScore implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer scoreId;
	private Integer scoreGrade;
	private Integer scoreNumber;
	private Date scoreDate;
	private SysAdmin sysAdmin;
	public Integer getScoreId() {
		return scoreId;
	}
	public void setScoreId(Integer scoreId) {
		this.scoreId = scoreId;
	}
	public Integer getScoreGrade() {
		return scoreGrade;
	}
	public void setScoreGrade(Integer scoreGrade) {
		this.scoreGrade = scoreGrade;
	}
	public Integer getScoreNumber() {
		return scoreNumber;
	}
	public void setScoreNumber(Integer scoreNumber) {
		this.scoreNumber = scoreNumber;
	}
	public Date getScoreDate() {
		return scoreDate;
	}
	public void setScoreDate(Date scoreDate) {
		this.scoreDate = scoreDate;
	}
	public SysAdmin getSysAdmin() {
		return sysAdmin;
	}
	public void setSysAdmin(SysAdmin sysAdmin) {
		this.sysAdmin = sysAdmin;
	}
	
}
