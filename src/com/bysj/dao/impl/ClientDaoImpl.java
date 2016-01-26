package com.bysj.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.bysj.dao.ClientDao;
import com.bysj.dao.FilelendDao;
import com.bysj.model.Casebegin;
import com.bysj.model.Client;
import com.bysj.model.Filelend;
import com.bysj.util.ClientFind;

@Component("ClientDao")
public class ClientDaoImpl implements ClientDao{
	
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean add(Client client) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(client);
		return true;
	}

	@Override
	public List<Client> find(ClientFind clientFind) {
		// TODO Auto-generated method stub
		int mark = 0;
		String sql = "from Client where";
		if (!clientFind.getCaseID().equals("")) {
			if (mark == 0)
				sql += " caseID = '" + clientFind.getCaseID() + "'";
			else {
				sql += " AND caseID = '" + clientFind.getCaseID() + "'";
			}
			mark++;
		}
		if (!clientFind.getLawyerID().equals("")) {
			if (mark == 0)
				sql += " lawyerID = '" + clientFind.getLawyerID() + "'";
			else {
				sql += " AND lawyerID = '" + clientFind.getLawyerID() + "'";
			}
			mark++;
		}
		if (!clientFind.getName().equals("")) {
			if (mark == 0)
				sql += " name = '" + clientFind.getName() + "'";
			else {
				sql += " AND name = '" + clientFind.getName() + "'";
			}
			mark++;
		}
		if (!clientFind.getLoginDateStart().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(loginDate) >= UNIX_TIMESTAMP('"+clientFind.getLoginDateStart()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(loginDate) >= UNIX_TIMESTAMP('"+clientFind.getLoginDateStart()+"')";
			}
			mark++;
		}
		if (!clientFind.getLoginDateEnd().equals("")) {
			if(mark==0)
				sql+=" UNIX_TIMESTAMP(loginDate) <= UNIX_TIMESTAMP('"+clientFind.getLoginDateEnd()+"')";
			else {
				sql+=" AND UNIX_TIMESTAMP(loginDate) <= UNIX_TIMESTAMP('"+clientFind.getLoginDateEnd()+"')";
			}
			mark++;
		}
		if(mark==0)
			sql="from Client";
		List<Client> list = hibernateTemplate.find(sql);
		return list;
	}

	@Override
	@Transactional
	public boolean delete(int clientID) {
		// TODO Auto-generated method stub
		List<Client> list = hibernateTemplate.find("from Client where clientID = '"+clientID+"'");
		hibernateTemplate.delete(list.get(0));
		return true;
	}

	@Override
	@Transactional
	public boolean update(Client client) {
		// TODO Auto-generated method stub
		List<Client> list = hibernateTemplate.find("from Client where clientID = '"+client.getClientID()+"'");
		list.get(0).setAddress(client.getAddress());
		list.get(0).setCaseID(client.getCaseID());
		list.get(0).setClientID(client.getClientID());
		list.get(0).setFax(client.getFax());
		list.get(0).setLawyerID(client.getLawyerID());
		list.get(0).setLoginDate(client.getLoginDate());
		list.get(0).setMemo(client.getMemo());
		list.get(0).setName(client.getName());
		list.get(0).setPhone(client.getPhone());
		list.get(0).setZip(client.getZip());
		hibernateTemplate.merge(list.get(0));
		return true;
	}

	@Override
	public List<Client> find(int clientID) {
		// TODO Auto-generated method stub
		List<Client> list = hibernateTemplate.find("from Client where clientID = '"+clientID+"'");
		return list;
	}

	@Override
	public int lawyerNum(String lawyerID) {
		// TODO Auto-generated method stub
		List<Client> list = hibernateTemplate.find("from Client where lawyerID = '"+lawyerID+"'");
		return list.size();
	}


}
