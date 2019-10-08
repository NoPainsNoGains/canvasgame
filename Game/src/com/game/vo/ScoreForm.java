package com.game.vo;

import com.game.po.SysAdmin;

public class ScoreForm {
	private Integer scoreId;
	private Integer scoreGrade;
	private Integer scoreNumber;
	private String scoreDate;
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
	public String getScoreDate() {
		return scoreDate;
	}
	public void setScoreDate(String scoreDate) {
		this.scoreDate = scoreDate;
	}
	public SysAdmin getSysAdmin() {
		return sysAdmin;
	}
	public void setSysAdmin(SysAdmin sysAdmin) {
		this.sysAdmin = sysAdmin;
	}
	
}
