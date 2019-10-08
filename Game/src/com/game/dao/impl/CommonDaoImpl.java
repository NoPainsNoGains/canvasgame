package com.game.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.game.dao.CommonDao;
import com.game.util.GenericsUtils;


@SuppressWarnings("unchecked")
public class CommonDaoImpl<T> extends HibernateDaoSupport implements CommonDao<T> {
	protected Class<T> entity = GenericsUtils.getSuperClassGenricType(this.getClass());
	@Override
	public void save(T entity) {
		
		this.getHibernateTemplate().save(entity);
	}
	@Override
	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}
	/*
	 * spring dao->sessionFactory-->HibernateTemplate-->session
	 * */
	public final void setSessionFactoryDi(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public T findObjectById(Serializable id) {
		return (T)this.getHibernateTemplate().get(entity, id);
	}

	@Override
	public void deleteObjectByIds(Serializable... ids) {
		for(Serializable id:ids){//foreach
			Object object = this.getHibernateTemplate().get(entity, id);
			this.getHibernateTemplate().delete(object);
		}
	}

	@Override
	public void deleteObjectByCollection(Collection<T> list) {
		this.getHibernateTemplate().deleteAll(list);
	}
	/*list*/
	@Override
	public List<T> list(final int page,final int rows) {
		final Class entityTemp = entity;
		final String tempHql = "from "+entityTemp.getSimpleName();
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(tempHql).setFirstResult((page-1)*rows).setMaxResults(rows).list();
			}
		});
		return list;
	}
	/*���ϲ�ѯ���(������)*/
	@Override
	public List<T> findCollectionByCondition(String hqlWhere,final Object[] params,
			LinkedHashMap<String, String> orderby) {
		/*from table o where 1=1(hql)*/
		String hql = "from "+entity.getSimpleName()+" o where 1=1 ";
		/* order by �ֶ��� asc (hqlOderby)*/
		String hqlOderby = this.organizateOderByCondition(orderby);
		/*and o.testName like ? and o.testRemark like ?(hqlWhere)*/
		hql = hql + hqlWhere + hqlOderby;
		final String finalHql = hql;
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery(finalHql);
				setParams(query, params);
				return query.list();
			}
		});
		return list;
	}
	/*���ϲ�ѯ���(���ò���ֵ)*/
	private void setParams(Query query,Object[] params){
		for(int i=0;params!=null&&i<params.length;i++){
			query.setParameter(i, params[i]);
		}
	}
	/*���ϲ�ѯ���(��֯����)*/
	private String organizateOderByCondition(LinkedHashMap<String, String> oderby){
		StringBuffer buffer  = new StringBuffer("");
		if(oderby!=null){
			buffer.append(" order by ");
			for(Map.Entry<String, String> map:oderby.entrySet()){
				buffer.append(" "+map.getKey()+" "+map.getValue()+",");
			}
			buffer.deleteCharAt(buffer.length()-1);
		}
		return buffer.toString();
	}
	@Override
	public List<T> listNopage() {
		final Class entityTemp = entity;
		final String hql = "from "+entityTemp.getSimpleName();
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				return session.createQuery(hql).list();
			}
		});
		return list;
	}
	@Override
	public List<Object[]> getDropList() {
		final Class entityTemp = entity;
		String tableName = entityTemp.getSimpleName();
		String tempSql=null;
		if(tableName.equals("SysRole")){
			tempSql = "select distinct a.ROLE_ID id,a.ROLE_NAME name from SYS_ROLE a order by a.ROLE_ID asc";
		}else if(tableName.equals("SysUser")){
			tempSql = "select distinct a.USER_ID id ,a.USER_NAME name from SYS_USER a ";
		}else if(tableName.equals("ProblemClass")){
			tempSql = "select distinct a.PROBLEM_CLASS_ID id ,a.PROBLEM_CLASS_NAME name from PROBLEM_CLASS a order by a.PROBLEM_CLASS_ID asc ";
		}else if(tableName.equals("ProblemPriority")){
			tempSql = "select distinct a.PROBLEM_PRIORITY_ID id ,a.PROBLEM_PRIORITY_NAME name from PROBLEM_PRIORITY a order by a.PROBLEM_PRIORITY_ID asc ";
		}else if(tableName.equals("EquipClass")){
			tempSql = "select distinct a.EQUIP_CLASS_ID id ,a.EQUIP_CLASS_NAME name from EQUIP_CLASS a order by a.EQUIP_CLASS_ID asc";
		}else if(tableName.equals("UserClass")){
			tempSql = "select distinct a.USER_CLASS_ID id ,a.USER_CLASS_NAME name from USER_CLASS a order by a.USER_CLASS_ID asc";
		}
		final String sql= tempSql;
		List<Object[]>  list= (List<Object[]>)this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				List<Object[]> list = session.createSQLQuery(sql).list();
				return list;
			}
		});
		return list;
	}
	
}
