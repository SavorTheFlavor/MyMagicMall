package com.me.shop.action;

import java.io.IOException;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.me.shop.service.OrderService;
import com.me.shop.service.ProductService;
import com.me.shop.service.UserService;
import com.me.shop.utils.PageBean;
import com.me.shop.vo.Cart;
import com.me.shop.vo.CartItem;
import com.me.shop.vo.Order;
import com.me.shop.vo.OrderItem;
import com.me.shop.vo.Product;
import com.me.shop.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 订单Action类
 * 
 * 
 */
public class OrderAction extends ActionSupport implements ModelDriven<Order> {
	// 模型驱动使用的对象
	private Order order = new Order();

	public Order getModel() {
		return order;
	}

	
	//注入UserService，提供set方法，让spring自动在ioc容器中查找该对象并注入
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//注入ProductService（用于提交订单时修改商品数量），提供set方法，让spring自动在ioc容器中查找该对象并注入
		private ProductService productService;
		public void setProductService(ProductService productService) {
			this.productService = productService;
		}

	// 接收page
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	// 注入OrderService
	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	// 生成订单的执行的方法:
	public String saveOrder() {

		// 调用Service完成数据库插入的操作:
		// Order order = new Order();
		// 设置订单的总金额:订单的总金额应该是购物车中总金额:
		// 购物车在session中,从session总获得购物车信息.
		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
				.getAttribute("cart");
		if (cart == null) {
			this.addActionMessage("亲!您还没有购物!");
			return "msg";
		}
		order.setTotal(cart.getTotal());
		// 设置订单的状态
		order.setState(1); // 1:未付款.
		// 设置订单时间
		order.setOrdertime(new Date());
		// 设置订单关联的客户:
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		if (existUser == null) {
			this.addActionMessage("亲!您还没有登录!");
			return "msg";
		}
		order.setUser(existUser);
		// 设置订单项集合:
		for (CartItem cartItem : cart.getCartItems()) {
			// 订单项的信息从购物项获得的.
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setOrder(order);

			order.getOrderItems().add(orderItem);
		}
		orderService.save(order);
		// 清空购物车:
		cart.clearCart();

		// 页面需要回显订单信息:
		// 使用模型驱动了 所有可以不使用值栈保存了
		// ActionContext.getContext().getValueStack().set("order", order);

		return "saveOrder";
	}

	// 查询我的订单:
	public String findByUid() {
		// 获得用户的id.
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		// 获得用户的id
		Integer uid = existUser.getUid();
		// 根据用户的id查询订单:
		PageBean<Order> pageBean = orderService.findByUid(uid, page);
		// 将PageBean数据带到页面上.
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUid";
	}

	// 根据订单id查询订单:
	public String findByOid() {
		order = orderService.findByOid(order.getOid());
		return "findByOid";
	}

	// 为订单付款:
	public String payOrder() throws IOException {
		// 1.修改数据:
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setPhone(order.getPhone());
		// 修改订单
		orderService.update(currOrder);
		// 2.完成付款:
		double payment = currOrder.getTotal();
		User existUser = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("existUser");
		double restMoney = existUser.getBalance() - payment;
		if(restMoney < 0){
			String json="{\"msg\":\"not enough!!\"}";
			ServletActionContext.getResponse().getWriter().print(json);
			ServletActionContext.getResponse().getWriter().close();
			return "orderPage";//钱不够跳转回原来的order.jsp
		}
		existUser.setBalance(restMoney);
		int givenPoints = (int)Math.floor(payment);
		existUser.setPoints(existUser.getPoints()+givenPoints);//赠送的积分
		userService.update(existUser);
		
		// 修改订单状态为2:已经付款:
		currOrder.setState(2);
		orderService.update(currOrder);
		this.addActionMessage("支付成功!订单编号为: "+currOrder.getOid()+" 付款金额为: "+currOrder.getTotal()+"元   获赠积分"+String.valueOf(givenPoints)+"点....我们将尽快为您安排发货！");
		
		//修改订单中的商品的销量
		for(OrderItem orderItem : currOrder.getOrderItems()){
			Product product = orderItem.getProduct();
			product.setSale_count(product.getSale_count() + orderItem.getCount());
			//test
			System.out.println(product.getPname()+"销量："+product.getSale_count());
			productService.update(product);
		}
		
		return "paySuccess";
	}
	// 修改订单的状态:
	public String updateState(){
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(4);
		orderService.update(currOrder);
		return "updateStateSuccess";
	}
}
