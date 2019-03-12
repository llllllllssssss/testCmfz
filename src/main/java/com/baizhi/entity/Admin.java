package com.baizhi.entity;

import java.io.Serializable;

public class Admin implements Serializable{
	//管理员的id
	private String id;
	//管理员的姓名
	private String name;
	//管理员的密码
	private String password;

	public Admin(String id, String name, String password) {
		this.id = id;
		this.name = name;
		this.password = password;
	}

	public Admin() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", password='" + password + '\'' +
				'}';
	}
}
