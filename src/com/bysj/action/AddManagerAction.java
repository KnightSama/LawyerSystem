package com.bysj.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Manager;
import com.bysj.service.LogtabService;
import com.bysj.service.ManagerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("addManager")
@Scope("prototype")
public class AddManagerAction extends ActionSupport{
	
	private String username;
	private String password;
	private ManagerService managerService;
	private LogtabService logtabService;
	private Map session;
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
	public LogtabService getLogtabService() {
		return logtabService;
	}
	@Resource
	public void setLogtabService(LogtabService logtabService) {
		this.logtabService = logtabService;
	}
	
	
	@Override
	public String execute() throws Exception{
		if(managerService.hasuser(username))
		{
			addActionMessage("error");
			return "success";
		}
		else {
			session = ActionContext.getContext().getSession();
			Manager manager = new Manager();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String createdata =df.format(new Date());
			manager.setPassword(password);
			manager.setUsername(username);
			manager.setCreatedata(createdata);
			managerService.add(manager);
			logtabService.addLog(session.get("username").toString(),"添加一个新的管理员账户："+username, "成功");
			addActionMessage("success");
			return "success";
		}
	}

}
