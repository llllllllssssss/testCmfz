package com.baizhi.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
@Service
@Transactional(propagation=Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public Admin selectByNameAndPassword(String name, String password) {
		
		return adminDao.selectAdminByNameAndPassword(name, password);
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void insertAdmin(Admin admin) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		admin.setId(uuid);
		adminDao.insert(admin);
		
	}
	@Override
	public List<Admin> findAll() {
		// TODO Auto-generated method stub
		List<Admin> queryAll = adminDao.queryAll();
		return queryAll;
	}
	
}
