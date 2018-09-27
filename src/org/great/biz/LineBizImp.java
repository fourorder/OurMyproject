package org.great.biz;

import java.util.List;

import javax.annotation.Resource;

import org.great.bean.LineBean;
import org.great.mapper.LineMapper;
import org.springframework.stereotype.Service;

@Service
public class LineBizImp implements LineBiz{
@Resource
private LineMapper lineMapper;
public List<LineBean> getLine() {
	return lineMapper.getLine();
}

}
