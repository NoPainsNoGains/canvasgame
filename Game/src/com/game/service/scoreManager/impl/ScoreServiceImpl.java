package com.game.service.scoreManager.impl;

import java.util.ArrayList;
import java.util.List;


import com.game.dao.scoreManager.ScoreDao;
import com.game.po.SysAdmin;
import com.game.po.SysScore;
import com.game.service.scoreManager.ScoreService;
import com.game.util.DateUtil;
import com.game.vo.ScoreForm;

public class ScoreServiceImpl implements ScoreService{
	private ScoreDao scoreDaoImpl;
	
	public ScoreDao getScoreDaoImpl() {
		return scoreDaoImpl;
	}

	public void setScoreDaoImpl(ScoreDao scoreDaoImpl) {
		this.scoreDaoImpl = scoreDaoImpl;
	}
	public List<ScoreForm> listPoToVo(List<SysScore> sysScoreList){
		List<ScoreForm> scoreFormList = new ArrayList<ScoreForm>();
		ScoreForm scoreForm = null;
		for(SysScore sysScore:sysScoreList){
			scoreForm = new ScoreForm();
			scoreForm.setScoreDate(sysScore.getScoreDate().toString());
			scoreForm.setScoreGrade(sysScore.getScoreGrade());
			scoreForm.setScoreNumber(sysScore.getScoreNumber());
			scoreForm.setSysAdmin(sysScore.getSysAdmin());
			scoreFormList.add(scoreForm);
		}
		return scoreFormList;
	}
	public SysScore saveVoToPo(SysAdmin sysAdmin,Integer number, Integer score){
		SysScore sysScore = new SysScore();
		sysScore.setScoreDate(DateUtil.StrToDate(DateUtil.getNow()));
		sysScore.setScoreGrade(score);
		sysScore.setScoreNumber(number);
		sysScore.setSysAdmin(sysAdmin);
		return sysScore;
	}
	@Override
	public List<ScoreForm> listService(int userId, int page, int rows) {
		return this.listPoToVo(scoreDaoImpl.listByUserId(userId, page, rows));
	}

	@Override
	public int countService(int userId) {
		return scoreDaoImpl.countTotalByUserId(userId);
	}

	@Override
	public void saveService(SysAdmin sysAdmin,Integer number, Integer score) {
		SysScore sysScore = this.saveVoToPo(sysAdmin, number, score);
		scoreDaoImpl.save(sysScore);	
	}

	@Override
	public List<ScoreForm> listAllService(int page, int rows) {
		return this.listPoToVo(scoreDaoImpl.list(page, rows));
	}

	@Override
	public int countALLService() {
		return scoreDaoImpl.countTotal();
	}
	
	
}
