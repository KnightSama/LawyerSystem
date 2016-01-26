package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.FilelendDao;
import com.bysj.model.Casebegin;
import com.bysj.model.Filelend;

@Component("FilelendDao")
public class FilelendDaoImpl implements FilelendDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean add(Filelend filelend) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(filelend);
		return true;
	}

	@Override
	public List<Filelend> find(String CaseID) {
		// TODO Auto-generated method stub
		List<Filelend> list = hibernateTemplate
				.find("from Filelend c where c.caseID='" + CaseID + "'");
		return list;
	}

	@Override
	@Transactional
	public boolean delete(String CaseID) {
		// TODO Auto-generated method stub
		List<Filelend> list = hibernateTemplate.find("from Filelend c where c.caseID='" + CaseID + "'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Filelend filelend) {
		// TODO Auto-generated method stub
		List<Filelend> list = hibernateTemplate
				.find("from Filelend c where c.caseID='" + filelend.getCaseID() + "'");
		list.get(0).setAppealBackFileTime(filelend.getAppealBackFileTime());
		list.get(0).setAppealMoveFileTime(filelend.getAppealMoveFileTime());
		list.get(0).setBackTime(filelend.getBackTime());
		list.get(0).setCaseID(filelend.getCaseID());
		list.get(0).setcManOfLend(filelend.getcManOfLend());
		list.get(0).setLendFileReason(filelend.getLendFileReason());
		list.get(0).setLendFileTime(filelend.getLendFileTime());
		list.get(0).setLendTo(filelend.getLendTo());
		list.get(0).setMoveMemo(filelend.getMoveMemo());
		list.get(0).setMoveReason(filelend.getMoveReason());
		list.get(0).setMoveTime(filelend.getMoveTime());
		list.get(0).setMoveTo(filelend.getMoveTo());
		hibernateTemplate.merge(list.get(0));
		return true;
	}

}
