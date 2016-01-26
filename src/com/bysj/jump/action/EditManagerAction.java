package com.bysj.jump.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Manager;
import com.bysj.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("editManagerjump")
@Scope("prototype")
public class EditManagerAction extends ActionSupport{
	private String buttonName;
	private Map session;
	private ManagerService managerService;

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

	public ManagerService getManagerService() {
		return managerService;
	}

	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	public String execute(){
		List<Manager> list = managerService.find(buttonName);
		System.out.println(list.get(0));
		ActionContext.getContext().put("resultlist", list.get(0));
		return "success";
	}
}
