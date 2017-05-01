<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>魔幻商城</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>	
	<!-- 游戏相关放样式，懒得放文件里 -->
	<style type="text/css">
		body{
			background: url("${pageContext.request.contextPath}/image/background.jpg");
		}
		#time{
			padding: 21px 8px 42px 91px;
    		margin: -20px 3px 0 0;
		 }
		#canvas{
			position:absolute;
			z-index:-99;
		}
		.welfare{
			position:absolute;
			width:90px;
			height:50px;
			text-align:center;
			margin: 0 0 0 0;
			background: url("${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/W5P555VCFWH]TY0U{$AD9XW.gif");
		}
		.welfare:HOVER{
			font-size:60px;
			background: url("${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/blueguy.gif");
		}
		.game{
			position:absolute;
			width:90px;
			height:50px;
			text-align:center;
			margin: 0 0 0 140px;
			background: url("${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/blueguy.gif");
		}
		.game:HOVER{
			font-size:60px;
			background: url("${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/images/W5P555VCFWH]TY0U{$AD9XW.gif");
		}
	</style>

	
	<!-- 特效 -->
	<link href="${pageContext.request.contextPath}/decorations/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
	<link href="${pageContext.request.contextPath}/decorations/css/bootstrap-responsive.min.css" rel="stylesheet"
		media="screen" />
	<link href="${pageContext.request.contextPath}/decorations/css/style.css" rel="stylesheet" media="screen" />
	<link href="${pageContext.request.contextPath}/decorations/css/settings.css" rel="stylesheet" media="screen" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/decorations/css/component.css" />
	<link href="${pageContext.request.contextPath}/decorations/css/another_style.css" rel="stylesheet" type="text/css"
		media="all" />
	<link href="${pageContext.request.contextPath}/decorations/css/popuo-box.css" rel="stylesheet" type="text/css"
		media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/decorations/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/decorations/js/responsiveslides.min.js"></script>
	<!-- 特效-->
	
	<!-- 排行榜效果 -->
	<style>
    #sale-ranking ul{counter-reset:section;padding-bottom:20px;}
    #sale-ranking li{width:300px; border-bottom: 1px dotted #ccc; line-height: 30px; height: 30px; overflow:hidden }
    #sale-ranking li:before{counter-increment:section;content:counter(section);display:inline-block;padding:0 6px;margin-right:10px;height:18px;line-height:18px;background:#717070;color:#fff;border-radius:3px;font-size:9px}
    #sale-ranking li:nth-child(1):before{background:#ff6a00}
    #sale-ranking li:nth-child(2):before{background:#107db4}
    #sale-ranking li:nth-child(3):before{background:#56ae11}
    #sale-ranking li{width:300px; border-bottom: 1px dotted #ccc; line-height: 30px; height: 30px; overflow:hidden }
    #sale-ranking li i{display:inline-block;font-style:initial;padding:0 6px;margin-right:10px;height:18px;line-height:18px;background:#717070;color:#fff;border-radius:3px;font-size:9px}
    #sale-ranking .red1{background:#ff6a00}
    #sale-ranking .red2{background:#107db4}
    #sale-ranking .red3{background:#56ae11}
    #sale-ranking li a:hover {font-size:24px;}
	</style>
	 
<script>
    listsort()
    //显示排行
    function listsort() {
        var index = 0;
        $("#sale-ranking li").each(function () {
            index++;
            var num = $("<i>" + index + "</i>");
            if (index <= 3)
                num.addClass("red" +index);
            $(this).prepend(num);
        });
    }
</script>
</head>
<body>
<!-- 绚丽时钟 -->
<!-- <div id="time"><canvas id = "canvas" ></canvas></div> -->


<div class="container header">

	<div class="welfare">
		<a href="${pageContext.request.contextPath}/someEffects/welfare-disc-spinning/welfare.jsp"  target="_blank">福利大转盘</a>
	</div>
	<div class="game">
		<a href="${pageContext.request.contextPath}/someEffects/games/game.jsp"  target="_blank">游戏畅玩</a>
	</div>
	<div class="span9">
  </div>
	
	<%@ include file="menu.jsp" %>

</div>	
<div class="container index" style="height:100%;">
		<!-- 展示销量排行榜 -->
		<div style="position:fixed;z-index:999;top:300px;left:0;background-color:#232323;width:310px;" id="sale-ranking">
			<center><div style="color:white;font-size:28px;margin-top:20px;margin-bottom:20px;">销售排行榜</div></center>
			<ul>
				<s:iterator var="p" value="rList">
				    <li><a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><s:property value="#p.pname"/></a><span style="color:white;display:inline-block;float:right;"><s:property value="#p.sale_count"/></span></li>
				    
			    </s:iterator>
			</ul>
		</div>

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong style="color:red;">hot！！！</strong>
					</div>
					<ul class="tab">
							<li>
								<a target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
					
						<div class="goodsList">
							<s:iterator var="p" value="hList" status="st">
								<div class="ca-item ca-item-<s:property value="#st.index"/>">
									<div class="ca-item-main">
										<div class="ca-icon">
										<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img class="img-responsive " src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" style="display: block;"></a>
										</div>
										<h3>
										<a href="#"><s:property value="#p.pname"/></a>
										</h3>
										<div class="price">
											<h4 class="item_price"><s:property value="#p.shop_price"/>元</h4>
											<h6 class="item_price" style="text-decoration:line-through"><s:property value="#p.market_price"/>元</h6>
										<a
											href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"
													class="item_add ca-more">buy...</a>
										<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</s:iterator>		
						</div>
						
	
			</div>
		</div>

		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>二手货</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>					
						 <ul class="tabContent" style="display: block;">
						 	<s:iterator var="p" value="nList">
									<li>
										<a href="${ pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>									
										</li>
							</s:iterator>		
						</ul>
						
			</div>
		</div>
	</div>
<div class="container footer" style="background:rgba(255,255,255,0.5);">
		<div style="font-size:4px;color:pink">你是管理员？<a style="font-size:4px" href="${pageContext.request.contextPath}/admin/index.jsp">后台登录</a></div>
		<div class="copyright">All Rights Reserved  2017 MyMagicMall</div>
	</div>
	
      <script src="${pageContext.request.contextPath}/someEffects/countdown/js/digits.js" type="text/javascript"></script>
       <script charset="utf-8" src="${pageContext.request.contextPath}/countdown/js/countdown.js" type="text/javascript"></script>
</body>
</html>