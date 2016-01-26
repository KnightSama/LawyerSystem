package com.bysj.dao;

import java.util.List;

import com.bysj.model.Filelend;

public interface FilelendDao {
	public boolean add(Filelend filelend);
	public List<Filelend> find(String CaseID);
	public boolean delete(String CaseID);
	public boolean update(Filelend filelend);
}
