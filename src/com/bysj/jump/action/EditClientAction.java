package com.bysj.jump.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.model.Caseends;
import com.bysj.model.Casefee;
import com.bysj.model.Caseprocessing;
import com.bysj.model.Client;
import com.bysj.model.Filelend;
import com.bysj.service.ClientService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("editClientjump")
@Scope("prototype")
public class EditClientAction extends ActionSupport{
	private String buttonName;
	private Map session;
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
	public ClientService getClientService() {
		return clientService;
	}
	@Resource
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}
	
	public String execute(){
		List<Client> list = clientService.find(Integer.parseInt(buttonName)); 
		ActionContext.getContext().put("client", list.get(0));
		return "success";
	}

}
