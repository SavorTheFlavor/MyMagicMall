<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
body{
	background:url("${pageContext.request.contextPath}/image/background.jpg");
}
.copyright{
	margin:35% 0 0 50%;
}
</style>

<!-- sweetAlert!!! -->
<script type="text/javascript" src="${pageContext.request.contextPath}/tools/sweetalert/js/sweet-alert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/tools/sweetalert/css/sweet-alert.css" />
<!-- .. -->

<script type="text/javascript" src="${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/js/jquery-1.8.0.min.js"></script>

</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a>
				<img src="${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/blueguy.gif" alt="魔幻商城" />
			</a>
		</div>
	</div>
	<div class="span9">	
</div>
	
	<%@ include file="menu.jsp" %>
	
</div>	

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  >生成订单成功</li>
				</ul>
			</div>
	
		
				<table>
					<tbody>
					<tr>
						<th colspan="5">订单编号:<s:property value="model.oid"/>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
						<s:iterator var="orderItem" value="model.orderItems">
						<tr>
							<td width="60">
								<img src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"/>
							</td>
							<td>
								<s:property value="#orderItem.product.pname"/>
							</td>
							<td>
								<s:property value="#orderItem.product.shop_price"/>
							</td>
							<td class="quantity" width="60">
								<s:property value="#orderItem.count"/>
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#orderItem.subtotal"/></span>
							</td>
							
						</tr>
						</s:iterator>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice">￥<s:property value="model.total"/>元</strong>
				</div>
			<form id="orderForm" action="${ pageContext.request.contextPath }/order_payOrder.action" method="post">
				<input type="hidden" name="oid" value="<s:property value="model.oid"/>"/>
				<div class="span24">
					<p>
							收货地址：<input name="addr" type="text" value="<s:property value="model.user.addr"/>" style="width:350px" />
								<br />
							收货人&nbsp;&nbsp;&nbsp;：<input name="name" type="text" value="<s:property value="model.user.name"/>" style="width:150px" />
								<br /> 
							联系方式：<input name="phone" type="text"value="<s:property value="model.user.phone"/>" style="width:150px" />

						</p>
						<hr />
						<p style="text-align:right">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
				</div>
			</form>
		</div>
	
	</div>

	<div class="span24">
		<div class="copyright">All Rights Reserved  2017 MyInterestingShopMall</div>
	</div>
	<script type="text/javascript">
	//为orderForm表单绑定一个自定义的提交事件
	var form = $("#orderForm");
     var action = form.attr("action");
    form.on("submit",function(){
    
    	$.ajax({
		  type: "post",
		  data:form.serialize(),
		  dataType: "json",//返回的类型！！！！
		  url: action,
		  async:false,//改为同步请求..
		  success:
			  function(res){
			  	sweetAlert(res.msg);
		  }
		});
        return false;//阻止原本的提交事件
    });
	</script>
</body>
</html>