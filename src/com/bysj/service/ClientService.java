package com.bysj.service;

import java.util.List;

import com.bysj.model.Client;
import com.bysj.util.ClientFind;

public interface ClientService {
	public void add(Client client);
	public List<Client> find(ClientFind clientFind);
	public List<Client> find(int clientID);
	public void delete(int clientID);
    public void update(Client client);
}
