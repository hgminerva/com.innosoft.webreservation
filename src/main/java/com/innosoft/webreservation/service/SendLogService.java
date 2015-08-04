package com.innosoft.webreservation.service;

import java.util.List;
import com.innosoft.webreservation.entity.TrnSendLog;


public interface SendLogService {
	public List<TrnSendLog> listSendLog();
	public TrnSendLog addSendLog(TrnSendLog sendLog);
	public TrnSendLog editSendLog(TrnSendLog sendLog);
	public boolean deleteSendLog(int id);
}