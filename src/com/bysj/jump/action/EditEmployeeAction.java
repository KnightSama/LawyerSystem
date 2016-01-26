package com.bysj.jump.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Client;
import com.bysj.model.Employee;
import com.bysj.service.EmployeeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("editEmployeejump")
@Scope("prototype")
public class EditEmployeeAction extends ActionSupport {
	private String buttonName;
	private Map session;
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
		return "success";
	}

}
