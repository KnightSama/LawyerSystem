package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Manager;
import com.bysj.service.LogtabService;
import com.bysj.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("manager")
@Scope("prototype")
public class ManagerAction extends ActionSupport {

	private String username;
	private String password;
	private String code;
	private ManagerService managerService;
	private LogtabService logtabService;
	public LogtabService getLogtabService() {
		return logtabService;
	}
	@Resource
	public void setLogtabService(LogtabService logtabService) {
		this.logtabService = logtabService;
	}

	private Map session;

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ManagerService getManagerService() {
		return managerService;
	}

	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	@Override
	public String execute() throws Exception {
		Manager manager = new Manager();
		manager.setPassword(password);
		manager.setUsername(username);
        String result = managerService.check(manager);
		if(result.equals("null"))
			addActionMessage("nouser");
		if(result.equals("success"))
			{
			 session = ActionContext.getContext().getSession();
			 session.put("username", username);
			 session.put("showNum", 5);
			 addActionMessage("success");
			 logtabService.addLog(username, "登录系统", "成功");
			}
		if(result.equals("fail"))
		{
			addActionMessage("fail");
			logtabService.addLog(username, "使用错误密码["+password+"]登录系统", "失败");
		}
		return result;
	}

}
