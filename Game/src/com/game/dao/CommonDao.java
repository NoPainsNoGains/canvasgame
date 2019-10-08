package com.game.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;

public interface CommonDao<T>{
	public void save(T entity);
	public void update(T entity);
	public T findObjectById(Serializable id);
	public void deleteObjectByIds(Serializable... ids);
	public void deleteObjectByCollection(Collection<T> list);
	public List<T> list(int page,int rows);
	public List<T> listNopage();
	public List<T> findCollectionByCondition(String hqlWhere,final Object[] params,LinkedHashMap<String,String> orderby);
	public List<Object[]> getDropList();
}
