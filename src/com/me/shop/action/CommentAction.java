package com.me.shop.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.me.shop.service.CommentService;
import com.me.shop.vo.Comment;
import com.me.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAction extends ActionSupport implements ModelDriven<Comment>{

	private Comment comment = new Comment();
	@Override
	public Comment getModel() {
		return comment;
	}

	//注入CommentService
	private CommentService commentService;
	//接收uid
	//private Integer uid;
	//接收pid
	private Integer pid;
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	//根据商品的pid找到评论
	public String findByPid() {
		// 调用Service进行查询:
		//User existUser = userService.findByUsername(user.getUsername());
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		/*if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println(commentService.findByPid(pid, uid));
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println(commentService.findByPid(pid, uid));
		}*/
		
		try {
			//接收从product.jsp传递过来的参数pid
			pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("pid"));
			response.getWriter().println(commentService.findByPid(pid));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//test
		//System.out.println("接收参数成功");
		//return commentService.findByPid(pid, uid);
		return NONE;
	}
	
	public String makeCommentPage(){
		return "makeCommentPage";
	}
	
	//添加用户提交的评价
	public String add(){
		commentService.add(comment);
		this.addActionMessage("提交评价成功");
		return "msg";
	}
}
