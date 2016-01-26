package com.bysj.dao;

import java.util.List;

import com.bysj.model.Cansulation;

public interface CansulationDao {
	
	public void addCansulation(Cansulation cansulation);
    public List<Cansulation> find();
    public void delete(int uid);
}
