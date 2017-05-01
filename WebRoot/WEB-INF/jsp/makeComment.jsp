<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />
<script>
	function checkForm(){
		//更改state
		var state = document.getElementById("state");
		var star = document.getElementById("star").value;
		if(star=="1"||star=="2"){
			state.value = 1;//差评
		}else if(star == "3"){
			state.value = 2;//中评
		}else{
			state.value = 3;//好评
		}
		//更改cdate
		var cdate = document.getElementById("cdate");
		cdate.value = "2017-05-01";
		//alert(document.getElementById("cdate").value);
		// 校验用户名:
		// 获得用户名文本框的值:
		var content = document.getElementById("content").value;
		if(content == null || content == ''){
			alert("评价内容不能为空!");
			return false;
		}
	}

</script>
<style type="text/css">
body{
	background:url("${pageContext.request.contextPath}/image/background.jpg");
}
.copyright{
	margin:25% 0 0 50%;
}
</style>
<%@page import="java.util.Date"%>
</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a>
					<img src="${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/W5P555VCFWH]TY0U{$AD9XW.gif" alt="魔幻商城" />
				</a>
			</div>
		</div>
		
	</div>
	<div class="container">
		<div class="span24 header">
			<ul class="mainNav nav nav-pills">
				<li><a href="${ pageContext.request.contextPath }/index.action">首页</a> |</li>
			</ul>
		</div>
	</div>
	<center><div id="makeContent" style="margin-top:100px;">
		<form action="${ pageContext.request.contextPath }/comment_add.action" method="post" onsubmit="return checkForm();">
			<input type="hidden" name="username" value="<s:property value='#session.existUser.username'/>" id="username"/>
			<input type="hidden" name="pid" value="<s:property value='#request.pid'/>" id="pid"/>
			<input type="hidden" name="cdate" id="cdate"/> 
			
			
			您对此商品的评价是几颗星？<select id="star" name="star">
				<option value="5" selected>5</option>
				<option value="4">4</option>
				<option value="3">3</option>
				<option value="2">2</option>
				<option value="1">1</option>
			</select><br/>
			<input type="hidden" id="state" name="state" />
			评价正文：<input type="text" required id="content" name="content" style="height:500px;width:80%;"/><br/>
			<input type="submit" value="提交评价"/>
		</form>
	</div></center>
	
	<div class="container footer">
		<div class="span24">
			<div class="copyright">All Rights Reserved  2017 MyMagicMall</div>
		</div>
	</div>
	<!-- test -->
	<script>
		/* alert(document.getElementById("username"));
		alert(document.getElementById("pid"));
		alert(document.getElementById("cdate").value);*/
	</script>
</body>
</html>