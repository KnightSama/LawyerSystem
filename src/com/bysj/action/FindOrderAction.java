package com.bysj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Logtab;
import com.bysj.model.Orders;
import com.bysj.service.OrderService;
import com.bysj.util.LogFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("fingOrder")
@Scope("prototype")
public class FindOrderAction extends ActionSupport{
	
	private Map session;
	private OrderService orderService;
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
		int resultNum,showNum,pageNum,nowPage = 1;
		boolean mark = true;
		session = ActionContext.getContext().getSession();	
        List<Orders> list = orderService.find();
		if(list.isEmpty()){
			addActionMessage("fail");
			mark=false;
		}	
		resultNum = list.size();
		showNum = (Integer) session.get("showNum");			
		if(resultNum%showNum==0)
			pageNum=resultNum/showNum;
		else{
			pageNum=(resultNum-(resultNum%showNum))/showNum+1;
		}						
		List<Orders> result = new ArrayList<Orders>();
		for(int i=(nowPage-1)*showNum;i<list.size()&&i<(nowPage-1)*showNum+showNum;i++){
			result.add(list.get(i));
		}
		ActionContext.getContext().put("resultlist", result);
		ActionContext.getContext().put("resultNum", resultNum);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("nowPage", nowPage);
		session.put("nowPage", nowPage);	
		addActionMessage("success");
		return "success";
	}

}
