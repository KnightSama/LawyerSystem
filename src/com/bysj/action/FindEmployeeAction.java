package com.bysj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Client;
import com.bysj.model.Employee;
import com.bysj.service.EmployeeService;
import com.bysj.service.LogtabService;
import com.bysj.util.ClientFind;
import com.bysj.util.EmployeeFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("findEmployee")
@Scope("prototype")
public class FindEmployeeAction extends ActionSupport{
	private String name;
	private String workTime1;
	private String workTime2;
	private String inTime1;
	private String inTime2;
	private String contractTime;
	private String work;
	private String typeWork;
	
	private EmployeeService employeeService;
	private LogtabService logtabService;
	private Map session;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWorkTime1() {
		return workTime1;
	}
	public void setWorkTime1(String workTime1) {
		this.workTime1 = workTime1;
	}
	public String getWorkTime2() {
		return workTime2;
	}
	public void setWorkTime2(String workTime2) {
		this.workTime2 = workTime2;
	}
	public String getInTime1() {
		return inTime1;
	}
	public void setInTime1(String inTime1) {
		this.inTime1 = inTime1;
	}
	public String getInTime2() {
		return inTime2;
	}
	public void setInTime2(String inTime2) {
		this.inTime2 = inTime2;
	}
	public String getContractTime() {
		return contractTime;
	}
	public void setContractTime(String contractTime) {
		this.contractTime = contractTime;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getTypeWork() {
		return typeWork;
	}
	public void setTypeWork(String typeWork) {
		this.typeWork = typeWork;
	}
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
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
		
		EmployeeFind employeeFind = new EmployeeFind();
		employeeFind.setContractTime(contractTime);
		employeeFind.setInTime1(inTime1);
		employeeFind.setInTime2(inTime2);
		employeeFind.setName(name);
		employeeFind.setTypeWork(typeWork);
		employeeFind.setWork(typeWork);
		employeeFind.setWorkTime1(workTime1);
		employeeFind.setWorkTime2(workTime2);
		
		session = ActionContext.getContext().getSession();
		session.put("employeeFind",employeeFind);		
		
		List<Employee> list = employeeService.find(employeeFind);
			
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
		
		List<Employee> result = new ArrayList<Employee>();
		
		for(int i=(nowPage-1)*showNum;i<list.size()&&i<(nowPage-1)*showNum+showNum;i++){
			result.add(list.get(i));
		}
		ActionContext.getContext().put("employeeFind", employeeFind);
		ActionContext.getContext().put("resultlist", result);
		ActionContext.getContext().put("resultNum", resultNum);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("nowPage", nowPage);
		session.put("nowPage", nowPage);	
		addActionMessage("success");
		if(mark)
			logtabService.addLog(session.get("username").toString(), "查询了律师信息", "成功");
		else {
			logtabService.addLog(session.get("username").toString(), "查询了律师信息", "失败");
		}
		return "success";
	}
}
