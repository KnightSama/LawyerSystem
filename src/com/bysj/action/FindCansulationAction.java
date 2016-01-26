package com.bysj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Cansulation;
import com.bysj.model.Orders;
import com.bysj.service.CansulationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("fingCansulation")
@Scope("prototype")
public class FindCansulationAction extends ActionSupport{
	private Map session;
	private CansulationService cansulationService;
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	public CansulationService getCansulationService() {
		return cansulationService;
	}
	@Resource
	public void setCansulationService(CansulationService cansulationService) {
		this.cansulationService = cansulationService;
	}
	
	public String execute(){
		int resultNum,showNum,pageNum,nowPage = 1;
		boolean mark = true;
		session = ActionContext.getContext().getSession();	
        List<Cansulation> list = cansulationService.find();
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
		List<Cansulation> result = new ArrayList<Cansulation>();
		for(int i=(nowPage-1)*showNum;i<list.size()&&i<(nowPage-1)*showNum+showNum;i++){
			result.add(list.get(i));
		}
		ActionContext.getContext().put("resultlist", result);
		ActionContext.getContext().put("resultNum", resultNum);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("nowPage", nowPage);
		session.put("nowPage", nowPage);	
		addActionMessage("success");
		return "success";
	}
}
