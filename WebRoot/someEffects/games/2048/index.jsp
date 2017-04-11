<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2048!!</title>

<!-- 这是从game.jsp请求转发而跳转过来的，所以 ./ 指的是game.jsp那个目录 -->
<link rel="stylesheet" type ="text/css" href="./2048/css/style.css" />

<script type="text/javascript" src="./2048/js/jquery.min.js"></script>
<script type="text/javascript" src="./2048/js/support.js"></script>
<script type="text/javascript" src="./2048/js/show.js"></script>
<script type="text/javascript" src="./2048/js/main.js"></script>

<style type="text/css">
	body {
		background:url("../welfare-disc-spinning/images/background.jpg");
	}
</style>

</head>
<body>

<div class="header">
    <h1>2048</h1>
    <a href="javascript:newgame();" id="newgamebutton"  onclick="newgame()">重新开始</a>
    <p>得分:<span id="score">0</span></p>
    <s:actionmessage/>
</div>

<div id="grid-container">
    <div class="grid-cell" id="grid-cell-0-0"></div>
    <div class="grid-cell" id="grid-cell-0-1"></div>
    <div class="grid-cell" id="grid-cell-0-2"></div>
    <div class="grid-cell" id="grid-cell-0-3"></div>

    <div class="grid-cell" id="grid-cell-1-0"></div>
    <div class="grid-cell" id="grid-cell-1-1"></div>
    <div class="grid-cell" id="grid-cell-1-2"></div>
    <div class="grid-cell" id="grid-cell-1-3"></div>

    <div class="grid-cell" id="grid-cell-2-0"></div>
    <div class="grid-cell" id="grid-cell-2-1"></div>
    <div class="grid-cell" id="grid-cell-2-2"></div>
    <div class="grid-cell" id="grid-cell-2-3"></div>

    <div class="grid-cell" id="grid-cell-3-0"></div>
    <div class="grid-cell" id="grid-cell-3-1"></div>
    <div class="grid-cell" id="grid-cell-3-2"></div>
    <div class="grid-cell" id="grid-cell-3-3"></div>
</div>
</body>
</html>