package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Manager;
import com.bysj.service.LogtabService;
import com.bysj.service.ManagerService;
import com.bysj.util.ManagerEdit;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("editManager")
@Scope("prototype")
public class EditManagerAction extends ActionSupport{

	private String buttonName;
	private String username;
	private String password;
	private String authority;
	private Map session;
	private ManagerService managerService;
	private LogtabService logtabService;
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
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
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
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
	public String execute(){
		if(buttonName.equals("save"))
		{
			ManagerEdit managerEdit = new ManagerEdit();
			managerEdit.setAuthority(Integer.parseInt(authority));
			managerEdit.setPassword(password);
			managerEdit.setUsername(username);
			managerService.update(managerEdit);
			session = ActionContext.getContext().getSession();
			logtabService.addLog(session.get("username").toString(), "修改了管理员["+username+"]的信息", "成功");
			addActionMessage("editsuccess");
		}
		else{
			addActionMessage("editfail");
		}
		return "success";
	}
}
