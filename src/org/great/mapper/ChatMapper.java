package org.great.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.great.bean.ChatBean;
import org.great.bean.UserBean;
import org.springframework.stereotype.Repository;

@Repository
public interface ChatMapper {
public void addChatRecord(ChatBean chatBean);
public UserBean getUserId(@Param("useraccount")String account);
public List<ChatBean> getChat(@Param("receiveflag")int receiveflag,@Param("touserid")int touserid,
		@Param("userid")int userid);
public void updateFlag(@Param("chatid")int chatid);
public List<UserBean> getMsgInfo(@Param("end")int end,@Param("start")int start,@Param("touserid")int touserid);
public List<UserBean> getAllMsg(@Param("touserid")int touserid);
public List<ChatBean> chatNum(@Param("receiveflag")int receiveflag,@Param("touserid")int touserid);
public int getCount(@Param("userid")int userid,@Param("touserid")int touserid);
}
