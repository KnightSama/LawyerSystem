package com.bysj.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.model.Caseends;
import com.bysj.model.Casefee;
import com.bysj.model.Caseprocessing;
import com.bysj.model.Client;
import com.bysj.model.Filelend;
import com.bysj.service.CasebeginService;
import com.bysj.service.ClientService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("editClient")
@Scope("prototype")
public class EditClientAction extends ActionSupport {

	private String clientID;
	private String loginDate;

	public String getClientID() {
		return clientID;
	}

	public void setClientID(String clientID) {
		this.clientID = clientID;
	}

	public String getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}

	private String name;
	private String caseID;
	private String lawyerID;
	private String address;
	private String phone;
	private String fax;
	private String zip;
	private String memo;

	private String buttonName;

	public String getButtonName() {
		return buttonName;
	}

	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}

	private ClientService clientService;
	private LogtabService logtabService;
	private Map session;

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

	public String getlawyerID() {
		return lawyerID;
	}

	public void setlawyerID(String lawyerID) {
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

	public String execute() {
		if (buttonName.equals("save")) {
			Client client = new Client();
			client.setClientID(Integer.parseInt(clientID));
			client.setAddress(address);
			client.setCaseID(caseID);
			client.setFax(fax);
			client.setLawyerID(lawyerID);
			client.setLoginDate(loginDate);
			client.setMemo(memo);
			client.setName(name);
			client.setPhone(phone);
			client.setZip(zip);

			if (!caseID.equals("")) {
				List<Casebegin> list = casebeginService.find(caseID);
				if (list.isEmpty()) {
					addActionMessage("nocase");
					ActionContext.getContext().put("client", client);
					return "nocase";
				}
			}
			clientService.update(client);
			session = ActionContext.getContext().getSession();
			logtabService.addLog(session.get("username").toString(),
					"修改了客户编号为[" + clientID + "]的信息", "成功");
			addActionMessage("editsuccess");
		} else {
			addActionMessage("editfail");
		}
		return "success";
	}

}
