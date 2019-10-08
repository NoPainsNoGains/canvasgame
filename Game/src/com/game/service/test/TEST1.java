package com.game.service.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.game.po.SysAdmin;
import com.game.service.scoreManager.ScoreService;
import com.game.service.userManager.AdminService;
import com.game.service.userManager.LoginService;
import com.game.vo.AdminForm;
import com.game.vo.ScoreForm;


public class TEST1 {
	//测试学生

	private ApplicationContext ac =null;
	@Before
	public void beforeclass(){
		String[] locations = {"classpath:/*.xml", "classpath:/applicationContext/*.xml"}; 
		ac = new ClassPathXmlApplicationContext(locations);
	}
	@Test
	public void test() throws Exception{
		ScoreService scoreServiceImpl = (ScoreService)ac.getBean("scoreServiceImpl");
		List<ScoreForm> sysStudentList = scoreServiceImpl.listService(1,1, 10);
		for(ScoreForm student:sysStudentList){
			System.out.println(student.getScoreNumber());
		}
		
	}
}
