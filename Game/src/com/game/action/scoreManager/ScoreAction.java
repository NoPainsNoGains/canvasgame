package com.game.action.scoreManager;

import java.util.Map;

import com.game.page.ScorePage;
import com.game.po.SysAdmin;
import com.game.service.scoreManager.ScoreService;
import com.game.vo.ScoreForm;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ScoreAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private ScoreService scoreServiceImpl; 
	private ScorePage scorePage;
	private String rows;
	private String page;
	private String scoreNumber;
	private String scoreGrade;
	
	
	public String getScoreNumber() {
		return scoreNumber;
	}
	public void setScoreNumber(String scoreNumber) {
		this.scoreNumber = scoreNumber;
	}
	public String getScoreGrade() {
		return scoreGrade;
	}
	public void setScoreGrade(String scoreGrade) {
		this.scoreGrade = scoreGrade;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public ScoreService getScoreServiceImpl() {
		return scoreServiceImpl;
	}
	public void setScoreServiceImpl(ScoreService scoreServiceImpl) {
		this.scoreServiceImpl = scoreServiceImpl;
	}
	public ScorePage getScorePage() {
		return scorePage;
	}
	public void setScorePage(ScorePage scorePage) {
		this.scorePage = scorePage;
	}
	public String List(){
		int npage =  Integer.parseInt(page);
		int nrows = Integer.parseInt(rows);
		/*从session获取用户姓名*/
		Map<String, Object> session = ActionContext.getContext().getSession(); 
		SysAdmin user = (SysAdmin) session.get("user");//获取session值	
		scorePage.setRows(scoreServiceImpl.listService(user.getAdminId().intValue(),npage, nrows));
		scorePage.setTotal(scoreServiceImpl.countService(user.getAdminId().intValue()));
		return "LIST";
	}
	public String ListAll(){
		int npage =  Integer.parseInt(page);
		int nrows = Integer.parseInt(rows);
		/*从session获取用户姓名*/
		scorePage.setRows(scoreServiceImpl.listAllService(npage, nrows));
		scorePage.setTotal(scoreServiceImpl.countALLService());
		return "ListAll";
	}
	public String Add(){
		if("".equals(scoreNumber)||scoreNumber==null||" ".equals(scoreNumber)){
			return "Addfail";
		}
		if("".equals(scoreGrade)||scoreGrade==null||" ".equals(scoreGrade)){
			return "Addfail";
		}
		Map<String, Object> session = ActionContext.getContext().getSession(); 
		SysAdmin sysAdmin = (SysAdmin) session.get("user");//获取session值	
		scoreServiceImpl.saveService(sysAdmin, Integer.parseInt(scoreNumber), Integer.parseInt(scoreGrade));
		return "Add";
	}
}
