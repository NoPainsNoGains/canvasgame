package com.game.dao.userManager.impl;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.game.dao.impl.CommonDaoImpl;
import com.game.dao.userManager.AdminDao;
import com.game.po.SysAdmin;
import com.game.po.SysScore;



public class AdminDaoImpl extends CommonDaoImpl<SysAdmin> implements AdminDao{
	@Override
	public boolean isExist(String userName) {
		String hql = "from SysAdmin u where u.adminName = ?";
		@SuppressWarnings("unchecked")
		List<SysAdmin> adminList = this.getHibernateTemplate().find(hql, userName);
		if(adminList.size()>0) 
			return true;
		else
			return false;
	}
	@Override
	public int countTotal() {
		final String sql="select count(*) as Numtotal from SYS_ADMIN";
		Integer number = (Integer)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				int numberTemp = (Integer)session.createSQLQuery(sql)
				          .addScalar("Numtotal", Hibernate.INTEGER)
				          .uniqueResult();
				return numberTemp;
			}
		});
		return number.intValue();
	}
	@Override
	public SysAdmin getUserByUserName(String adminName) {
		String hql = "from SysAdmin u where u.adminName = ?";
		@SuppressWarnings("unchecked")
		List<SysAdmin> userList = this.getHibernateTemplate().find(hql, adminName);
		if(userList.size()==0){
			return null;
		}else{
			return userList.get(0);
		}
	}
	
	@Override
	public SysAdmin loginJudje(String userName, String passWord) {
		String hql = "from SysAdmin u where u.adminName = ? and u.adminPassWord = ?";
		@SuppressWarnings("unchecked")
		List<SysAdmin> userList = this.getHibernateTemplate().find(hql, new String[]{userName, passWord});
		if(userList.size()==0){
			return null;
		}else{
			return userList.get(0);
		}
	}
	@Override
	public SysAdmin listById(Integer id) {
		final String sql="select * from SYS_ADMIN where ADMIN_ID = "+id.intValue();
		List<SysAdmin>  list= (List<SysAdmin>)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				List<SysAdmin>  list = session.createSQLQuery(sql).addEntity(SysAdmin.class).list();
				return list;           
			}
		});
		if(list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}
}
