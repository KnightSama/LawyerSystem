package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.service.ClientService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("deleteClient")
@Scope("prototype")
public class DeleteClientAction extends ActionSupport{
	
	private String buttonName;
	private Map session;
	private LogtabService logtabService;
	private ClientService clientService;
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
	public LogtabService getLogtabService() {
		return logtabService;
	}
	@Resource
	public void setLogtabService(LogtabService logtabService) {
		this.logtabService = logtabService;
	}
	public ClientService getClientService() {
		return clientService;
	}
	@Resource
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	public String execute(){
    	session = ActionContext.getContext().getSession();
    	clientService.delete(Integer.parseInt(buttonName));
    	logtabService.addLog(session.get("username").toString(), "删除了客户编号为["+buttonName+"]的客户记录", "成功");
    	addActionMessage("deletesuccess");
    	return "success";
    }

}
