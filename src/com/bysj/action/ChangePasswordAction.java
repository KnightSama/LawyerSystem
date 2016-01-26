package com.bysj.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Manager;
import com.bysj.service.LogtabService;
import com.bysj.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("changePassword")
@Scope("prototype")
public class ChangePasswordAction extends ActionSupport{
	private String password;
	private String password1;
	private ManagerService managerService;
	private LogtabService logtabService;
	private Map session;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public ManagerService getManagerService() {
		return managerService;
	}
	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	public LogtabService getLogtabService() {
		return logtabService;
	}
	@Resource
	public void setLogtabService(LogtabService logtabService) {
		this.logtabService = logtabService;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	
	
	public String execute() throws Exception{
		session = ActionContext.getContext().getSession();
		String username = session.get("username").toString();
		Manager manager = new Manager();
		manager.setPassword(password);
		manager.setUsername(username);
		String result = managerService.check(manager);
		if(result.equals("fail"))
			addActionMessage("fail");
		else {
			manager.setPassword(password1);
			managerService.changePassword(manager);
			logtabService.addLog(username, "更改了系统密码", "成功");
			addActionMessage("success");
		}	
		return "success";
	}
}
