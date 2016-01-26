package com.bysj.action;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.bysj.model.Casebegin;
import com.bysj.model.Caseends;
import com.bysj.model.Casefee;
import com.bysj.model.Caseprocessing;
import com.bysj.model.Filelend;
import com.bysj.service.CasebeginService;
import com.bysj.service.CaseendsService;
import com.bysj.service.CasefeeService;
import com.bysj.service.CaseprocessingService;
import com.bysj.service.FilelendService;
import com.bysj.service.LogtabService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component("AddCase")
@Scope("prototype")
public class AddCaseAction extends ActionSupport {
	private String caseID;
	private String caseProperty;
	private String lawyerID;
	private String caseStartTime;
	private String caseHandleTime;
	private String caseReason;
	private String indicter;
	private String indictee;
	private String thirdParty;
	private String suitRequest;
	private String suitValue;
	private String suitCost;
	private String belongingsMaintain;
	private String evidenceMaintain;

	private String joinAdjusdgementTime;
	private String presidingJudgeTime;
	private String jurorTime;
	private String chiefJusticeTime;
	private String deanTime;
	private String adjudgementTime;
	private String effectTime;
	private String executeApplication;
	private String kindOfEndACase;
	private String caseEndTime;
	private String reportTime;
	private String adjudicateCondition;
	private String deliverTime;
	private String appeal;
	private String appealTime;

	private String legalCost;
	private String maintainCost;
	private String transactCost;
	private String shouldCost;
	private String costRecieved;
	private String costRemain;

	private String service;
	private String bullentinTime;
	private String sittingTime;
	private String singleInquisition;
	private String joinInquisition;
	private String adjournmentTime;
	private String adjPrecidingJudgeTime;
	private String adjDeanTime;
	private String adjIntermediateTime;
	private String fileTime;
	private String memo;

	private String lendTo;
	private String cManOfLend;
	private String lendFileTime;
	private String lendFileReason;
	private String backTime;
	private String appealMoveFileTime;
	private String appealBackFileTime;
	private String moveTo;
	private String moveReason;
	private String moveTime;
	private String moveMemo;

	private CasebeginService casebeginService;
	private CaseendsService caseendsService;
	private CasefeeService casefeeService;
	private CaseprocessingService caseprocessingService;
	private FilelendService filelendService;

	private LogtabService logtabService;
	private Map session;

	public String getAppealTime() {
		return appealTime;
	}

	public void setAppealTime(String appealTime) {
		this.appealTime = appealTime;
	}

	public String getAppeal() {
		return appeal;
	}

	public void setAppeal(String appeal) {
		this.appeal = appeal;
	}

	public String getCaseID() {
		return caseID;
	}

	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}

	public String getCaseProperty() {
		return caseProperty;
	}

	public void setCaseProperty(String caseProperty) {
		this.caseProperty = caseProperty;
	}

	public String getLawyerID() {
		return lawyerID;
	}

	public void setLawyerID(String lawyerID) {
		this.lawyerID = lawyerID;
	}

	public String getCaseStartTime() {
		return caseStartTime;
	}

	public void setCaseStartTime(String caseStartTime) {
		this.caseStartTime = caseStartTime;
	}

	public String getCaseHandleTime() {
		return caseHandleTime;
	}

	public void setCaseHandleTime(String caseHandleTime) {
		this.caseHandleTime = caseHandleTime;
	}

	public String getCaseReason() {
		return caseReason;
	}

	public void setCaseReason(String caseReason) {
		this.caseReason = caseReason;
	}

	public String getIndicter() {
		return indicter;
	}

	public void setIndicter(String indicter) {
		this.indicter = indicter;
	}

	public String getIndictee() {
		return indictee;
	}

	public void setIndictee(String indictee) {
		this.indictee = indictee;
	}

	public String getThirdParty() {
		return thirdParty;
	}

	public void setThirdParty(String thirdParty) {
		this.thirdParty = thirdParty;
	}

	public String getSuitRequest() {
		return suitRequest;
	}

	public void setSuitRequest(String suitRequest) {
		this.suitRequest = suitRequest;
	}

	public String getSuitValue() {
		return suitValue;
	}

	public void setSuitValue(String suitValue) {
		this.suitValue = suitValue;
	}

	public String getSuitCost() {
		return suitCost;
	}

	public void setSuitCost(String suitCost) {
		this.suitCost = suitCost;
	}

	public String getBelongingsMaintain() {
		return belongingsMaintain;
	}

	public void setBelongingsMaintain(String belongingsMaintain) {
		this.belongingsMaintain = belongingsMaintain;
	}

	public String getEvidenceMaintain() {
		return evidenceMaintain;
	}

	public void setEvidenceMaintain(String evidenceMaintain) {
		this.evidenceMaintain = evidenceMaintain;
	}

	public String getJoinAdjusdgementTime() {
		return joinAdjusdgementTime;
	}

	public void setJoinAdjusdgementTime(String joinAdjusdgementTime) {
		this.joinAdjusdgementTime = joinAdjusdgementTime;
	}

	public String getPresidingJudgeTime() {
		return presidingJudgeTime;
	}

	public void setPresidingJudgeTime(String presidingJudgeTime) {
		this.presidingJudgeTime = presidingJudgeTime;
	}

	public String getJurorTime() {
		return jurorTime;
	}

	public void setJurorTime(String jurorTime) {
		this.jurorTime = jurorTime;
	}

	public String getChiefJusticeTime() {
		return chiefJusticeTime;
	}

	public void setChiefJusticeTime(String chiefJusticeTime) {
		this.chiefJusticeTime = chiefJusticeTime;
	}

	public String getDeanTime() {
		return deanTime;
	}

	public void setDeanTime(String deanTime) {
		this.deanTime = deanTime;
	}

	public String getAdjudgementTime() {
		return adjudgementTime;
	}

	public void setAdjudgementTime(String adjudgementTime) {
		this.adjudgementTime = adjudgementTime;
	}

	public String getEffectTime() {
		return effectTime;
	}

	public void setEffectTime(String effectTime) {
		this.effectTime = effectTime;
	}

	public String getExecuteApplication() {
		return executeApplication;
	}

	public void setExecuteApplication(String executeApplication) {
		this.executeApplication = executeApplication;
	}

	public String getKindOfEndACase() {
		return kindOfEndACase;
	}

	public void setKindOfEndACase(String kindOfEndACase) {
		this.kindOfEndACase = kindOfEndACase;
	}

	public String getCaseEndTime() {
		return caseEndTime;
	}

	public void setCaseEndTime(String caseEndTime) {
		this.caseEndTime = caseEndTime;
	}

	public String getReportTime() {
		return reportTime;
	}

	public void setReportTime(String reportTime) {
		this.reportTime = reportTime;
	}

	public String getAdjudicateCondition() {
		return adjudicateCondition;
	}

	public void setAdjudicateCondition(String adjudicateCondition) {
		this.adjudicateCondition = adjudicateCondition;
	}

	public String getDeliverTime() {
		return deliverTime;
	}

	public void setDeliverTime(String deliverTime) {
		this.deliverTime = deliverTime;
	}

	public String getLegalCost() {
		return legalCost;
	}

	public void setLegalCost(String legalCost) {
		this.legalCost = legalCost;
	}

	public String getMaintainCost() {
		return maintainCost;
	}

	public void setMaintainCost(String maintainCost) {
		this.maintainCost = maintainCost;
	}

	public String getTransactCost() {
		return transactCost;
	}

	public void setTransactCost(String transactCost) {
		this.transactCost = transactCost;
	}

	public String getShouldCost() {
		return shouldCost;
	}

	public void setShouldCost(String shouldCost) {
		this.shouldCost = shouldCost;
	}

	public String getCostRecieved() {
		return costRecieved;
	}

	public void setCostRecieved(String costRecieved) {
		this.costRecieved = costRecieved;
	}

	public String getCostRemain() {
		return costRemain;
	}

	public void setCostRemain(String costRemain) {
		this.costRemain = costRemain;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getBullentinTime() {
		return bullentinTime;
	}

	public void setBullentinTime(String bullentinTime) {
		this.bullentinTime = bullentinTime;
	}

	public String getSittingTime() {
		return sittingTime;
	}

	public void setSittingTime(String sittingTime) {
		this.sittingTime = sittingTime;
	}

	public String getSingleInquisition() {
		return singleInquisition;
	}

	public void setSingleInquisition(String singleInquisition) {
		this.singleInquisition = singleInquisition;
	}

	public String getJoinInquisition() {
		return joinInquisition;
	}

	public void setJoinInquisition(String joinInquisition) {
		this.joinInquisition = joinInquisition;
	}

	public String getAdjournmentTime() {
		return adjournmentTime;
	}

	public void setAdjournmentTime(String adjournmentTime) {
		this.adjournmentTime = adjournmentTime;
	}

	public String getAdjPrecidingJudgeTime() {
		return adjPrecidingJudgeTime;
	}

	public void setAdjPrecidingJudgeTime(String adjPrecidingJudgeTime) {
		this.adjPrecidingJudgeTime = adjPrecidingJudgeTime;
	}

	public String getAdjDeanTime() {
		return adjDeanTime;
	}

	public void setAdjDeanTime(String adjDeanTime) {
		this.adjDeanTime = adjDeanTime;
	}

	public String getAdjIntermediateTime() {
		return adjIntermediateTime;
	}

	public void setAdjIntermediateTime(String adjIntermediateTime) {
		this.adjIntermediateTime = adjIntermediateTime;
	}

	public String getFileTime() {
		return fileTime;
	}

	public void setFileTime(String fileTime) {
		this.fileTime = fileTime;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getLendTo() {
		return lendTo;
	}

	public void setLendTo(String lendTo) {
		this.lendTo = lendTo;
	}

	public String getcManOfLend() {
		return cManOfLend;
	}

	public void setcManOfLend(String cManOfLend) {
		this.cManOfLend = cManOfLend;
	}

	public String getLendFileTime() {
		return lendFileTime;
	}

	public void setLendFileTime(String lendFileTime) {
		this.lendFileTime = lendFileTime;
	}

	public String getLendFileReason() {
		return lendFileReason;
	}

	public void setLendFileReason(String lendFileReason) {
		this.lendFileReason = lendFileReason;
	}

	public String getBackTime() {
		return backTime;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}

	public String getAppealMoveFileTime() {
		return appealMoveFileTime;
	}

	public void setAppealMoveFileTime(String appealMoveFileTime) {
		this.appealMoveFileTime = appealMoveFileTime;
	}

	public String getAppealBackFileTime() {
		return appealBackFileTime;
	}

	public void setAppealBackFileTime(String appealBackFileTime) {
		this.appealBackFileTime = appealBackFileTime;
	}

	public String getMoveTo() {
		return moveTo;
	}

	public void setMoveTo(String moveTo) {
		this.moveTo = moveTo;
	}

	public String getMoveReason() {
		return moveReason;
	}

	public void setMoveReason(String moveReason) {
		this.moveReason = moveReason;
	}

	public String getMoveTime() {
		return moveTime;
	}

	public void setMoveTime(String moveTime) {
		this.moveTime = moveTime;
	}

	public String getMoveMemo() {
		return moveMemo;
	}

	public void setMoveMemo(String moveMemo) {
		this.moveMemo = moveMemo;
	}

	public CasebeginService getCasebeginService() {
		return casebeginService;
	}

	@Resource
	public void setCasebeginService(CasebeginService casebeginService) {
		this.casebeginService = casebeginService;
	}

	public CaseendsService getCaseendsService() {
		return caseendsService;
	}

	@Resource
	public void setCaseendsService(CaseendsService caseendsService) {
		this.caseendsService = caseendsService;
	}

	public CasefeeService getCasefeeService() {
		return casefeeService;
	}

	@Resource
	public void setCasefeeService(CasefeeService casefeeService) {
		this.casefeeService = casefeeService;
	}

	public CaseprocessingService getCaseprocessingService() {
		return caseprocessingService;
	}

	@Resource
	public void setCaseprocessingService(
			CaseprocessingService caseprocessingService) {
		this.caseprocessingService = caseprocessingService;
	}

	public FilelendService getFilelendService() {
		return filelendService;
	}

	@Resource
	public void setFilelendService(FilelendService filelendService) {
		this.filelendService = filelendService;
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
		Casebegin casebegin = new Casebegin();
		Caseends caseends = new Caseends();
		Casefee casefee = new Casefee();
		Caseprocessing caseprocessing = new Caseprocessing();
		Filelend filelend = new Filelend();

		casebegin.setBelongingsMaintain(belongingsMaintain);
		if (caseHandleTime.equals(""))
			casebegin.setCaseHandleTime(null);
		else {
			casebegin.setCaseHandleTime(caseHandleTime);
		}

		casebegin.setCaseID(caseID);
		casebegin.setCaseProperty(caseProperty);
		casebegin.setCaseReason(caseReason);
		if (caseStartTime.equals(""))
			casebegin.setCaseStartTime(null);
		else {
			casebegin.setCaseStartTime(caseStartTime);
		}
		casebegin.setEvidenceMaintain(evidenceMaintain);
		casebegin.setIndictee(indictee);
		casebegin.setIndicter(indicter);
		casebegin.setLawyerID(lawyerID);
		casebegin.setSuitCost(suitCost);
		casebegin.setSuitRequest(suitRequest);
		casebegin.setSuitValue(suitValue);
		casebegin.setThirdParty(thirdParty);
		
		if (adjudgementTime.equals(""))
			caseends.setAdjudgementTime(null);
		else {
			caseends.setAdjudgementTime(adjudgementTime);
		}		
		caseends.setAdjudicateCondition(adjudicateCondition);
		if (caseEndTime.equals(""))
			caseends.setCaseEndTime(null);
		else {
			caseends.setCaseEndTime(caseEndTime);
		}		
		caseends.setCaseID(caseID);
		if (chiefJusticeTime.equals(""))
			caseends.setChiefJusticeTime(null);
		else {
			caseends.setChiefJusticeTime(chiefJusticeTime);
		}
		
		if (adjDeanTime.equals(""))
			caseends.setDeanTime(null);
		else {
			caseends.setDeanTime(adjDeanTime);
		}
		
		if (deliverTime.equals(""))
			caseends.setDeliverTime(null);
		else {
			caseends.setDeliverTime(deliverTime);
		}
		
		if (effectTime.equals(""))
			caseends.setEffectTime(null);
		else {
			caseends.setEffectTime(effectTime);
		}
		
		caseends.setExecuteApplication(executeApplication);
		if (joinAdjusdgementTime.equals(""))
			caseends.setJoinAdjusdgementTime(null);
		else {
			caseends.setJoinAdjusdgementTime(joinAdjusdgementTime);
		}
		
		if (jurorTime.equals(""))
			caseends.setJurorTime(null);
		else {
			caseends.setJurorTime(jurorTime);
		}
		
		caseends.setKindOfEndACase(kindOfEndACase);
		if (presidingJudgeTime.equals(""))
			caseends.setPresidingJudgeTime(null);
		else {
			caseends.setPresidingJudgeTime(presidingJudgeTime);
		}
		
		if (reportTime.equals(""))
			caseends.setReportTime(null);
		else {
			caseends.setReportTime(reportTime);
		}
		caseends.setAppeal(appeal);
		if (appealTime.equals(""))
			caseends.setAppealTime(null);
		else {
			caseends.setAppealTime(appealTime);
		}
		

		casefee.setCaseID(caseID);
		casefee.setCostRecieved(costRecieved);
		casefee.setCostRemain(costRemain);
		casefee.setLegalCost(legalCost);
		casefee.setMaintainCost(maintainCost);
		casefee.setShouldCost(shouldCost);
		casefee.setTransactCost(transactCost);
        
		if (adjDeanTime.equals(""))
			caseprocessing.setAdjDeanTime(null);
		else {
			caseprocessing.setAdjDeanTime(adjDeanTime);
		}
		
		if (adjIntermediateTime.equals(""))
			caseprocessing.setAdjIntermediateTime(null);
		else {
			caseprocessing.setAdjIntermediateTime(adjIntermediateTime);
		}
		
		if (adjournmentTime.equals(""))
			caseprocessing.setAdjournmentTime(null);
		else {
			caseprocessing.setAdjournmentTime(adjournmentTime);
		}
		
		if (adjPrecidingJudgeTime.equals(""))
			caseprocessing.setAdjPrecidingJudgeTime(null);
		else {
			caseprocessing.setAdjPrecidingJudgeTime(adjPrecidingJudgeTime);
		}
		
		if (bullentinTime.equals(""))
			caseprocessing.setBullentinTime(null);
		else {
			caseprocessing.setBullentinTime(bullentinTime);
		}
		
		caseprocessing.setCaseID(caseID);
		if (appealBackFileTime.equals(""))
			caseprocessing.setFileTime(null);
		else {
			caseprocessing.setFileTime(appealBackFileTime);
		}
		
		caseprocessing.setJoinInquisition(joinInquisition);
		caseprocessing.setMemo(memo);
		caseprocessing.setService(service);
		caseprocessing.setSingleInquisition(singleInquisition);
		if (sittingTime.equals(""))
			caseprocessing.setSittingTime(null);
		else {
			caseprocessing.setSittingTime(sittingTime);
		}
		

		if (appealBackFileTime.equals(""))
			filelend.setAppealBackFileTime(null);
		else {
			filelend.setAppealBackFileTime(appealBackFileTime);
		}
		if (appealMoveFileTime.equals(""))
			filelend.setAppealMoveFileTime(null);
		else {
			filelend.setAppealMoveFileTime(appealMoveFileTime);
		}
		if (backTime.equals(""))
			filelend.setBackTime(null);
		else {
			filelend.setBackTime(backTime);
		}
		filelend.setCaseID(caseID);
		filelend.setcManOfLend(cManOfLend);
		filelend.setLendFileReason(lendFileReason);
		if (lendFileTime.equals(""))
			filelend.setLendFileTime(null);
		else {
			filelend.setLendFileTime(lendFileTime);
		}
		
		filelend.setLendTo(lendTo);
		filelend.setMoveMemo(moveMemo);
		filelend.setMoveReason(moveReason);
		if (moveTime.equals(""))
			filelend.setMoveTime(null);
		else {
			filelend.setMoveTime(moveTime);
		}
		
		filelend.setMoveTo(moveTo);
		
		session = ActionContext.getContext().getSession();
		
		ActionContext.getContext().put("casebegin", casebegin);
		ActionContext.getContext().put("caseends", caseends);
		ActionContext.getContext().put("casefee", casefee);
		ActionContext.getContext().put("caseprocessing", caseprocessing);
		ActionContext.getContext().put("filelend", filelend);
		if (casebeginService.hasCase(caseID)) {
			logtabService.addLog(session.get("username").toString(),
					"添加了一个案件记录，CaseID为:" + caseID, "失败");
			addActionMessage("adderror");
			return "success";
		}

		
		casebeginService.add(casebegin);
		caseendsService.add(caseends);
		casefeeService.add(casefee);
		caseprocessingService.add(caseprocessing);
		filelendService.add(filelend);

		logtabService.addLog(session.get("username").toString(),
				"添加了一个案件记录，CaseID为:" + caseID, "成功");
		addActionMessage("addsuccess");

		return "success";
	}

}
