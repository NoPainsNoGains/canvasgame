package com.game.dao.scoreManager;

import java.util.List;

import com.game.dao.CommonDao;
import com.game.po.SysScore;

public interface ScoreDao extends CommonDao<SysScore>{
	public int countTotalByUserId(Integer userId);
	public int countTotal();
	public List<SysScore> listByUserId(Integer userId,int page,int rows);
}
