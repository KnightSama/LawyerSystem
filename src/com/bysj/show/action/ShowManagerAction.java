package com.bysj.show.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Logtab;
import com.bysj.model.Manager;
import com.bysj.service.LogtabService;
import com.bysj.service.ManagerService;
import com.bysj.util.LogFind;
import com.bysj.util.ManagerFind;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("showManager")
@Scope("prototype")
public class ShowManagerAction extends ActionSupport {
	private String buttonName;
	private String topage;
	private String showMany;
	private Map session;
	private ManagerService managerService;

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

	public ManagerService getManagerService() {
		return managerService;
	}

	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public String execute() {
		int resultNum, showNum, pageNum, nowPage = 0;
		session = ActionContext.getContext().getSession();
		ManagerFind managerFind = (ManagerFind) session.get("managerfind");
		List<Manager> list = managerService.find(managerFind);
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

		List<Manager> result = new ArrayList<Manager>();
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
