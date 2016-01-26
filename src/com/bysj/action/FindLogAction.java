package com.bysj.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Logtab;
import com.bysj.service.LogtabService;
import com.bysj.util.LogFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.CompoundRoot;
import com.opensymphony.xwork2.util.ValueStack;

@Component("fingLog")
@Scope("prototype")
public class FindLogAction extends ActionSupport{
    private String username;
    private String startTime;
    private String endTime;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	private Map session;
	private LogtabService logtabService;

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	public LogtabService getLogtabService() {
		return logtabService;
	}
    @Resource
	public void setLogtabService(LogtabService logtabService) {
		this.logtabService = logtabService;
	}

	public String execute(){
		int resultNum,showNum,pageNum,nowPage = 1;
		boolean mark = true;
		LogFind logFind= new LogFind();
		logFind.setUsername(username);
		logFind.setEndTime(endTime);
		logFind.setStartTime(startTime);
		session = ActionContext.getContext().getSession();
		session.put("logfind",logFind);		
		List<Logtab> list = logtabService.find(logFind);
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
		List<Logtab> result = new ArrayList<Logtab>();
		for(int i=(nowPage-1)*showNum;i<list.size()&&i<(nowPage-1)*showNum+showNum;i++){
			result.add(list.get(i));
		}
		ActionContext.getContext().put("resultlist", result);
		ActionContext.getContext().put("resultNum", resultNum);
		ActionContext.getContext().put("pageNum", pageNum);
		ActionContext.getContext().put("nowPage", nowPage);
		session.put("nowPage", nowPage);	
		addActionMessage("success");
		if(mark)
			logtabService.addLog(session.get("username").toString(), "查看了日志记录", "成功");
		else {
			logtabService.addLog(session.get("username").toString(), "查看了日志记录", "失败");
		}
		return "success";
	}
}
