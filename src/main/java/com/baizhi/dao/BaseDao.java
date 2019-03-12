package com.baizhi.dao;

import java.util.List;

public interface BaseDao<T> {
	//添加
	public void insert(T t);
	//批量删除
	public void delete(List<String> list);
	//修改
	public void update(T t);
	//查询
	public T select(T t);
	//查询所用
	public List<T> selectAll();

}
