package org.great.biz;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ProductionBean;
import org.great.mapper.ProductionMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class ProductionBizImp implements ProductionBiz{
	@Resource
	private ProductionMapper productionMapper;
	
	@Override
	public void toIssueProduction(HttpServletRequest request, String title, Integer price, Integer className,
			String area2, MultipartFile file,int userId,MultipartFile productionFile) {
		// TODO Auto-generated method stub
		
	//	System.out.println("进入发布Biz实现类"+"neirRong="+area2);
		
		ProductionBean productionBean=new ProductionBean();
		
	//	System.out.println("biaoti="+title+"jiage="+price+"fenlei="+className);
		productionBean.setProductionName(title);
		productionBean.setProductionMoney(price);
		productionBean.setUserId(2);
		productionBean.setParameterId(className);
		//productionBean.setClassId(className);
		String productionImage=upLoadFile(request, file);
		productionBean.setProductionImage(productionImage);
		productionBean.setProductionDetal(area2);
		String  productionFile2=upLoadFile(request, productionFile);
		productionBean.setProductionFile(productionFile2);
		
		productionMapper.addProduction(productionBean);
	 
		
		
	}

	
	public String upLoadFile(HttpServletRequest request,MultipartFile file) {
		
	//上传图片--------------------
		
		//上传文件路径
		 String path = request.getServletContext().getRealPath("/images/");
		// System.out.println(path);
        //上传文件名
        String filename = file.getOriginalFilename();
        
        File filepath = new File(path,filename);
        //判断路径是否存在，如果不存在就创建一个
        if (!filepath.getParentFile().exists()) { 
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        String uploadDocName=System.currentTimeMillis()+"@"+filename;
        try {
			file.transferTo(new File(path + File.separator + uploadDocName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("Biz"+path+"-->"+uploadDocName);
        
        //-----------------------
		
		return uploadDocName;
	}


	@Override
	public ConditionBean findProductionList(ConditionBean conditionBean,HttpServletRequest request,String state) {
		// TODO Auto-generated method stub
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		ArrayList<ProductionBean> listSize=new ArrayList<ProductionBean>();
		int currentPage=(int) conditionBean.getCurrentPage();
		int totalPages=(int) conditionBean.getTotalPages();
		if(state==null) {
			state="";
		}
		if(state.equals("next")) {
			if(currentPage<totalPages) {
				
				currentPage++;
			}
		}
		if(state.equals("last")) {
			if(currentPage>1) {
				
				currentPage--;
			}
		}
		conditionBean.setCurrentPage(currentPage);
		list=productionMapper.findProductionList(conditionBean);
		listSize=productionMapper.findAllProductionList(conditionBean);
		conditionBean.setProList(list);
		
		int a = listSize.size();
		int b = (int) conditionBean.getEachPageCum();;
		int c=a%b==0?a/b:a/b+1;
		//System.out.println("作品展示的列表长度"+list.size());
		//System.out.println("总长度="+listSize.size());
		//System.out.println("列表总页数==" + c);
		request.setAttribute("currentPage", conditionBean.getCurrentPage());
		request.setAttribute("totalPages", c);
		conditionBean.setTotalPages(c);
		
		return conditionBean;
	}


	@Override
	public ProductionBean findProductionDetal(int id) {
		// TODO Auto-generated method stub
		ProductionBean productionBean=new ProductionBean();
		
		productionBean=productionMapper.findProductionDetal(id);
		
		
		return productionBean;
	}
	
}
