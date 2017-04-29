<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>积分兑换</title>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/someEffects/floatingVapor/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/floatingVapor/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/floatingVapor/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/floatingVapor/js/pngFix.js"></script>
<script type="text/javascript">
  DD_belatedPNG.fix('.png-fix');
</script>

<style type="text/css">
html{
	background: url("${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/background.jpg");
	z-index: -999;
}
p{color:rgb(72,121,76);font-size:23px;}
.user_info{
	position: absolute;
	font-size:20px;
	margin: 9px -4px 0 33%;
	color:pink;
}
.exchange{
	font-size:20px;
	color:pink;
	
}
#wrapper{
	margin: 0 0 0 10%;
}
</style>

</head>
<body>
<div><a href="${pageContext.request.contextPath}/index.action" style="text-decoration: none;"><h3>《--首页</h3></a></div>
<div id="wrapper">
	<div id="container">
    <div id="overlay" class="png-fix">
         <div id="title">
			The Points!
         </div>
    </div>
</div> 
			<div class="user_info">
				您当前的....<br/>
				<div id="coupon">优惠券：<s:property value="#session.existUser.coupon"/>张</div>
				<div id="points">积分：<s:property value="#session.existUser.points"/></div>
				<div id="balance">钱：<s:property value="#session.existUser.balance"/>元</div>
			</div>
			
			<div class="exchange">
				<form action="${pageContext.request.contextPath}/game_exchange.action">
					请输入要兑换的数量:<br/>
					积分换钱-->1024:10--><input type="number" name="money" /> <br/>
					积分换优惠券->1024:1-><input type="number" name="coupon" /><br/>
					钱换积分--->1:100---><input type="number" name="points" /><br/>
					<input type="submit"  value="确定"/><br/>
					<div><s:actionerror /></div><br/>
				</form>
			</div>    

<br />
<br />
<br />
</div>
<div style="text-align:center;clear:both">
</div>
</body>
</html>