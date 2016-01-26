package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.CaseprocessingDao;
import com.bysj.model.Casebegin;
import com.bysj.model.Caseprocessing;

@Component("CaseprocessingDao")
public class CaseprocessingDaoImpl implements CaseprocessingDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean add(Caseprocessing caseprocessing) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(caseprocessing);
		return true;
	}

	@Override
	public List<Caseprocessing> find(String CaseID) {
		// TODO Auto-generated method stub
		List<Caseprocessing> list = hibernateTemplate
				.find("from Caseprocessing c where c.caseID='" + CaseID + "'");
		return list;
	}

	@Override
	@Transactional
	public boolean delete(String CaseID) {
		// TODO Auto-generated method stub
		List<Caseprocessing> list = hibernateTemplate.find("from Caseprocessing c where c.caseID='" + CaseID + "'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Caseprocessing caseprocessing) {
		// TODO Auto-generated method stub
		List<Caseprocessing> list = hibernateTemplate.find("from Caseprocessing c where c.caseID='" + caseprocessing.getCaseID() + "'");
		list.get(0).setAdjDeanTime(caseprocessing.getAdjDeanTime());
		list.get(0).setAdjIntermediateTime(caseprocessing.getAdjIntermediateTime());
		list.get(0).setAdjournmentTime(caseprocessing.getAdjournmentTime());
		list.get(0).setAdjPrecidingJudgeTime(caseprocessing.getAdjPrecidingJudgeTime());
		list.get(0).setBullentinTime(caseprocessing.getBullentinTime());
		list.get(0).setCaseID(caseprocessing.getCaseID());
		list.get(0).setFileTime(caseprocessing.getFileTime());
		list.get(0).setJoinInquisition(caseprocessing.getJoinInquisition());
		list.get(0).setMemo(caseprocessing.getMemo());
		list.get(0).setService(caseprocessing.getService());
		list.get(0).setSingleInquisition(caseprocessing.getSingleInquisition());
		list.get(0).setSittingTime(caseprocessing.getSittingTime());
		hibernateTemplate.merge(list.get(0));
		return true;
	}

}
