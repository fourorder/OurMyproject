package org.great.mapper;

import org.great.bean.InformationBean;
import org.springframework.stereotype.Repository;

@Repository
public interface InformationMapper {
	public int setInformation(InformationBean ib);
}
