package com.bysj.service;

import java.util.List;

import com.bysj.model.Logtab;
import com.bysj.util.LogFind;

public interface LogtabService {

	public boolean addLog(String username ,String operate,String others);
	public List<Logtab> find(LogFind logFind);
	public void delete(int id);
}
