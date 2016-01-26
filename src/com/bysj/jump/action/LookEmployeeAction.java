package com.bysj.jump.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Client;
import com.bysj.model.Employee;
import com.bysj.service.EmployeeService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("LookEmployeejump")
@Scope("prototype")
public class LookEmployeeAction extends ActionSupport{
	
	private String buttonName;
	private Map session;
	private String topage;
	private String showMany;
	private LogtabService logtabService;
	private EmployeeService employeeService;
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
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public String execute(){
		employeeService.updateNum(buttonName);
		List<Employee> list = employeeService.find(Integer.parseInt(buttonName));
		ActionContext.getContext().put("employee", list.get(0));
		ActionContext.getContext().put("topage", topage);
		ActionContext.getContext().put("showMany", showMany);
		session = ActionContext.getContext().getSession();
		logtabService.addLog(session.get("username").toString(), "查看了律师编号为["+buttonName+"]的信息", "成功");
		return "success";
	}

}
