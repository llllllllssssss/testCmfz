package com.baizhi.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;

@Controller
@RequestMapping("/AdminController")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@ResponseBody
	@RequestMapping("/loginAdmin.do")
	//登录
	public String queryAdmin(HttpSession session,String name,String password,String code){
		Admin adm = adminService.selectByNameAndPassword(name, password);
		System.out.println("name>>>>>"+name);
		System.out.println("password>>>>>>"+password);
		String c = (String) session.getAttribute("code");
		System.out.println("c:"+c);
		if(c.equalsIgnoreCase(code)){
			if(adm!=null){
				session.setAttribute("admin", adm);
				return "1";//登录成功
			}else{
				return "2";//用户名比可用
			}
		}else{
			return "3";//密码错误
		}
	}

	@RequestMapping("/addAdmin.do")
	@ResponseBody
	//注册
	public String addAdmin(HttpSession session,String code,Admin admin){
		String c = (String) session.getAttribute("code");
		System.out.println(" c "+ c );
		if(c.equalsIgnoreCase(code)){
			Admin ad = adminService.selectByNameAndPassword(admin.getName(), admin.getPassword());
			if(ad==null){
				adminService.insertAdmin(admin);
				return "1";
			}else{

				return "2";
			}
		}else{
			return "3";
		}
	}



}
