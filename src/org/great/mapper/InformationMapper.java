package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.InformationBean;
import org.springframework.stereotype.Repository;

@Repository
public interface InformationMapper {
	public List<InformationBean> getInformation(@Param("parameterid")int parameterid);
	public List<InformationBean> getInforList(@Param("parameterid")int parameterid,@Param("end")int end,@Param("start")int start);
	public List<String> informationType(); //查询咨询类型
	public int selectPid(@Param("paramenter")String paramenter);//查询类型id
	public int setInformation(InformationBean ib);//插入资讯
	public int countInfor(@Param("state")int state);//查询总条数
	public List<InformationBean> conditionQuery(@Param("state")int state,@Param("page")int page);//条件查找
	public int delInfor(@Param("inforId")int inforId);//删除资讯
	public int updateInfor(InformationBean ib);//修改
	public List<InformationBean> selectOne(@Param("inforId")int inforId);//查询修改资讯

}
