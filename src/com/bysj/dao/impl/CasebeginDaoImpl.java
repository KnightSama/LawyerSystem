package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.CasebeginDao;
import com.bysj.model.Casebegin;
import com.bysj.model.Manager;
import com.bysj.util.CaseFind;

@Component("CasebeginDao")
public class CasebeginDaoImpl implements CasebeginDao {

	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean add(Casebegin casebegin) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(casebegin);
		return true;
	}

	
	@Override
	public List<Casebegin> find(CaseFind caseFind) {
		// TODO Auto-generated method stub
		int mark = 0;
		String sql = "from Casebegin where";
		if (!caseFind.getCaseID().equals("")) {
			if (mark == 0)
				sql += " caseID = '" + caseFind.getCaseID() + "'";
			else {
				sql += " AND caseID = '" + caseFind.getCaseID() + "'";
			}
			mark++;
		}
		if (!caseFind.getLawyerID().equals("")) {
			if (mark == 0)
				sql += " lawyerID = '" + caseFind.getLawyerID() + "'";
			else {
				sql += " AND lawyerID = '" + caseFind.getLawyerID() + "'";
			}
			mark++;
		}
		if (!caseFind.getIndicter().equals("")) {
			if (mark == 0)
				sql += " indicter = '" + caseFind.getIndicter() + "'";
			else {
				sql += " AND indicter = '" + caseFind.getIndicter() + "'";
			}
			mark++;
		}
		if (!caseFind.getIndictee().equals("")) {
			if (mark == 0)
				sql += " indictee = '" + caseFind.getIndictee() + "'";
			else {
				sql += " AND indictee = '" + caseFind.getIndictee() + "'";
			}
			mark++;
		}
		if (!caseFind.getCaseProperty().equals("")) {
			if (mark == 0)
				sql += " caseProperty = '" + caseFind.getCaseProperty() + "'";
			else {
				sql += " AND caseProperty = '" + caseFind.getCaseProperty() + "'";
			}
			mark++;
		}
		if (!caseFind.getSuitValue().equals("")) {
			if (mark == 0)
				sql += " suitValue = '" + caseFind.getSuitValue() + "'";
			else {
				sql += " AND suitValue = '" + caseFind.getSuitValue() + "'";
			}
			mark++;
		}
		if (!caseFind.getCaseStartTime1().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(caseStartTime) >= UNIX_TIMESTAMP('"+caseFind.getCaseStartTime1()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(caseStartTime) >= UNIX_TIMESTAMP('"+caseFind.getCaseStartTime1()+"')";
			}
			mark++;
		}
		if (!caseFind.getCaseStartTime2().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(caseStartTime) <= UNIX_TIMESTAMP('"+caseFind.getCaseStartTime2()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(caseStartTime) <= UNIX_TIMESTAMP('"+caseFind.getCaseStartTime2()+"')";
			}
			mark++;
		}
		if (!caseFind.getCaseHandleTime1().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(caseHandleTime) >= UNIX_TIMESTAMP('"+caseFind.getCaseHandleTime1()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(caseHandleTime) >= UNIX_TIMESTAMP('"+caseFind.getCaseHandleTime1()+"')";
			}
			mark++;
		}
		if (!caseFind.getCaseHandleTime2().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(caseHandleTime) <= UNIX_TIMESTAMP('"+caseFind.getCaseHandleTime2()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(caseHandleTime) <= UNIX_TIMESTAMP('"+caseFind.getCaseHandleTime2()+"')";
			}
			mark++;
		}
		if(mark==0)
			sql="from Casebegin";
		List<Casebegin> list = hibernateTemplate.find(sql);
		return list;
	}
	
	
	@Override
	public List<Casebegin> find(String CaseID) {
		// TODO Auto-generated method stub
		List<Casebegin> list = hibernateTemplate
				.find("from Casebegin c where c.caseID='" + CaseID + "'");
		return list;
	}



	@Override
	@Transactional
	public boolean delete(String CaseID) {
		// TODO Auto-generated method stub
		List<Casebegin> list = hibernateTemplate.find("from Casebegin c where c.caseID='" + CaseID + "'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Casebegin casebegin) {
		// TODO Auto-generated method stub
		List<Casebegin> list = hibernateTemplate.find("from Casebegin where caseID = '"+casebegin.getCaseID()+"'");
	    list.get(0).setBelongingsMaintain(casebegin.getBelongingsMaintain());
	    list.get(0).setCaseHandleTime(casebegin.getCaseHandleTime());
	    list.get(0).setCaseID(casebegin.getCaseID());
	    list.get(0).setCaseProperty(casebegin.getCaseProperty());
	    list.get(0).setCaseReason(casebegin.getCaseReason());
	    list.get(0).setCaseStartTime(casebegin.getCaseStartTime());
	    list.get(0).setEvidenceMaintain(casebegin.getEvidenceMaintain());
	    list.get(0).setIndictee(casebegin.getIndictee());
	    list.get(0).setIndicter(casebegin.getIndicter());
	    list.get(0).setLawyerID(casebegin.getLawyerID());
	    list.get(0).setSuitCost(casebegin.getSuitCost());
	    list.get(0).setSuitRequest(casebegin.getSuitRequest());
	    list.get(0).setSuitValue(casebegin.getSuitValue());
	    list.get(0).setThirdParty(casebegin.getThirdParty());
	    hibernateTemplate.merge(list.get(0));
		return true;
	}

}
