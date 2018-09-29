package org.great.biz;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.BidBean;
import org.great.bean.DemandBean;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.mapper.DemandMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class DemandBizImp implements DemandBiz {
	@Resource
	private DemandMapper demandMapper;
	private int star;
	private int end;
	@Resource
	private QueryBean queryBean;

	@Override
	public int addDemand(HttpServletRequest request, String userId, String demandTitle, String demandInformation,
			String parameterId, MultipartFile file, String dealMoney, String securityMoney) {
		String demandHead = upLoadFile(request, file);

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String publishTime = format.format(date);

		return demandMapper.addDemand(demandTitle, demandInformation, parameterId, userId, publishTime, demandHead,
				dealMoney, securityMoney);
	}

	public String upLoadFile(HttpServletRequest request, MultipartFile file) {

		String path = request.getServletContext().getRealPath("/images/");
		// System.out.println(path);
		// 上传文件名
		String filename = file.getOriginalFilename();

		File filepath = new File(path, filename);
		// 判断路径是否存在，如果不存在就创建一个
		if (!filepath.getParentFile().exists()) {
			filepath.getParentFile().mkdirs();
		}
		// 将上传文件保存到一个目标文件当中
		String uploadDocName = System.currentTimeMillis() + "@" + filename;
		try {
			file.transferTo(new File(path + File.separator + uploadDocName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return uploadDocName;
	}

	@Override
	public ArrayList<ParameterBean> getParmater() {
		// 获取参数
		return demandMapper.getParameter();
	}

	@Override
	public ArrayList<DemandBean> getDemandList(int page, String name) {

		end = page * 8;
		star = end - 7;

		queryBean = new QueryBean(name, star, end);
		return demandMapper.getDemandList(queryBean);
	}

	@Override
	public int demandCount(String name) {

		int count = demandMapper.demandCount(name);
		int size = 8;
		int countpage = 0;
		if (count % size != 0) {
			countpage = count / size + 1;
		} else {
			countpage = count / size;
		}

		return countpage;
	}

	@Override
	public List<Object> queayDemandList(String state, String page, String searchName) {
		// ajax
		List<Object> list = new ArrayList<Object>();
		int getPage = Integer.parseInt(page);

		int count = demandMapper.demandCount(searchName);

		int countPage = (int) Math.ceil(((float) count) / 8);

		if (state == null) {
			state = "";
		}

		if (state.equals("next") && getPage < countPage) {
			getPage++;
		} else if (state.equals("last") && getPage > 1) {
			getPage--;
		} else if (state.equals("jump")) {

		} else if (state.equals("query")) {
			getPage = 1;
		}

		end = getPage * 8;
		star = end - 7;
		queryBean = new QueryBean(searchName, star, end);

		list.add(getPage);
		list.add(countPage);
		list.add(demandMapper.getDemandList(queryBean));

		return list;
	}

	@Override
	public DemandInfoBean getDemandInfoBean(String demandid) {
		// TODO Auto-generated method stub
		return demandMapper.getDemandInfoBean(demandid);
	}

	@Override
	public ArrayList<BidBean> getBidList(String demandid) {
		// TODO Auto-generated method stub
		return demandMapper.getBidList(demandid);
	}

	@Override
	public int addBid(String userid, String demandid) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		
		System.out.println(demandid);
		System.out.println(time);
		return demandMapper.addBid(userid, demandid, time);
	}
	@Override
	public List<DemandBean> countDemand(String demandTitle) {
		// TODO Auto-generated method stub
		if (demandTitle!=null) {
			demandTitle="%"+demandTitle+"%";
		}
		return demandMapper.countDemand(demandTitle);
	}
	@Override
	public List<DemandBean> demand(String demandTitle,int page) {
		// TODO Auto-generated method stub
		if (demandTitle!=null) {
			demandTitle="%"+demandTitle+"%";
		}
		return demandMapper.demand(demandTitle,page);
	}
/*	@Override
	public List<DemandBean> countDemand2(String demandTitle) {
		// TODO Auto-generated method stub
		demandTitle="%"+demandTitle+"%";
		return demandMapper.countDemand2(demandTitle);
	}*/
	@Override
	public List<DemandBean> findInfo(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findInfo(demandId);
	}
	@Override
	public String findFromUserName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findFromUserName(demandId);
	}
	@Override
	public String findToUserName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findToUserName(demandId);
	}
	@Override
	public String findParameterName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findParameterName(demandId);
	}
	@Override
	public String findStateName(int demandId) {
		// TODO Auto-generated method stub
		return demandMapper.findStateName(demandId);
	}
	@Override
	public void changeInfo(int demandId2, String demandDetailInformation2, int securityMoney2, int dealMoney2,
			String completeTime2, String auctionTime2, String demandHead2) {
		 demandMapper.changeInfo(demandId2, demandDetailInformation2, securityMoney2, dealMoney2, completeTime2, auctionTime2, demandHead2);
		
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changeState(int demandId, int stateId) {
		demandMapper.changeState(demandId);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changeState2(int demandId, int stateId) {
		demandMapper.changeState2(demandId);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void changeState3(int demandId, int stateId) {
		demandMapper.changeState3(demandId);
		// TODO Auto-generated method stub
		
	}

}
