package com.bysj.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Orders;
import com.bysj.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

@Component("AddOrder")
@Scope("prototype")
public class AddOrderAction extends ActionSupport{
	
	private int uid;
	private String name;
	private String theme;
	private String phone;
	private String address;
    private int ismark;
    
    private OrderService orderService;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getIsmark() {
		return ismark;
	}

	public void setIsmark(int ismark) {
		this.ismark = ismark;
	}

	public OrderService getOrderService() {
		return orderService;
	}
	@Resource
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
    
	public String execute() throws Exception {
		Orders order = new Orders();
		order.setAddress(address);
		order.setIsmark(0);
		order.setName(name);
		order.setPhone(phone);
		order.setTheme(theme);
		orderService.addOrder(order);
		return "success";
	}
    

}
