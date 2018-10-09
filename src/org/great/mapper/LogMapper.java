package org.great.mapper;

import org.great.bean.LogBean;
import org.springframework.stereotype.Repository;
@Repository
public interface LogMapper {

	
	public void setLog(LogBean logBean);
}
