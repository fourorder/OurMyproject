package org.great.log;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service("systemLogService")
public class SystemLogServiceImpl implements SystemLogService{ 
	
         @Resource
	     private SystemLogMapper systemLogMapper;
	      
	      @Override
	     public int deleteSystemLog(String id) {
	         
	         return systemLogMapper.deleteByPrimaryKey(id);
     }
	  
     @Override
	    public int insert(SystemLog record) {
        
	        return systemLogMapper.insertSelective(record);
	    }
	  
	     @Override
	     public SystemLog selectSystemLog(String id) {
	          
	          return systemLogMapper.selectByPrimaryKey(id);
	     }
	 
	      @Override
	      public int updateSystemLog(SystemLog record) {
	          
	        return systemLogMapper.updateByPrimaryKeySelective(record);
	    }
	 
	      @Override
	      public int insertTest(SystemLog record) {
	          
	         return systemLogMapper.insert(record);}
}