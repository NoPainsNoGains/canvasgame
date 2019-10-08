package com.game.page;

import java.util.List;

import com.game.vo.ScoreForm;

public class ScorePage {
	private List<ScoreForm> rows;
	private int total;//总共记录
	public List<ScoreForm> getRows() {
		return rows;
	}
	public void setRows(List<ScoreForm> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
