package com.me.shop.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.me.shop.service.UserService;
import com.me.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 娱乐相关的action
 * @author me
 *
 */
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


	/**
	 * 计算2048游戏得分，并增加用户积分
	 * @return
	 * @throws IOException 
	 */
	public String accountFor2048() throws IOException{
		//接收参数
		int gPoints = Integer.parseInt(ServletActionContext.getRequest().getParameter("gPoints"));
		
		//将积分保存到用户中
			existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
			if(existUser == null){
				return "login";
			}
		  existUser.setPoints(existUser.getPoints()+gPoints/10);
		 userService.update(existUser);
		System.out.println(gPoints+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		 //向页面返回数据
		ServletActionContext.getResponse().getWriter().write(""+gPoints/10);
		ServletActionContext.getResponse().getWriter().close();//要记得close！！！！不然返回整个页面！！！！
		
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
	
	private double money;//要兑换金钱的数量
	public void setMoney(double money) {
		this.money = money;
	}
	
	private int coupon;//要兑换优惠券的数量
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	
	private int points;//要兑换积分的数量,使用钱
	public void setPoints(int points) {
		this.points = points;
	}


	/**
	 * 跳转到积分兑换界面
	 */
	public String toExchange(){
		existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser == null){
			return "login";
		}
		return "exchangePage";
	}
	
	/**
	 * 积分兑换成钱及优惠券的页面
	 *     积分换钱-->1024:10
			积分换优惠券-->1024:1
			钱换积分--->1:100
	 */
	public String exchange(){
		existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser == null){
			return "login";
		}
		int curPoints = existUser.getPoints() + points;
		double curMoney = existUser.getBalance() - points/100;
		int restPoints = (int) (curPoints - Math.round(money*102.4) - coupon*1024);
		if( restPoints < 0 ||  curMoney < 0){
			this.addActionError("积分或钱不够!");
			return "exchangePage";
		}
		existUser.setBalance(curMoney+money);
		existUser.setPoints(restPoints);
		existUser.setCoupon(existUser.getCoupon()+coupon);
		userService.update(existUser);
		return "exchangePage";
	}

}
