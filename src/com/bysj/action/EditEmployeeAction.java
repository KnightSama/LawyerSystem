package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Employee;
import com.bysj.service.EmployeeService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("editEmployee")
@Scope("prototype")
public class EditEmployeeAction extends ActionSupport{
	
	private String lawyerID;
	
	private String name;
	private String cardID;
	private String sex;
	private String birthArea;
	private String nation;
	private String education;
	private String graduateTime;
	private String graduate;
	private String workTime;
	private String inTime;
	private String typeWork;
	private String contractTime;
	private String work;
	private String marrage;
	private String health;
	private String baseSalary;
	private String workSalary;
	private String allowance;
	private String workTel;
	private String creditLevel;
	private String homeAddress;
	private String homeTel;
	private String mobile;
	private String memo;
	private String buttonName;
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}

	private EmployeeService employeeService;
	private LogtabService logtabService;
	private Map session;
	public String getLawyerID() {
		return lawyerID;
	}
	public void setLawyerID(String lawyerID) {
		this.lawyerID = lawyerID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCardID() {
		return cardID;
	}
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthArea() {
		return birthArea;
	}
	public void setBirthArea(String birthArea) {
		this.birthArea = birthArea;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getGraduateTime() {
		return graduateTime;
	}
	public void setGraduateTime(String graduateTime) {
		this.graduateTime = graduateTime;
	}
	public String getGraduate() {
		return graduate;
	}
	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getTypeWork() {
		return typeWork;
	}
	public void setTypeWork(String typeWork) {
		this.typeWork = typeWork;
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
	public String getMarrage() {
		return marrage;
	}
	public void setMarrage(String marrage) {
		this.marrage = marrage;
	}
	public String getHealth() {
		return health;
	}
	public void setHealth(String health) {
		this.health = health;
	}
	public String getBaseSalary() {
		return baseSalary;
	}
	public void setBaseSalary(String baseSalary) {
		this.baseSalary = baseSalary;
	}
	public String getWorkSalary() {
		return workSalary;
	}
	public void setWorkSalary(String workSalary) {
		this.workSalary = workSalary;
	}
	public String getAllowance() {
		return allowance;
	}
	public void setAllowance(String allowance) {
		this.allowance = allowance;
	}
	public String getWorkTel() {
		return workTel;
	}
	public void setWorkTel(String workTel) {
		this.workTel = workTel;
	}
	public String getCreditLevel() {
		return creditLevel;
	}
	public void setCreditLevel(String creditLevel) {
		this.creditLevel = creditLevel;
	}
	public String getHomeAddress() {
		return homeAddress;
	}
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	public String getHomeTel() {
		return homeTel;
	}
	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
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
	
	public String execute() throws Exception{
		if (buttonName.equals("save")) {
		Employee employee = new Employee();
		employee.setLawyerID(Integer.parseInt(lawyerID));
		employee.setAllowance(allowance);
		employee.setBaseSalary(baseSalary);
		employee.setBirthArea(birthArea);
		employee.setCardID(cardID);
		if(contractTime.equals("")){
			employee.setContractTime(null);
		}else{
		employee.setContractTime(contractTime);
		}		
		employee.setCreditLevel(creditLevel);
		employee.setEducation(education);
		employee.setGraduate(graduate);
		if(graduateTime.equals("")){
			employee.setGraduateTime(null);
		}else{
		employee.setGraduateTime(graduateTime);
		}
		employee.setHealth(health);
		employee.setHomeAddress(homeAddress);
		employee.setHomeTel(homeTel);
		if(inTime.equals("")){
			employee.setInTime(null);
		}else{
		employee.setInTime(inTime);
		}
		employee.setMarrage(marrage);
		employee.setMemo(memo);
		employee.setMobile(mobile);
		employee.setName(name);
		employee.setNation(nation);
		employee.setSex(sex);
		employee.setTypeWork(typeWork);
		employee.setWork(work);
		employee.setWorkSalary(workSalary);
		employee.setWorkTel(workTel);
		if(workTime.equals("")){
			employee.setWorkTime(null);
		}else{
		employee.setWorkTime(workTime);
		}
		
		employeeService.update(employee);
		session = ActionContext.getContext().getSession();
		logtabService.addLog(session.get("username").toString(),
				"修改了律师编号为[" + lawyerID + "]的信息", "成功");
		addActionMessage("editsuccess");
		}else {
			addActionMessage("editfail");
		}
		return "success";
	}

}
