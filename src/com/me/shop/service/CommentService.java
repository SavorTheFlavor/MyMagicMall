package com.me.shop.service;

import org.springframework.transaction.annotation.Transactional;

import com.me.shop.dao.CommentDao;
import com.me.shop.vo.Comment;

//业务层的CommentService
@Transactional
public class CommentService {
	//注入commentDao
	private CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public String findByPid(Integer pid) {
		return commentDao.findByPid(pid);
	}

	public void add(Comment comment) {
		commentDao.add(comment);
	}
	
}
