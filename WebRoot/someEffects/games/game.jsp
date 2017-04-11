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
	<style type="text/css">
	body {
		background:url("../welfare-disc-spinning/images/background.jpg");
	}
	#haha2048{
		position:absolute;
		margin: 163px 7px 11px 435px;
		z-index: 999;
	}
	#haha2048 a{
		text-decoration: none;
	}
	#haha2048 a:HOVER{
		font-size: 80px;
		color: #34e566;
	}
	.main53d{
		position: absolute;
		margin: 47px 0 0 45%;
	}
	</style>
  </head>
  
  <body>
  		<div id="haha2048"><a href="${basePath}game_play2048">2048</a></div>
  
      <div class="main53d">
		<ul>
			<li><img src="./images/main5-pic1.png"> </li>
			<li><img src="./images/main5-pic2.png"> </li>
			<li><img src="./images/main5-pic3.png"> </li>
		</ul>
	</div>
  </body>
</html>
