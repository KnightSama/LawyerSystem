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
import com.bysj.model.Filelend;
import com.bysj.service.CasebeginService;
import com.bysj.service.CaseendsService;
import com.bysj.service.CasefeeService;
import com.bysj.service.CaseprocessingService;
import com.bysj.service.FilelendService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("PrintCasejump")
@Scope("prototype")
public class PrintCaseAction extends ActionSupport{
	
	private String buttonName;
	private String does;
	private Map session;
	private String topage;
	private String showMany;
	private CasebeginService casebeginService;
	private CaseendsService caseendsService;
	private CasefeeService casefeeService;
	private CaseprocessingService caseprocessingService;
	private FilelendService filelendService;
	private LogtabService logtabService;
	
	public String getDoes() {
		return does;
	}
	public void setDoes(String does) {
		this.does = does;
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
		if(does.equals("casebegin")){
			List<Casebegin> list1 = casebeginService.find(buttonName);
			ActionContext.getContext().put("casebegin", list1.get(0));
			ActionContext.getContext().put("topage", topage);
			ActionContext.getContext().put("showMany", showMany);
			logtabService.addLog(session.get("username").toString(), "答印了案件编号为"+buttonName+"的案件开始单", "");
			return "casebegin";
		}
		if(does.equals("caseends")){
			List<Caseends> list2 = caseendsService.find(buttonName);
			ActionContext.getContext().put("caseends", list2.get(0));
			ActionContext.getContext().put("topage", topage);
			ActionContext.getContext().put("showMany", showMany);
			logtabService.addLog(session.get("username").toString(), "答印了案件编号为"+buttonName+"的案件结束单", "");
			return "caseends";
		}
		if(does.equals("casefee")){
			List<Casefee> list3 = casefeeService.find(buttonName);
			String name = casefeeService.findClient(buttonName);
			ActionContext.getContext().put("clientname", name);
			ActionContext.getContext().put("casefee", list3.get(0));
			ActionContext.getContext().put("topage", topage);
			ActionContext.getContext().put("showMany", showMany);
			logtabService.addLog(session.get("username").toString(), "答印了案件编号为"+buttonName+"的案件收费单", "");
			return "casefee";
		}
		if(does.equals("caseprocessing")){
			List<Caseprocessing> list4 = caseprocessingService.find(buttonName);
			ActionContext.getContext().put("caseprocessing", list4.get(0));
			ActionContext.getContext().put("topage", topage);
			ActionContext.getContext().put("showMany", showMany);
			logtabService.addLog(session.get("username").toString(), "答印了案件编号为"+buttonName+"的案件处理单", "");
			return "caseprocessing";
		}
		if(does.equals("filelend")){
			List<Filelend> list5 = filelendService.find(buttonName);
			ActionContext.getContext().put("filelend", list5.get(0));
			ActionContext.getContext().put("topage", topage);
			ActionContext.getContext().put("showMany", showMany);
			logtabService.addLog(session.get("username").toString(), "答印了案件编号为"+buttonName+"的卷宗借阅单", "");
			return "filelend";
		}		
		return "success";
	}

}

