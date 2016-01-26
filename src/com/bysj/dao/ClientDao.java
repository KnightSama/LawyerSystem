package com.bysj.dao;

import java.util.List;

import com.bysj.model.Client;
import com.bysj.util.ClientFind;



public interface ClientDao {
	public boolean add(Client client);
	public List<Client> find(ClientFind clientFind);
	public List<Client> find(int clientID);
	public boolean delete(int clientID);
	public boolean update(Client client);
    public int lawyerNum(String lawyerID);
}
