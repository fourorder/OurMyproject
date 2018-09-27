package org.great.biz;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ProductionBean;
import org.great.mapper.ParameterMapper;
import org.great.mapper.ProductionMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class ProductionBizImp implements ProductionBiz{
	@Resource
	private ProductionMapper productionMapper;
	@Resource
	private ParameterMapper parameterMapper;
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
		productionBean.setBuyCount(0);//初始化购买次数
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
	@Override
	public void productionPayFinish(HttpServletRequest request, Integer proId, Integer userId,Integer  proUserId,Double price) {
		// TODO Auto-generated method stub
		
		System.out.println("BIZ得到作品ID="+proId+"BIZ得到购买者ID="+userId);
		//增加购买记录 物品归属表 proAndUser
		System.out.println("作品ID="+proId+"购买者id="+userId+"作品价格="+price+"作品的作者="+proUserId);
		productionMapper.productionPayFinish(proId, userId);
		//增加账户交易记录记录  
		
		 //1.查找抽成比例
		String Commission=parameterMapper.findCommission();
		System.out.println("平台抽成比例="+Commission);
		 
		Commission=Commission.split("%")[0];
		System.out.println("平台抽成比例="+Commission);
		Double SS=Double.valueOf(Commission)*0.01;
		System.out.println("平台抽成比例="+SS);
		//2.计算金钱
		Double price2=price*SS;
		System.out.println("平台获得的金钱"+price2);
		DecimalFormat df = new DecimalFormat("######0.00");
		   

		 
		//df.setMinimumFractionDigits("#.00");
		String A=df.format(price2);
		price2=Double.valueOf(A);
	//	System.out.println(df.format(price2));

 
		
   double price3=price-price2;
   System.out.println("作品的作者获得金钱"+df.format(price3));
 System.out.println("平台获得的金钱="+price2); 
		 
		//3.资金表增加数据 3条   两条是 加钱，扣钱  一条是平台加钱  平台ID4
		
              //主动方  买家        被动方卖家      买家扣钱
             productionMapper.addTradRecord(userId, price, proUserId,7);
             
           //主动方:卖家            被动方:买家      卖家加钱
             productionMapper.addTradRecord(proUserId, price3, userId,8);
          //主动方: 买家           被动方:平台        平台加钱   平台ID4
             productionMapper.addTradRecord(userId, price2, 4,9);
             
             //4.账户余额 加钱 扣钱
             		//买家扣钱
             							//查询买家余额   扣钱
             double clientMoney=productionMapper.findUserMoney(userId);
             double newClientMoney=clientMoney-price;
             System.out.println("买家id="+userId+"余额="+clientMoney+"买的作品价格="+price+"新余额="+newClientMoney);
             							//更新余额
             productionMapper.setNewUserMoney(userId, newClientMoney);
                   //卖家加钱
             							//查询卖家余额    加钱
             double proUserMoney=productionMapper.findUserMoney(proUserId);
             double newProUserMoney=proUserMoney+price3;
             System.out.println("卖家id="+proUserId+"余额="+proUserMoney+"商家赚到的钱="+price3+"新余额="+newProUserMoney);
             
             //更新余额
             productionMapper.setNewUserMoney(proUserId, newProUserMoney);
             
             //平台加钱    
             									//查询平台余额    平台ID=4
             double commissionMoney=productionMapper.findUserMoney(4);
             double newCommissionMoney=commissionMoney+price2;
             System.out.println("平台id=4"+"余额="+commissionMoney+"平台赚到的钱="+price2+"新余额="+newCommissionMoney);
             
             //更新余额
             productionMapper.setNewUserMoney(4, newCommissionMoney);
             
	}
	//得到热卖作品列表
	public List<ProductionBean> getProductionList(){
				
		return productionMapper.getProductionList();	
	}
	
}
