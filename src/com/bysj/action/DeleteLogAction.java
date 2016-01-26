package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("deleteLog")
@Scope("prototype")
public class DeleteLogAction extends ActionSupport{
    private String buttonName;
    private Map session;
    private LogtabService logtabService;
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
	
    public String execute(){
    	session = ActionContext.getContext().getSession();
    	logtabService.delete(Integer.parseInt(buttonName));
    	logtabService.addLog(session.get("username").toString(), "删除了一条日志", "成功");
    	addActionMessage("deletesuccess");
    	return "success";
    }
}
