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
import org.great.bean.DemandBeanX;
import org.great.bean.DemandInfoBean;
import org.great.bean.ParameterBean;
import org.great.bean.QueryBean;
import org.great.bean.UpdateDemandBean;
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
	public ArrayList<DemandBeanX> getDemandList(int page, String name) {

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

		
		return demandMapper.addBid(userid, demandid, time);
	}

	@Override
	public ArrayList<ParameterBean> getParmaterState() {
		// 需求状态列表
		return demandMapper.getParameterState();
	}

	@Override
	public ArrayList<DemandInfoBean> getDemandInfoList(int page, String name, String userid, String parameterid,
			String stateid) {
		// 9/27 新版搜索    显示6条数据
		end = page * 6;
		star = end - 5;
		
		return demandMapper.getDemandInfoList(star+"", end+"", name, userid, parameterid, stateid);
	}

	@Override
	public int updateDemand(UpdateDemandBean updateDemandBean) {
		// TODO Auto-generated method stub
		return demandMapper.updateDemand(updateDemandBean);
	}

	@Override
	public int demandCountEmployer(String name, String userid, String parameterid, String stateid) {
		// 雇主搜索总页数 9/28加
		return demandMapper.demandCountEmployer(name, userid, parameterid, stateid);
	}

	@Override
	public List<Object> queayDemandEmployerList(String userid, String state, String page, String searchName,
			String parameterid, String stateid) {
		// 雇主ajax
		List<Object> list = new ArrayList<Object>();
		
		int getPage = Integer.parseInt(page);

		int count = demandMapper.demandCountEmployer(searchName, userid, parameterid, stateid);

		int countPage = (int) Math.ceil(((float) count) / 6);

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
		
		end = getPage * 6;
		star = end - 5;
		list.add(getPage);
		list.add(countPage);
		list.add(count);
		list.add(demandMapper.getDemandInfoList(star+"", end+"", searchName, userid, parameterid, stateid));
		return list;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
