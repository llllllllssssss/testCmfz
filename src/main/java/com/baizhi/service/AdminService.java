package com.baizhi.service;

import java.util.List;

import com.baizhi.entity.Admin;

public interface AdminService {
	//登录
	public Admin selectByNameAndPassword(String name, String password);
	//注册
	public void insertAdmin(Admin admin);
	
	public List<Admin>  findAll();
}
