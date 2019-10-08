package com.game.service.scoreManager;

import java.util.List;

import com.game.po.SysAdmin;
import com.game.vo.ScoreForm;

public interface ScoreService {
	public List<ScoreForm> listService(int userId,int page,int rows);
	public List<ScoreForm> listAllService(int page,int rows);
	public int countService(int userId);
	public int countALLService();
	public void saveService(SysAdmin sysAdmin,Integer number,Integer score);
}
