<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=640"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>福利大转盘！！！！</title>

<!-- sweetAlert!!! -->
<script type="text/javascript" src="${pageContext.request.contextPath}/tools/sweetalert/js/sweet-alert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/tools/sweetalert/css/sweet-alert.css" />
<!-- .. -->

<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jQueryRotate.2.2.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<style type="text/css">
body{background:url("./images/background.jpg");}

.rotate-con-pan{background:url(images/disk.jpg) no-repeat 0 0;background-size:100% 100%;position:relative;width:480px;height:480px;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;margin:0 auto}
.rotate-con-zhen{width:112px;height:224px;background:url(images/start.png) no-repeat 0 0;background-size:100% 100%;cursor:pointer;position:absolute;left:180px;top:140px;}

.reward{
	width:372px;height:432px;
	margin:-422px 0 0 0;
	padding:35px;
	background-color: rgba(0, 220, 255, 0.23);
}

#redguy1{margin:46px 51px 15px 216px;}
#redguy2{margin: 134px 7px 11px 106px;}
#redguy3{margin: -49px 18px 24px 322px;}
#blueguy{margin: -358px 12px 3px 424px;}

.user_info{
	position: absolute;
	margin: 9px -4px 0 70%;
	color:pink;
}

</style>

</head>

<body>
	<div class="user_info">
		<div id="coupon">优惠券：<s:property value="#session.existUser.coupon"/>张</div>
		<div id="points">积分：<s:property value="#session.existUser.points"/></div>
		<div id="balance">钱：<s:property value="#session.existUser.balance"/>元</div>
	</div>
	<div class="rotate-con-pan">
	 	<div><img src="images/blueguy.gif" width="42" height="42" border="0" alt="" ></img></div>
	    <div id="redguy1"><img src="images/W5P555VCFWH]TY0U{$AD9XW.gif" width="43" height="50" border="0" alt="" ></img></div>
   		<div id="redguy2" ><img src="images/W5P555VCFWH]TY0U{$AD9XW.gif" width="43" height="50" border="0" alt="" ></img></div>
    	<div id="redguy3"><img src="images/W5P555VCFWH]TY0U{$AD9XW.gif" width="43" height="50" border="0" alt="" ></img></div>
		<div class="rotate-con-zhen"></div>
		<div id="blueguy"><img src="images/blueguy.gif" width="42" height="42" border="0" alt="" ></img></div>
	</div>
	
	<div class="reward">
		<div class="first_price"><h1>一等奖！</h1>
			999G学(fu)习(li)资(hao)料(che)！！！！尽情体验学习的快感吧！
		</div>
		<div class="second_price"><h2>二等奖！</h2>
			999元以及9999积分！！
		</div>
		<div class="third_price"><h3>三等奖！</h3>
			999积分！
		</div>
		<br />
		<div><h4>学习资料将以百度云网盘链接的形式发放</h4></div>
	</div>

<script type="text/javascript">
$(function(){
	$(".rotate-con-zhen").rotate({
		bind:{
			click:function(){
				var user = '<s:property value="#session.existUser"/>';
				if(!user){
					alert("请登录~！");
					return;
				}
				var isEnough = true;
				$.ajax({
					  type: "post",
					  dataType: "json",//返回的类型！！！！
					  url: "${pageContext.request.contextPath}/game_luckDraw.action",
					  async:false,//改为同步请求..
					  success:
						  function(data){
							  if(data.msg == "Non-existent"){
								  sweetAlert("请登录~！");
								  return;
							  }
							  if(data.msg == "notEnough"){
								  sweetAlert("优惠券不够了呢...");
								  isEnough = false;
								  return;
							  }
							  
							  $("#coupon").text('优惠券：'+data.coupon+'张');
							  $("#balance").text('钱：'+data.balance+'元');
							  $("#points").text('积分：'+data.points);
					  }
					});
					if(isEnough){
						var a = runzp();
						 $(this).rotate({
							 	duration:5000,               //转动时间
							 	angle: 0,                    //起始角度
		            			animateTo:1440+a.angle,      //结束的角度
								easing: $.easing.easeOutSine,//动画效果，需加载jquery.easing.min.js
								callback: function(){
									sweetAlert(a.prize+a.message);//简单的弹出获奖信息
									//根据不同的获奖情况分配奖品
									
									if(!(a.angle <= 373 && a.angle >= 344)){//一等奖不用发请求
										var wMoney=0,wPoints=0;
										if(a.angle>=226 && a.angle <= 256){//二等奖
											wMoney = 999;
											wPoints = 9999;
										}else if(a.angle >= 109 && a.angle <=136){//三等奖
											wMoney = 0;
											wPoints = 999;
										}
										
										$.ajax({
										  type: "post",
										  data:{"woney":wMoney,"woints":wPoints},
										  dataType: "json",//返回的类型！！！！
										  async:false,//改为同步请求..
										  url: "${pageContext.request.contextPath}/game_winning.action",
										  success:
											  function(data){
												  $("#coupon").text('优惠券：'+data.coupon+'张');
												  $("#balance").text('钱：'+data.balance+'元');
												  $("#points").text('积分：'+data.points);
										  }
										});
										
									}
								}
						 });
					}
			}
		}
	});
});
</script>
</body>
</html>