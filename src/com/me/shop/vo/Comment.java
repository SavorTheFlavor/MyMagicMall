package com.me.shop.vo;

import java.util.Date;

//评论的实体类
public class Comment {
	private Integer cid;
	//private Integer uid;
	//private Integer pid;
	private Date cdate;//发布日期
	private String star;//评价星级：1-5
	/**
	 * 评价（1：差评，对应于星级的1和2；
	 * 2：中评，对应于星级的3；
	 * 3：好评，对应于星级的4和5）
	 */
	private Integer state;
	private String content;
	
	//用户外键：对象
	//private User user;
	//商品外键：对象
	private Product product;
	
	/*public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}*/
	private String username;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	//貌似传外键不对？这里传pid试试
	private Integer pid;

	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	
}
