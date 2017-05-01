<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>魔幻商城</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
<script>
	function saveCart(){
		document.getElementById("cartForm").submit();
	}
	
	function getIntroduction() {
		document.getElementById("introduction").innerHTML = "<div class='title'><strong><s:property value='model.pdesc'/></strong></div><div><img src='${pageContext.request.contextPath }/<s:property value='model.image'/>' /></div>";
	}
	
	//ajax
	function getComment(){
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("introduction").innerHTML = xhr.responseText;
					/* test */
					//alert("ok");
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/comment_findByPid.action?time="+new Date().getTime()+"&pid=<s:property value="model.pid"/>",true);
		
		/* test */
		//alert("ok");
		
		// 4.发送
		xhr.send(null);
		
		/* test */
		//alert("ok");
	}
	
	function createXmlHttp(){
		   var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
		 }
	
	/*function change(){
		var changeDiv = document.getElementById("introduction");//要展示内容的div
		changeDiv.innerHTML="${pageContext.request.contextPath}/checkImg.action?"+new Date().getTime();
	}*/
</script>
<style type="text/css">
body{
	background:url("${pageContext.request.contextPath}/image/background.jpg");
}
</style>

</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a>
				<img src="${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/blueguy.gif" alt="魔幻商城">
			</a>
		</div>
	</div>
	
	<%@ include file="menu.jsp" %>

</div><div class="container productContent">
		<div class="span6">
			<div class="hotProductCategory">
					<s:iterator var="c" value="#session.cList">
						<dl>
							<dt>
								<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
							</dt>
								<s:iterator var="cs" value="#c.categorySeconds">
									<dd>
										<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
									</dd>
								</s:iterator>	
						</dl>
					</s:iterator>	
			</div>
			

		</div>
		
		<div class="span18 last">
			
			<div class="productImage">
					<a title="" style="outline-style: none; text-decoration: none;" id="zoom" href="http://image/r___________renleipic_01/bigPic1ea8f1c9-8b8e-4262-8ca9-690912434692.jpg" rel="gallery">
						<div class="zoomPad"><img style="opacity: 1;" title="" class="medium" src="${ pageContext.request.contextPath }/<s:property value="model.image"/>"><div style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;" class="zoomPup"></div><div style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;" class="zoomWindow"><div style="width: 368px;" class="zoomWrapper"><div style="width: 100%; position: absolute; display: none;" class="zoomWrapperTitle"></div><div style="width: 0%; height: 0px;" class="zoomWrapperImage"><img src="%E5%B0%9A%E9%83%BD%E6%AF%94%E6%8B%89%E5%A5%B3%E8%A3%852013%E5%A4%8F%E8%A3%85%E6%96%B0%E6%AC%BE%E8%95%BE%E4%B8%9D%E8%BF%9E%E8%A1%A3%E8%A3%99%20%E9%9F%A9%E7%89%88%E4%BF%AE%E8%BA%AB%E9%9B%AA%E7%BA%BA%E6%89%93%E5%BA%95%E8%A3%99%E5%AD%90%20%E6%98%A5%E6%AC%BE%20-%20Powered%20By%20Mango%20Team_files/6d53c211-2325-41ed-8696-d8fbceb1c199-large.jpg" style="position: absolute; border: 0px none; display: block; left: -432px; top: 0px;"></div></div></div><div style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;" class="zoomPreload">Loading zoom</div></div>
					</a>
				
			</div>
			<div class="name"><s:property value="model.pname"/></div>
			<div class="sn">
				<div>编号：<s:property value="model.pid"/></div>
			</div>
			<div class="info">
				<dl>
					<dt>商城价:</dt>
					<dd>
						<strong>￥：<s:property value="model.shop_price"/>元</strong>
							参 考 价：
							<del>￥<s:property value="model.market_price"/>元</del>
							&nbsp;已 出 售：  <strong><s:property value="model.sale_count"/></strong>件
					</dd>
				</dl>
					<dl>
						<dt>促销:</dt>
						<dd>
								<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
						</dd>
					</dl>
					<dl>
						<dt>    </dt>
						<dd>
							<span>    </span>
						</dd>
					</dl>
			</div>
						<form id="cartForm" action="${ pageContext.request.contextPath }/cart_addCart.action" method="post" >
				<input type="hidden" name="pid" value="<s:property value="model.pid"/>"/>
				<div class="action">
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input id="count" name="count" value="1" maxlength="4" onpaste="return false;" type="text"/>
							</dd>
							<dd>
								件
							</dd>
						</dl>
						
					<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button" onclick="saveCart()"/>
					</div>
				</div>
			</form>
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="#introduction" onclick="getIntroduction()">商品介绍</a>
						</li>
						<li id="commentTab">
							<a href="#comment" onclick="getComment()">商品评价</a>
						</li>
				</ul>
			</div>
				
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong><s:property value="model.pdesc"/></strong>
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/<s:property value="model.image"/>" />
					</div>
				</div>
				
		</div>
	</div>
</body>
</html>