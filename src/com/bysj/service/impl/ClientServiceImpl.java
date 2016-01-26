package com.bysj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bysj.dao.ClientDao;
import com.bysj.model.Client;
import com.bysj.service.ClientService;
import com.bysj.util.ClientFind;

@Component("ClientService")
public class ClientServiceImpl implements ClientService{
	
	private ClientDao clientDao;
	

	public ClientDao getClientDao() {
		return clientDao;
	}

    @Resource
	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}


	@Override
	public void add(Client client) {
		// TODO Auto-generated method stub
		clientDao.add(client);
	}

	@Override
	public List<Client> find(ClientFind clientFind) {
		// TODO Auto-generated method stub
		List<Client> list = clientDao.find(clientFind);
		return list;
	}

	@Override
	public void delete(int clientID) {
		// TODO Auto-generated method stub
		clientDao.delete(clientID);
	}

	@Override
	public void update(Client client) {
		// TODO Auto-generated method stub
		clientDao.update(client);
	}

	@Override
	public List<Client> find(int clientID) {
		// TODO Auto-generated method stub
		return clientDao.find(clientID);
	}

}
