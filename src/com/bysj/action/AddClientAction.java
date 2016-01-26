package com.bysj.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.model.Client;
import com.bysj.model.Employee;
import com.bysj.service.CasebeginService;
import com.bysj.service.ClientService;
import com.bysj.service.EmployeeService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("AddClient")
@Scope("prototype")
public class AddClientAction extends ActionSupport {

	private String name;
	private String caseID;
	private String lawyerID;
	private String address;
	private String phone;
	private String fax;
	private String zip;
	private String memo;

	private ClientService clientService;
	private LogtabService logtabService;
	private EmployeeService employeeService;
	private Map session;

	public EmployeeService getEmployeeService() {
		return employeeService;
	}
    @Resource
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	private CasebeginService casebeginService;

	public CasebeginService getCasebeginService() {
		return casebeginService;
	}

	@Resource
	public void setCasebeginService(CasebeginService casebeginService) {
		this.casebeginService = casebeginService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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

	public String execute() throws Exception {

		Client client = new Client();
		client.setAddress(address);
		client.setCaseID(caseID);
		client.setFax(fax);
		client.setLawyerID(lawyerID);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String createdata = df.format(new Date());
		client.setLoginDate(createdata);
		client.setMemo(memo);
		client.setName(name);
		client.setPhone(phone);
		client.setZip(zip);
		if (!caseID.equals("")) {
			List<Casebegin> list = casebeginService.find(caseID);
			if (list.isEmpty()) {
				addActionMessage("nocase");
				return "success";
			}
		}
		if(!lawyerID.equals("")){
			List<Employee> list = employeeService.find(Integer.parseInt(lawyerID));
			if (list.isEmpty()) {
				addActionMessage("nolawyer");
				return "success";
			}
		}
		clientService.add(client);
		session = ActionContext.getContext().getSession();
		logtabService.addLog(session.get("username").toString(),
				"添加了一个客户信息，用户名为:" + name, "成功");
		addActionMessage("addsuccess");	
		ActionContext.getContext().put("client", client);
		return "success";
	}

}
