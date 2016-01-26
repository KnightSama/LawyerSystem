package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.CaseendsDao;
import com.bysj.model.Casebegin;
import com.bysj.model.Caseends;

@Component("CaseendsDao")
public class CaseendsDaoImpl implements CaseendsDao {

	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean add(Caseends caseends) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(caseends);
		return true;
	}

	@Override
	public List<Caseends> find(String CaseID) {
		// TODO Auto-generated method stub
		List<Caseends> list = hibernateTemplate
				.find("from Caseends c where c.caseID='" + CaseID + "'");
		return list;
	}

	@Override
	@Transactional
	public boolean delete(String CaseID) {
		// TODO Auto-generated method stub
		List<Caseends> list = hibernateTemplate.find("from Caseends c where c.caseID='" + CaseID + "'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Caseends caseends) {
		// TODO Auto-generated method stub
		List<Caseends> list = hibernateTemplate.find("from Caseends c where c.caseID='" + caseends.getCaseID() + "'");
		list.get(0).setAdjudgementTime(caseends.getAdjudgementTime());
		list.get(0).setAdjudicateCondition(caseends.getAdjudicateCondition());
		list.get(0).setAppeal(caseends.getAppeal());
		list.get(0).setCaseEndTime(caseends.getCaseEndTime());
		list.get(0).setCaseID(caseends.getCaseID());
		list.get(0).setChiefJusticeTime(caseends.getChiefJusticeTime());
		list.get(0).setDeanTime(caseends.getDeanTime());
		list.get(0).setDeliverTime(caseends.getDeliverTime());
		list.get(0).setEffectTime(caseends.getEffectTime());
		list.get(0).setExecuteApplication(caseends.getExecuteApplication());
		list.get(0).setJoinAdjusdgementTime(caseends.getJoinAdjusdgementTime());
		list.get(0).setJurorTime(caseends.getJurorTime());
		list.get(0).setKindOfEndACase(caseends.getKindOfEndACase());
		list.get(0).setPresidingJudgeTime(caseends.getPresidingJudgeTime());
		list.get(0).setReportTime(caseends.getReportTime());
		list.get(0).setAppealTime(caseends.getAppealTime());
		hibernateTemplate.merge(list.get(0));
		return true;
	}

}
