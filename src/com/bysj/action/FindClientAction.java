package com.bysj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.model.Client;
import com.bysj.service.ClientService;
import com.bysj.service.LogtabService;
import com.bysj.util.CaseFind;
import com.bysj.util.ClientFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("findClient")
@Scope("prototype")
public class FindClientAction extends ActionSupport{
    private String name;
    private String lawyerID;
    private String caseID;
    private String loginDateEnd;
    private String loginDateStart;
    
    private ClientService clientService;
    private LogtabService logtabService;
	private Map session;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLawyerID() {
		return lawyerID;
	}
	public void setLawyerID(String lawyerID) {
		this.lawyerID = lawyerID;
	}
	public String getCaseID() {
		return caseID;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getLoginDateEnd() {
		return loginDateEnd;
	}
	public void setLoginDateEnd(String loginDateEnd) {
		this.loginDateEnd = loginDateEnd;
	}
	public String getLoginDateStart() {
		return loginDateStart;
	}
	public void setLoginDateStart(String loginDateStart) {
		this.loginDateStart = loginDateStart;
	}
	public ClientService getClientService() {
		return clientService;
	}
	@Resource
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
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
		
		ClientFind clientFind = new ClientFind();
        clientFind.setCaseID(caseID);
        clientFind.setLawyerID(lawyerID);
        clientFind.setLoginDateEnd(loginDateEnd);
        clientFind.setLoginDateStart(loginDateStart);
        clientFind.setName(name);
		
		session = ActionContext.getContext().getSession();
		session.put("clientFind",clientFind);		
		
		List<Client> list = clientService.find(clientFind);
			
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
		
		List<Client> result = new ArrayList<Client>();
		
		for(int i=(nowPage-1)*showNum;i<list.size()&&i<(nowPage-1)*showNum+showNum;i++){
			result.add(list.get(i));
		}
		ActionContext.getContext().put("clientFind", clientFind);
		ActionContext.getContext().put("resultlist", result);
		ActionContext.getContext().put("resultNum", resultNum);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("nowPage", nowPage);
		session.put("nowPage", nowPage);	
		addActionMessage("success");
		if(mark)
			logtabService.addLog(session.get("username").toString(), "查询了客户信息", "成功");
		else {
			logtabService.addLog(session.get("username").toString(), "查询了客户信息", "失败");
		}
		return "success";
	}

}
