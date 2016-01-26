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
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("LookClientjump")
@Scope("prototype")
public class LookClientAction extends ActionSupport{
	
	private String buttonName;
	private Map session;
	private String topage;
	private String showMany;
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
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}
	public String getShowMany() {
		return showMany;
	}
	public void setShowMany(String showMany) {
		this.showMany = showMany;
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
		List<Client> list = clientService.find(Integer.parseInt(buttonName));
		ActionContext.getContext().put("client", list.get(0));
		ActionContext.getContext().put("topage", topage);
		ActionContext.getContext().put("showMany", showMany);
		session = ActionContext.getContext().getSession();
		logtabService.addLog(session.get("username").toString(), "查看了客户编号为["+buttonName+"]的信息", "成功");
		return "success";
	}
	

}
