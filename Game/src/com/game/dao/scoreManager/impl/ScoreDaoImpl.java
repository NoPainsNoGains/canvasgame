package com.game.dao.scoreManager.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.game.dao.impl.CommonDaoImpl;
import com.game.dao.scoreManager.ScoreDao;
import com.game.po.SysScore;

public class ScoreDaoImpl extends CommonDaoImpl<SysScore> implements ScoreDao{
	
	@Override
	public int countTotalByUserId(final Integer userId) {
		final String sql="select count(*) as Numtotal from SYS_SCORE where ADMIN_ID = "+userId.intValue();
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
	public List<SysScore> listByUserId(Integer userId,final int page,final int rows) {
		final String sql="select * from SYS_SCORE where ADMIN_ID = "+userId.intValue()+" order by SCORE_DATE desc";
		List<SysScore>  list= (List<SysScore>)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				List<SysScore>  list = session.createSQLQuery(sql).addEntity(SysScore.class).setFirstResult((page-1)*rows).setMaxResults(rows).list();
				return list;           
			}
		});
		return list;
	}

	@Override
	public int countTotal() {
		final String sql="select count(*) as Numtotal from SYS_SCORE ";
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

}
