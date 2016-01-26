package com.bysj.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Cansulation;
import com.bysj.model.Orders;
import com.bysj.service.CansulationService;
import com.opensymphony.xwork2.ActionSupport;

@Component("AddCansulation")
@Scope("prototype")
public class AddCansulationAction extends ActionSupport{
	
	private int uid;
	private String name;
	private String title;
	private String phone;
	private String question;
    private String time;
    
    private CansulationService cansulationService;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public CansulationService getCansulationService() {
		return cansulationService;
	}
	@Resource
	public void setCansulationService(CansulationService cansulationService) {
		this.cansulationService = cansulationService;
	}
    
	
	public String execute() throws Exception {
		Cansulation cansulation = new Cansulation();
		cansulation.setName(name);
		cansulation.setPhone(phone);
		cansulation.setQuestion(question);
		cansulation.setTitle(title);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String operateTime =df.format(new Date());
		cansulation.setTime(operateTime);
		cansulationService.addCansulation(cansulation);
		return "success";
	}
    

}
