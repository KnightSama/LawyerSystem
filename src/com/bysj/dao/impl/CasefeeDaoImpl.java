package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.CasefeeDao;
import com.bysj.model.Casebegin;
import com.bysj.model.Casefee;
import com.bysj.model.Client;

@Component("CasefeeDao")
public class CasefeeDaoImpl implements CasefeeDao {

	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean add(Casefee casefee) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(casefee);
		return true;
	}

	@Override
	public List<Casefee> find(String CaseID) {
		// TODO Auto-generated method stub
		List<Casefee> list = hibernateTemplate
				.find("from Casefee c where c.caseID='" + CaseID + "'");
		return list;
	}

	@Override
	@Transactional
	public boolean delete(String CaseID) {
		// TODO Auto-generated method stub
		List<Casefee> list = hibernateTemplate.find("from Casefee c where c.caseID='" + CaseID + "'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Casefee casefee) {
		// TODO Auto-generated method stub
		List<Casefee> list = hibernateTemplate.find("from Casefee c where c.caseID='" + casefee.getCaseID() + "'");
		list.get(0).setCaseID(casefee.getCaseID());
		list.get(0).setCostRecieved(casefee.getCostRecieved());
		list.get(0).setCostRemain(casefee.getCostRemain());
		list.get(0).setLegalCost(casefee.getLegalCost());
		list.get(0).setMaintainCost(casefee.getMaintainCost());
		list.get(0).setShouldCost(casefee.getShouldCost());
		list.get(0).setTransactCost(casefee.getTransactCost());
		hibernateTemplate.merge(list.get(0));
		return true;
	}

	@Override
	public String findClient(String caseID) {
		// TODO Auto-generated method stub
		List<Client> list = hibernateTemplate.find("from Client where caseID='"+caseID+"'");
		if (list.isEmpty()) {
			return null;
		}else{
			return list.get(0).getName();
		}
	}

}
