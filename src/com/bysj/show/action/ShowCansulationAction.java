package com.bysj.show.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Cansulation;
import com.bysj.model.Logtab;
import com.bysj.service.CansulationService;
import com.bysj.util.LogFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("Cansulation")
@Scope("prototype")
public class ShowCansulationAction extends ActionSupport{
	private String buttonName;
	private String topage;
	private String showMany;
	private Map session;
	private CansulationService cansulationService;
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
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
	public String execute() {
		int resultNum, showNum, pageNum, nowPage = 0;
		session = ActionContext.getContext().getSession();
		List<Cansulation> list = cansulationService.find();
		if (list.isEmpty())
			addActionMessage("fail");
		resultNum = list.size();
		if (showMany.equals("")) {
			showNum = (Integer) session.get("showNum");
		} else {
			if (Integer.parseInt(showMany) <= 1)
				showNum = 1;
			else {
				showNum = Integer.parseInt(showMany);
			}
			session.put("showNum", showNum);
		}
		if (resultNum % showNum == 0)
			pageNum = resultNum / showNum;
		else {
			pageNum = (resultNum - (resultNum % showNum)) / showNum + 1;
		}
		nowPage = (Integer) session.get("nowPage");
		if (buttonName.equals("firstpage")) {
			nowPage = 1;
		}
		if (buttonName.equals("prepage")) {
			if (nowPage == 1)
				nowPage = 1;
			else if (nowPage - 1 > pageNum) {
				nowPage = pageNum;
			} else {
				nowPage--;
			}
		}
		if (buttonName.equals("nextpage")) {
			if (nowPage >= pageNum) {
				nowPage = pageNum;
			} else {
				nowPage++;
			}
		}
		if (buttonName.equals("lastpage")) {
			nowPage = pageNum;
		}
		if (buttonName.equals("jump")) {
			if (!topage.equals("")) {
				if (Integer.parseInt(topage) > pageNum)
					nowPage = pageNum;
				else if (Integer.parseInt(topage) < 1)
					nowPage = 1;
				else {
					nowPage = Integer.parseInt(topage);
				}
			}
		}

		List<Cansulation> result = new ArrayList<Cansulation>();
		for (int i = (nowPage - 1) * showNum; i < list.size()
				&& i < (nowPage - 1) * showNum + showNum; i++) {
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
