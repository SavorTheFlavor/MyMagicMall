<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>enjoy!!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="./css/recert.css">
	<script type="text/javascript" src="./js/jquery-1.8.0.min.js"></script>
	<!-- 懒得新建css文件，直接写这里算了 -->
	<style type="text/css">
	body {
		background:url("../welfare-disc-spinning/images/background.jpg");
	}
	#haha2048{
		position:absolute;
		margin: 194px 7px 11px 435px;
		z-index: 999;
	}
	#haha2048 a{
		text-decoration: none;
	}
	#haha2048 a:HOVER{
		font-size: 80px;
		color: #34e566;
	}
	#donkeyjump{
		position:absolute;
		margin: 48px 7px 11px 635px;
		z-index: 999;
	}
	#donkeyjump a{
		text-decoration: none;
	}
	#donkeyjump a:HOVER{
		font-size: 80px;
		color: #34e526;
	}
	#tetris{
		position:absolute;
		margin: 196px 7px 11px 855px;
		z-index: 999;
	}
	#tetris a{
		text-decoration: none;
	}
	#tetris a:HOVER{
		font-size: 80px;
		color: #34e526;
	}
	.main53d{
		position: absolute;
		margin: 47px 0 0 45%;
	}
	</style>
	<script type="text/javascript">
		$(function(){
			//为donkeyjump绑定hover事件
			$("#donkeyjump a").on("mouseover mouseout",function(event){
			 if(event.type == "mouseover"){
			  //鼠标悬浮
			  	this.innerHTML = "DONKEY JUMP!!!";
			 }else if(event.type == "mouseout"){
			  //鼠标离开
			   this.innerHTML = "donkeyjump";
			 }
			})
		})
	</script>
  </head>
  
  <body>
  		<div id="haha2048"><a href="${basePath}game_play2048.action">2048</a></div>
  		<div id="donkeyjump"><a href="${basePath}game_playDonkeyjump.action">donkeyjump</a></div>
  		<div id="tetris"><a href="${basePath}game_playTetris.action">Tetris!</a></div>
      <div class="main53d">
		<ul>
			<li><img src="./images/main5-pic1.png"> </li>
			<li><img src="./images/main5-pic2.png"> </li>
			<li><img src="./images/main5-pic3.png"> </li>
		</ul>
	</div>
  </body>
</html>
