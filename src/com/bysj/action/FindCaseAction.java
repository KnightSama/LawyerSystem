package com.bysj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.model.Manager;
import com.bysj.service.CasebeginService;
import com.bysj.service.CaseendsService;
import com.bysj.service.CasefeeService;
import com.bysj.service.CaseprocessingService;
import com.bysj.service.FilelendService;
import com.bysj.service.LogtabService;
import com.bysj.util.CaseFind;
import com.bysj.util.ManagerFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("findCase")
@Scope("prototype")
public class FindCaseAction extends ActionSupport {
	
	private String caseID;
	private String lawyerID;
	private String indicter;
	private String indictee;
	private String caseProperty;
	private String suitValue;
	private String caseStartTime1;
	private String caseStartTime2;
	private String caseHandleTime1;
	private String caseHandleTime2;
	
	private CasebeginService casebeginService;
	private CaseendsService caseendsService;
	private CasefeeService casefeeService;
	private CaseprocessingService caseprocessingService;
	private FilelendService filelendService;
	
	private LogtabService logtabService;
	private Map session;
	public String getCaseID() {
		return caseID;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getLawyerID() {
		return lawyerID;
	}
	public void setLawyerID(String lawyerID) {
		this.lawyerID = lawyerID;
	}
	public String getIndicter() {
		return indicter;
	}
	public void setIndicter(String indicter) {
		this.indicter = indicter;
	}
	public String getIndictee() {
		return indictee;
	}
	public void setIndictee(String indictee) {
		this.indictee = indictee;
	}
	public String getCaseProperty() {
		return caseProperty;
	}
	public void setCaseProperty(String caseProperty) {
		this.caseProperty = caseProperty;
	}
	public String getSuitValue() {
		return suitValue;
	}
	public void setSuitValue(String suitValue) {
		this.suitValue = suitValue;
	}
	public String getCaseStartTime1() {
		return caseStartTime1;
	}
	public void setCaseStartTime1(String caseStartTime1) {
		this.caseStartTime1 = caseStartTime1;
	}
	public String getCaseStartTime2() {
		return caseStartTime2;
	}
	public void setCaseStartTime2(String caseStartTime2) {
		this.caseStartTime2 = caseStartTime2;
	}
	public String getCaseHandleTime1() {
		return caseHandleTime1;
	}
	public void setCaseHandleTime1(String caseHandleTime1) {
		this.caseHandleTime1 = caseHandleTime1;
	}
	public String getCaseHandleTime2() {
		return caseHandleTime2;
	}
	public void setCaseHandleTime2(String caseHandleTime2) {
		this.caseHandleTime2 = caseHandleTime2;
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
	public LogtabService getLogtabService() {
		return logtabService;
	}
	@Resource
	public void setLogtabService(LogtabService logtabService) {
		this.logtabService = logtabService;
	}
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	
	public String execute(){
		int resultNum,showNum,pageNum,nowPage = 1;
		boolean mark = true;
		
		CaseFind caseFind = new CaseFind();
		caseFind.setCaseHandleTime1(caseHandleTime1);
		caseFind.setCaseHandleTime2(caseHandleTime2);
		caseFind.setCaseID(caseID);
		caseFind.setCaseProperty(caseProperty);
		caseFind.setCaseStartTime1(caseStartTime1);
		caseFind.setCaseStartTime2(caseStartTime2);
		caseFind.setIndictee(indictee);
		caseFind.setIndicter(indicter);
		caseFind.setLawyerID(lawyerID);
		caseFind.setSuitValue(suitValue);
		
		session = ActionContext.getContext().getSession();
		session.put("caseFind",caseFind);		
		
		List<Casebegin> list = casebeginService.find(caseFind);
			
		if(list.isEmpty()){
			addActionMessage("fail");
			mark=false;
		}
		resultNum = list.size();
		showNum = (Integer) session.get("showNum");			
		if(resultNum%showNum==0)
			pageNum=resultNum/showNum;
		else{
			pageNum=(resultNum-(resultNum%showNum))/showNum+1;
		}						
		List<Casebegin> result = new ArrayList<Casebegin>();
		for(int i=(nowPage-1)*showNum;i<list.size()&&i<(nowPage-1)*showNum+showNum;i++){
			result.add(list.get(i));
		}
		ActionContext.getContext().put("casefind", caseFind);
		ActionContext.getContext().put("resultlist", result);
		ActionContext.getContext().put("resultNum", resultNum);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("nowPage", nowPage);
		session.put("nowPage", nowPage);	
		addActionMessage("success");
		if(mark)
			logtabService.addLog(session.get("username").toString(), "查询了案件信息", "成功");
		else {
			logtabService.addLog(session.get("username").toString(), "查询了案件信息", "失败");
		}
		return "success";
	}

}
