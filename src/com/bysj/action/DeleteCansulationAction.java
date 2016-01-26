package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Cansulation;
import com.bysj.service.CansulationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("deleteCansulation")
@Scope("prototype")
public class DeleteCansulationAction extends ActionSupport{
	private String buttonName;
	private Map session;
	private CansulationService cansulationService;
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
	public CansulationService getCansulationService() {
		return cansulationService;
	}
	@Resource
	public void setCansulationService(CansulationService cansulationService) {
		this.cansulationService = cansulationService;
	}
	
	public String execute(){
    	session = ActionContext.getContext().getSession();
    	cansulationService.delete(Integer.parseInt(buttonName));
    	addActionMessage("deletesuccess");
    	return "success";
    }

}
