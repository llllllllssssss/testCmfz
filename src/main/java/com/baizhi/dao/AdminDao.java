package com.baizhi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baizhi.entity.Admin;

public interface AdminDao extends BaseDao<Admin>{
	//登录
	Admin selectAdminByNameAndPassword(@Param("name") String name, @Param("password") String password);
	
	List<Admin>  queryAll();
}
