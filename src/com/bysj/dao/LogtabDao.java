package com.bysj.dao;

import java.util.List;

import com.bysj.model.Logtab;
import com.bysj.util.LogFind;

public interface LogtabDao {
    public boolean addLog(Logtab logtab);
    public List<Logtab> find(LogFind logFind);
    public void delete(int id);
}
