package org.great.mapper;

import java.util.List;

import org.great.bean.LineBean;
import org.springframework.stereotype.Repository;
@Repository
public interface LineMapper {
public List<LineBean> getLine();
}
