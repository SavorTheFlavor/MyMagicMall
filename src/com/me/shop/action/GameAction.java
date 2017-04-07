package com.me.shop.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.me.shop.service.UserService;
import com.me.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GameAction extends ActionSupport{
	
	private UserService userService; 
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	private User existUser;
	
	public void setExistUser(User existUser) {
		this.existUser = existUser;
	}


	/**抽奖
	 * @throws IOException */
	public String luckDraw() throws IOException{
		existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		System.out.println("@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		if(existUser == null){
			System.out.println("################################");
			String msg = "Non-existent";
			ServletActionContext.getResponse().getWriter().print(msg);
			return "rotatePage";
		}
		int restCoupon = existUser.getCoupon();
		if(restCoupon <= 0){
			System.out.println("################################");
			String msg = "notEnough";
			ServletActionContext.getResponse().getWriter().print(msg);
			return "rotatePage";
		}
		restCoupon--;
		existUser.setCoupon(restCoupon);
		userService.update(existUser);
		return "rotatePage";
	}
	
}
