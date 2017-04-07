package com.me.shop.service;

import org.springframework.transaction.annotation.Transactional;

import com.me.shop.dao.AdminUserDao;
import com.me.shop.vo.AdminUser;
@Transactional
public class AdminUserService {
	// 注入Dao
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	
	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}
	
}
