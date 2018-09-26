package org.great.biz;

import javax.annotation.Resource;


import org.great.bean.IntroductionBean;

import org.great.mapper.IntroductionMapper;
import org.springframework.stereotype.Service;
@Service
public class IntroductionBizImp implements IntroductionBiz{
@Resource IntroductionMapper introductionMapper;
	@Override
	public IntroductionBean showRule() {
		// TODO Auto-generated method stub
		return introductionMapper.getIntroduction();
	}

	
	
}
