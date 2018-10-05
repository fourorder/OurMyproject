package org.great.biz;

import java.util.List;
import java.util.ArrayList;
import javax.annotation.Resource;

import org.great.bean.InformationBean;
import org.great.mapper.InformationMapper;
import org.springframework.stereotype.Service;

@Service
public class InformationBizImp implements InformationBiz{

	
	@Resource
	private InformationMapper informationMapper;
	
	
	@Override
	public int setInformation(InformationBean ib) {
		// TODO Auto-generated method stub
		System.out.println("Biz实现类");
		return informationMapper.setInformation(ib);
	}

	public List<InformationBean> getInformation(int parameterId){
		return informationMapper.getInformation(parameterId);
	}
	public List<InformationBean> getInforList(int parameterid,int end,int start){
		return informationMapper.getInforList(parameterid, end, start);
	}
	public List<Object> selectInfo(String page,String state,String parameterid){
		List<Object> list=new ArrayList<Object>();	
		int page1=Integer.parseInt(page);
		int count1=informationMapper.getInformation(Integer.parseInt(parameterid)).size();	
		int countpage1=(int) Math.ceil(((float)count1)/5);
	/*	String countpage=countpage1+"";*/
		if(state==null){
			state="";
		}
		if(state.equals("next")&&(page1<(int) Math.ceil(((float)count1)/5))){
			page1++;				
		}else if(state.equals("last")&&(page1>1)){
			page1--; 				
		}else if (state.equals("jump")){
			
		}
		int end=5*page1;
		int start=end-4;
		page=page1+"";
		list.add(page);
		list.add(informationMapper.getInforList(Integer.parseInt(parameterid), end, start));
		list.add(countpage1);
		return list;
	}
	public int getcountPage(int parameterid){
		
		return (int) Math.ceil(((float)informationMapper.getInformation(parameterid).size())/5);	
	}
	@Override
	public List<String> informationType() {
		// TODO Auto-generated method stub
		return informationMapper.informationType();
	}


	@Override
	public int selectPid(String paramenter) {
		// TODO Auto-generated method stub
		System.out.println("Imp:"+paramenter);
		return informationMapper.selectPid(paramenter);
	}


	@Override
	public int countInfor(int state) {
		// TODO Auto-generated method stub
		return informationMapper.countInfor(state);
	}


	@Override
	public List<InformationBean> conditionQuery(int state, int page) {
		// TODO Auto-generated method stub
		return informationMapper.conditionQuery(state, page);
	}


	@Override
	public int delInfor(int inforId) {
		// TODO Auto-generated method stub
		return informationMapper.delInfor(inforId);
	}


	@Override
	public int updateInfor(InformationBean ib) {
		// TODO Auto-generated method stub
		return informationMapper.updateInfor(ib);
	}


	@Override
	public List<InformationBean> selectOne(int inforId) {
		// TODO Auto-generated method stub
		return informationMapper.selectOne(inforId);
	}

}
