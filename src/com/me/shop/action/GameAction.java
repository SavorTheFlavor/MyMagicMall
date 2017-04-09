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

	
	/**
	 * 2048小游戏 -- 跳转到2048
	 */
	public String play2048(){
		existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser == null){
			return "login";
		}
		return "2048";
	}

	/**抽奖
	 * @throws IOException */
	public String luckDraw() throws IOException{
		existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser == null){
			String msg = "Non-existent";
			ServletActionContext.getResponse().getWriter().print(msg);
			ServletActionContext.getResponse().getWriter().close();//要记得close！！！！不然返回整个页面！！！！
			return "rotatePage";
		}
		int restCoupon = existUser.getCoupon();
		if(restCoupon <= 0){
			String msg = "notEnough";
			ServletActionContext.getResponse().getWriter().print(msg);
			ServletActionContext.getResponse().getWriter().close();//要记得close！！！！不然返回整个页面！！！！
			return "rotatePage";
		}
		restCoupon--;
		existUser.setCoupon(restCoupon);
		userService.update(existUser);
		return "rotatePage";
	}
	
}
