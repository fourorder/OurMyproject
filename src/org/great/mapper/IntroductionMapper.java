package org.great.mapper;


import org.great.bean.IntroductionBean;
import org.springframework.stereotype.Repository;
@Repository
public interface IntroductionMapper {
public IntroductionBean getIntroduction();
}
