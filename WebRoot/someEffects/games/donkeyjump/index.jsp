<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta charset="UTF-8" />
		<title>Donkey Jump</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/someEffects/games/donkeyjump/css/main.css" />
		<!-- sweetAlert!!! -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/tools/sweetalert/js/sweet-alert.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/tools/sweetalert/css/sweet-alert.css" />
		<!-- .. -->
	</head>
	<body>
		<div id="donkeyJump">
			<!-- 预备界面 -->
			<div id="gameCover" class="block background">
<!-- 	 //为了缩减体积所以干掉了声音这功能			声音控制按钮 -->
<!-- 				<a href="javascript:void(0)" id="btnSound" class="icon">&nbsp;</a> -->
				<!-- 成就 -->
				<a href="javascript:void(0)" id="btnCup" class="icon">&nbsp;</a>
				<!-- 排行榜 -->
				<a href="javascript:void(0)" id="btnScore" class="icon">&nbsp;</a>
				<!-- 开始 -->
				<a href="javascript:void(0)" id="btnPlay" class="icon">&nbsp;</a>
				<!-- 更多 -->
				<a href="javascript:void(0)" id="btnMore" class="icon">&nbsp;</a>
				<!-- 分享 -->
				<a href="javascript:void(0)" id="btnShare" class="icon">&nbsp;</a>
				<!-- 加载资源 -->
				<span id="progressText"></span>
			</div>
			<!-- 游戏主体 -->
			<div id="gameBody" class="block">
				<div id="gameCanvas" class="block">
					<!-- 天空背景层 -->
					<canvas width="480" height="800" id="canvasSkyLayer"></canvas>
					<!-- 远景山丘背景层 -->
					<canvas width="480" height="800" id="canvasHillLayer"></canvas>
					<!-- 近景山丘背景层 -->
					<canvas width="480" height="800" id="canvasHillNearLayer"></canvas>
					<!-- 房子背景层 -->
					<canvas width="480" height="800" id="canvasFloorLayer"></canvas>
					<!-- 白云精灵层 -->
					<canvas width="480" height="800" id="canvasStairLayer"></canvas>
					<!-- 驴子精灵层 -->
					<canvas width="480" height="800" id="canvasDonkeyLayer"></canvas>
					<!-- 效果精灵层 -->
					<canvas width="480" height="800" id="canvasEffectLayer"></canvas>
				</div>
				<!-- 分数及暂停按钮 -->
				<div id="numberAndPause" class="block">
					<!-- 分数 -->
					<div id="number" class="icon"></div>
					<!-- 暂停 -->
					<a href="javascript:void(0)" id="btnPause" class="icon">&nbsp;</a>
				</div>
				<!-- 预备 -->
				<div id="beingReady" class="icon">
					&nbsp;
				</div>
				<!-- 开始 -->
				<div id="beingGo" class="icon">
					&nbsp;
				</div>
				<!-- 暂停面板 -->
				<div id="panelResume" class="icon">
					<!-- 返回列表 -->
					<a href="javascript:void(0)" id="btnResumeExit">&nbsp;</a>
					<!-- 继续游戏 -->
					<a href="javascript:void(0)" id="btnResume">&nbsp;</a>
				</div>
			</div>
			<!-- 游戏结束 -->
			<div id="gameOver" class="block background">
				<!-- 分享 -->
				<a href="javascript:void(0)" id="btnShare2" class="icon">&nbsp;</a>
				<!-- 名字 -->
				<span id="name"></span>
				<!-- 得分 -->
				<span id="score"></span>
				<!-- 排行榜 -->
				<a href="javascript:void(0)" id="btnScore2" class="icon">&nbsp;</a>
				<!-- 准备 -->
				<a href="javascript:void(0)" id="btnRetry" class="icon">&nbsp;</a>
				<!-- 更多 -->
				<a href="javascript:void(0)" id="btnMore2" class="icon">&nbsp;</a>
				<!-- 成就 -->
				<a href="javascript:void(0)" id="btnCup2" class="icon">&nbsp;</a>
			</div>
		</div>
		<!-- jquery -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/js/jquery-1.8.0.min.js"></script>
		
		<!-- engine -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/core/my.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Component.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/DisplayObject.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/DisplayObjectContainer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Bitmap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Animation.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Sprite.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Viewport.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Layer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/component/Game.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/event/KeyEvent.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/utils/ImageManager.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/utils/DOM.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/utils/Math.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/myEngine/utils/buzz.js"></script>
		<!-- donkey jump -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/resources/images.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/frames/prop.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/frames/stair.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/frames/donkey.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/frames/effect.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/classes/Prop.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/classes/Stair.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/classes/Cloud.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/classes/Donkey.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/classes/DonkeyJump.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/classes/UI.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/games/donkeyjump/js/main.js"></script>
	</body>
</html>