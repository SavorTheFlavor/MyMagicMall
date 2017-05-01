package com.me.shop.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.me.shop.vo.Comment;

//Dao层Comment
public class CommentDao extends HibernateDaoSupport{

	public String findByPid(Integer pid) {
		//test
		//System.out.println("查询评价成功！");
		
		StringBuilder sb = new StringBuilder();
		//sb.append("<div>test1:pid"+pid+"</div>");
		//sb.append("<div>test2:uid"+uid+"</div>");
		
		String hql = "from Comment where pid = ?";
		List<Comment> list = this.getHibernateTemplate().find(hql, pid);
		if(list!=null && list.size()>0) {
			for(Comment comment : list) {
				sb.append("<div style='width:100%;border-bottom:1px solid gray;'>");
				switch(comment.getStar()){
				case "1":
					sb.append("<div style='width:33%;'><img src='images/comment/star1.png'/></div>");
					break;
				case "2":
					sb.append("<div style='width:33%;'><img src='images/comment/star2.png' /></div>");
					
					break;
				case "3":
					
					sb.append("<div style='width:33%;'><img src='images/comment/star3.png' /></div>");
					break;
				case "4":
					
					sb.append("<div style='width:33%;'><img src='images/comment/star4.png' /></div>");
					break;
				case "5":
					sb.append("<div style='width:33%;'><img src='images/comment/star5.png' /></div>");
					
					break;
				}
				switch(comment.getState()){
				case 1:
					sb.append("<div style='width:33%;'>差评</div>");
					break;
				case 2:
					sb.append("<div style='width:33%;'>中评</div>");
					break;
				case 3:
					sb.append("<div style='width:33%;'>好评</div>");
					break;
						
				}
				SimpleDateFormat sf = new SimpleDateFormat("y-m-d");
				sb.append("<div style='width:33%;'>"+sf.format(comment.getCdate())+"</div>");
				sb.append("<div style='width:33%;'>"+comment.getUsername()+"</div>");
				sb.append("<div style='position:relative;left:20%;top:-50px;width:33%;'>"+comment.getContent()+"</div>");
				sb.append("</div>");
			}
		} else {
			sb.append("<div>暂无任何评价，您可以在交易成功的订单中按照指示进行评价操作！</div>");
			//test
			System.out.println("查不到");
		}
		
		return sb.toString();
	}

	public void add(Comment comment) {
		this.getHibernateTemplate().save(comment);
	}

}
