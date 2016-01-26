package com.bysj.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("PlayVideo")
@Scope("prototype")
public class PlayVideoAction {
	
	private String address ;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String execute() throws Exception{
		return "success";
	}

}
