package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.service.CasebeginService;
import com.bysj.service.CaseendsService;
import com.bysj.service.CasefeeService;
import com.bysj.service.CaseprocessingService;
import com.bysj.service.FilelendService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("deleteCase")
@Scope("prototype")
public class DeleteCaseAction extends ActionSupport {

	private String buttonName;
	private Map session;
	private LogtabService logtabService;
	private CasebeginService casebeginService;
	private CaseendsService caseendsService;
	private CasefeeService casefeeService;
	private CaseprocessingService caseprocessingService;
	private FilelendService filelendService;
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
	public CasebeginService getCasebeginService() {
		return casebeginService;
	}
	@Resource
	public void setCasebeginService(CasebeginService casebeginService) {
		this.casebeginService = casebeginService;
	}
	public CaseendsService getCaseendsService() {
		return caseendsService;
	}
	@Resource
	public void setCaseendsService(CaseendsService caseendsService) {
		this.caseendsService = caseendsService;
	}
	public CasefeeService getCasefeeService() {
		return casefeeService;
	}
	@Resource
	public void setCasefeeService(CasefeeService casefeeService) {
		this.casefeeService = casefeeService;
	}
	public CaseprocessingService getCaseprocessingService() {
		return caseprocessingService;
	}
	@Resource
	public void setCaseprocessingService(CaseprocessingService caseprocessingService) {
		this.caseprocessingService = caseprocessingService;
	}
	public FilelendService getFilelendService() {
		return filelendService;
	}
	@Resource
	public void setFilelendService(FilelendService filelendService) {
		this.filelendService = filelendService;
	}
	
	public String execute(){
    	session = ActionContext.getContext().getSession();
    	casebeginService.delete(buttonName);
    	caseendsService.delete(buttonName);
    	casefeeService.delete(buttonName);
    	caseprocessingService.delete(buttonName);
    	filelendService.delete(buttonName);
    	logtabService.addLog(session.get("username").toString(), "删除了案件编号为["+buttonName+"]的案件记录", "成功");
    	addActionMessage("deletesuccess");
    	return "success";
    }
	

}
