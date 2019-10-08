package com.game.page;


import java.util.List;

import com.game.vo.AdminForm;

public class AdminPage {
	private List<AdminForm> rows;
	private int total;//总共记录
	public List<AdminForm> getRows() {
		return rows;
	}
	public void setRows(List<AdminForm> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
