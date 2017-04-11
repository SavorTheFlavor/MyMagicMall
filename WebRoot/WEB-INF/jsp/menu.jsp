<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="span10 last">
	<div class="topNav clearfix">
		<ul>
			<s:if test="#session.existUser == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a></li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>
			</li>
			</s:if>
			<s:else>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<s:property value="#session.existUser.name"/>
				余额:<s:property value="#session.existUser.balance"/>
				</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a></li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>
			</li>
			</s:else>
		
			<li><a href="${ pageContext.request.contextPath }/user_toCharge.action">充值</a></li>
			<li><a href="${ pageContext.request.contextPath }/someEffects/floatingVapor/exchange.jsp">积分兑换</a></li>
		</ul>
	</div>
</div>
	<div class="cart">
		<a href="${ pageContext.request.contextPath }/cart_myCart.action">购物车</a>
	</div>
<div class="container">
	<div class="span24 header">
		<ul class="mainNav nav nav-pills">
			<li><a href="${ pageContext.request.contextPath }/index.action">首页</a> |</li>
			<s:iterator var="c" value="#session.cList">
				<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a> |</li>
			</s:iterator>
	</ul>
	</div>
</div>
