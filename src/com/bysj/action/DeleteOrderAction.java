package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("deleteOrder")
@Scope("prototype")
public class DeleteOrderAction extends ActionSupport{
	private String buttonName;
    private Map session;
    private OrderService orderService;
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public OrderService getOrderService() {
		return orderService;
	}
	@Resource
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
    
	 public String execute(){
	    	session = ActionContext.getContext().getSession();
	    	orderService.delete(Integer.parseInt(buttonName));
	    	addActionMessage("deletesuccess");
	    	return "success";
	    }

}
