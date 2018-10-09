package org.great.biz;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.great.bean.ConditionBean;
import org.great.bean.ProAndUserBean;
import org.great.bean.ProductionBean;
import org.great.bean.SessionBean;
import org.great.bean.UserBean;
import org.great.mapper.ParameterMapper;
import org.great.mapper.ProAndUserMapper;
import org.great.mapper.ProductionMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class ProductionBizImp implements ProductionBiz{
	@Resource
	private ProductionMapper productionMapper;
	@Resource
	private ParameterMapper parameterMapper;
	@Resource
	private ProAndUserMapper proAndUserMapper;
	
	@Override
	public void toIssueProduction(HttpServletRequest request, String title, Integer price, Integer className,
			String area2, MultipartFile file,int userId,MultipartFile productionFile) {
		// TODO Auto-generated method stub
		
	//	System.out.println("进入发布Biz实现类"+"neirRong="+area2);
		
		ProductionBean productionBean=new ProductionBean();
		
	//	System.out.println("biaoti="+title+"jiage="+price+"fenlei="+className);
		productionBean.setProductionName(title);
		productionBean.setProductionMoney(price);
		
		  UserBean userBean= (UserBean) request.getSession().getAttribute("user");//从session取出userbean对象
		productionBean.setUserId(userBean.getUserId());
	
		productionBean.setParameterId(className);
		productionBean.setBuyCount(0);//初始化购买次数
		//productionBean.setClassId(className);
		System.out.println("上传封面图片名字="+file.getOriginalFilename());
		if(file.getOriginalFilename()=="") {
			System.out.println("没有封面上传");
		}else {
			String productionImage=upLoadFile(request, file);
			productionBean.setProductionImage(productionImage);
		}
	
		productionBean.setProductionDetal(area2);
		/*System.out.println("上传文件的名字="+productionFile.getOriginalFilename());
		*/
		if(productionFile.getOriginalFilename()=="") {
			System.out.println("没有文件上传");
		}else {
			String  productionFile2=upLoadFile(request, productionFile);
			productionBean.setProductionFile(productionFile2);
		}
		
		/*if(productionFile.getOriginalFilename()==null) {
			System.out.println("没有文件上传2");
		}*/
		
		
		
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
        System.out.println("Biz"+path+"---->"+uploadDocName);
        
        //-----------------------
		
		return uploadDocName;
	}


	@Override
	public ConditionBean findProductionList(ConditionBean conditionBean,HttpServletRequest request,String state,Integer  toNumber) {
		// TODO Auto-generated method stub
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		ArrayList<ProductionBean> listSize=new ArrayList<ProductionBean>();
		int currentPage=(int) conditionBean.getCurrentPage();
		int totalPages=(int) conditionBean.getTotalPages();
		if(state==null) {
			state="";
		}
		if(state.equals("next")) {
			//System.out.println("进行下一页操作，增加页数前，当前页="+currentPage+"总页数="+totalPages);
			if(currentPage<totalPages) {
				
				currentPage++;
			}
		//	System.out.println("进行下一页操作，增加页数后，当前页="+currentPage+"总页数="+totalPages);
		}
		if(state.equals("last")) {
			if(currentPage>1) {
				
				currentPage--;
			}
		}
		System.out.println("state="+state);
		 if(state.equals("toNumber")) {
			 System.out.println("进入页面跳转");
			 currentPage=toNumber;
		} 
	//	System.out.println("要去查找的页数="+currentPage);
		conditionBean.setCurrentPage(currentPage);
	 	System.out.println("查找条件="+conditionBean.getConditionName()+"条件2"+conditionBean.getFieldName());
		listSize=productionMapper.findAllProductionList(conditionBean);
	
		int a = listSize.size();
		int b = (int) conditionBean.getEachPageCum();
		int c=a%b==0?a/b:a/b+1;
	//	System.out.println("原来要去查找的页数="+conditionBean.getCurrentPage());
		if(conditionBean.getCurrentPage()>c) {
			int newCurrentPage=(int) (conditionBean.getCurrentPage()-1);
			conditionBean.setCurrentPage(newCurrentPage);
	//		System.out.println("要去查找的页数="+newCurrentPage);
		}
	//	System.out.println("要去查找的页数="+conditionBean.getCurrentPage());
		list=productionMapper.findProductionList(conditionBean);
		for(int i=0;i<list.size();i++) {
			
			String auditName=	productionMapper.toFindProductionAuditName(list.get(i).getAuditState());
			list.get(i).setAuditName(auditName);
			String className=	productionMapper.findClassName(list.get(i).getParameterId());
			list.get(i).setClassName(className);
				
			}
	//	System.out.println("list长度8="+list.size());
		conditionBean.setProList(list);
		
	
	//	System.out.println("设置当前页数！！！！！！！！！！！！！！！！="+conditionBean.getCurrentPage());
		request.setAttribute("currentPage",  currentPage);
		request.setAttribute("totalPages", c);
		conditionBean.setTotalPages(c);
		
		return conditionBean;
	}


	@Override
	public ProductionBean findProductionDetal(int id) {
		// TODO Auto-generated method stub
		ProductionBean productionBean=new ProductionBean();
		
		productionBean=productionMapper.findProductionDetal(id);
		String className=	productionMapper.findClassName(productionBean.getParameterId());
		productionBean.setClassName(className);
		return productionBean;
	}
	@Override
	public void productionPayFinish(HttpServletRequest request, Integer proId, Integer userId,Integer  proUserId,Double price) {
		// TODO Auto-generated method stub
		
		System.out.println("BIZ得到作品ID="+proId+"BIZ得到购买者ID="+userId);
		//增加购买记录 物品归属表 proAndUser
		System.out.println("作品ID="+proId+"购买者id="+userId+"作品价格="+price+"作品的作者="+proUserId);
		productionMapper.productionPayFinish(proId, userId,proUserId);
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
             
             
             //4购买作品后 作品的购买次数加1
                         //查询该作品的购买次数
           int buyCount=  productionMapper.findProductionBuyCount(proId)+1;
             //设置新的购买次数
           productionMapper.setProductionBuyCount(proId, buyCount);
             
	}
	
	
	//得到热卖作品列表
	public List<ProductionBean> getProductionList(){
				
		return productionMapper.getProductionList();	
	}


	@Override
	public ConditionBean toManageProductionList(ConditionBean conditionBean, HttpServletRequest request, String state,Integer toNumber) {
		// TODO Auto-generated method stub
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		ArrayList<ProductionBean> listSize=new ArrayList<ProductionBean>();
		int currentPage=(int) conditionBean.getCurrentPage();
		int totalPages=(int) conditionBean.getTotalPages();
		//System.out.println("当前页码="+currentPage);
		//System.out.println("总页码="+totalPages);
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
		//System.out.println("state="+state);
		 if(state.equals("toNumber")) {
			// System.out.println("进入页面跳转");
			 currentPage=toNumber;
		} 
		//System.out.println("翻页后当前页码="+currentPage);
//		System.out.println("翻页后总页码="+totalPages);
		// System.out.println("查找条件getFieldName="+conditionBean.getFieldName());
	//	 System.out.println("查找条件getConditionName="+conditionBean.getConditionName());
		conditionBean.setCurrentPage(currentPage);
		list=productionMapper.toManageProductionList(conditionBean);
	//	System.out.println("翻页后的list长度="+list.size());
		//把 审核状态  中文名称   放进去
		for(int i=0;i<list.size();i++) {
			
			
		String auditName=	productionMapper.toFindProductionAuditName(list.get(i).getAuditState());
		list.get(i).setAuditName(auditName);
			
		}
		
		
		
		listSize=productionMapper.toManageAllProductionList(conditionBean);
		conditionBean.setProList(list);
		
		int a = listSize.size();
		int b = (int) conditionBean.getEachPageCum();;
		int c=a%b==0?a/b:a/b+1;
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPages", c);
		conditionBean.setTotalPages(c);
		
		
		 
		
		
		return conditionBean;
	}


	@Override
	public void editProduction(HttpServletRequest request, Integer proId, String title, Float price,
			Integer className, String area2, MultipartFile file, MultipartFile productionFile) {
		ProductionBean productionBean=new ProductionBean();
		
		//	System.out.println("biaoti="+title+"jiage="+price+"fenlei="+className);
		System.out.println("更新的作品id=+"+proId+"新的作品名字="+title);
		productionBean.setProductionId(proId);
		productionBean.setProductionName(title);
			productionBean.setProductionMoney(price);
			
			/*  UserBean userBean= (UserBean) request.getSession().getAttribute("user");//从session取出userbean对象
			productionBean.setUserId(userBean.getUserId());*/
		
			productionBean.setParameterId(className);
			productionBean.setBuyCount(0);//初始化购买次数
			//productionBean.setClassId(className);
			System.out.println("上传封面图片名字="+file.getOriginalFilename());
			if(file.getOriginalFilename()=="") {
				System.out.println("没有封面上传");
			}else {
				System.out.println("有上传封面图片，进行上传操作");
				String productionImage=upLoadFile(request, file);
				productionBean.setProductionImage(productionImage);
			}
		
			productionBean.setProductionDetal(area2);
			/*System.out.println("上传文件的名字="+productionFile.getOriginalFilename());
			*/
			if(productionFile.getOriginalFilename()=="") {
				System.out.println("没有文件上传");
			}else {
				System.out.println("有上传文件，进行上传操作");
				String  productionFile2=upLoadFile(request, productionFile);
				productionBean.setProductionFile(productionFile2);
			}
			
			/*if(productionFile.getOriginalFilename()==null) {
				System.out.println("没有文件上传2");
			}*/
			
			productionMapper.editProduction(productionBean);
			
		//	productionMapper.addProduction(productionBean);
		 
		
	}


	@Override
	public ConditionBean findBuyProduction(ConditionBean conditionBean, HttpServletRequest request, String state,Integer toNumber) {
		// TODO Auto-generated method stub
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		ArrayList<ProductionBean> listSize=new ArrayList<ProductionBean>();
		int currentPage=(int) conditionBean.getCurrentPage();
		int totalPages=(int) conditionBean.getTotalPages();
		if(state==null) {
			state="";
		}
		System.out.println("当前页="+currentPage+"总页数="+totalPages);
		if(state.equals("next")) {
		//	System.out.println("进行下一页操作，增加页数前，当前页="+currentPage+"总页数="+totalPages);
			if(currentPage<totalPages) {
				
				currentPage++;
				System.out.println("加一页");
			}
		//	System.out.println("进行下一页操作，增加页数后，当前页="+currentPage+"总页数="+totalPages);
		}
		if(state.equals("last")) {
			if(currentPage>1) {
				
				currentPage--;
				System.out.println("减一页");
			}
		}
		 if(state.equals("toNumber")) {
			 System.out.println("进入页面跳转");
			 currentPage=toNumber;
		} 
	//	System.out.println("要去查找的页数="+currentPage);
		conditionBean.setCurrentPage(currentPage);
	//	System.out.println("查找条件="+conditionBean.getConditionName()+"条件2 ="+conditionBean.getFieldName());
		
		
		//listSize=productionMapper.findAllProductionList(conditionBean);
		listSize=productionMapper.findAllBuyProduction(conditionBean);
		int a = listSize.size();
		int b = (int) conditionBean.getEachPageCum();
		int c=a%b==0?a/b:a/b+1;
	//	System.out.println("总页数="+c+"数组长度为="+a);
	//	System.out.println("原来要去查找的页数="+conditionBean.getCurrentPage());
		if(conditionBean.getCurrentPage()>c) {
			int newCurrentPage=(int) (conditionBean.getCurrentPage()-1);
			conditionBean.setCurrentPage(newCurrentPage);
	//		System.out.println("要去查找的页数="+newCurrentPage);
		}
	//	System.out.println("要去查找的页数="+conditionBean.getCurrentPage());
		list=productionMapper.findProductionList(conditionBean);
		list=productionMapper.findBuyProduction(conditionBean);
		for(int i=0;i<list.size();i++) {
			
			String auditName=	productionMapper.toFindProductionAuditName(list.get(i).getAuditState());
			list.get(i).setAuditName(auditName);
			String className=	productionMapper.findClassName(list.get(i).getParameterId());
			list.get(i).setClassName(className);
				
			}
	//	System.out.println("list长度8="+list.size());
		conditionBean.setProList(list);
		
	
	//	System.out.println("设置当前页数！！！！！！！！！！！！！！！！="+conditionBean.getCurrentPage());
		request.setAttribute("currentPage",  currentPage);
		request.setAttribute("totalPages", c);
		conditionBean.setTotalPages(c);
		
		return conditionBean;
	}


	@Override
	public ConditionBean findProductionListPass(ConditionBean conditionBean, HttpServletRequest request, String state,Integer toNumber) {
		// TODO Auto-generated method stub
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		ArrayList<ProductionBean> listSize=new ArrayList<ProductionBean>();
		int currentPage=(int) conditionBean.getCurrentPage();
		int totalPages=(int) conditionBean.getTotalPages();
		if(state==null) {
			state="";
		}
		if(state.equals("next")) {
			//System.out.println("进行下一页操作，增加页数前，当前页="+currentPage+"总页数="+totalPages);
			if(currentPage<totalPages) {
				
				currentPage++;
			}
		//	System.out.println("进行下一页操作，增加页数后，当前页="+currentPage+"总页数="+totalPages);
		}
		if(state.equals("last")) {
			if(currentPage>1) {
				
				currentPage--;
			}
		}
		System.out.println("state="+state);
		 if(state.equals("toNumber")) {
			 System.out.println("进入页面跳转");
			 currentPage=toNumber;
		} 
	//	System.out.println("要去查找的页数="+currentPage);
		conditionBean.setCurrentPage(currentPage);
	 //	System.out.println("查找条件="+conditionBean.getConditionName()+"条件2"+conditionBean.getFieldName());
		listSize=productionMapper.findAllProductionListPass(conditionBean);
	
		int a = listSize.size();
		int b = (int) conditionBean.getEachPageCum();
		int c=a%b==0?a/b:a/b+1;
	//	System.out.println("原来要去查找的页数="+conditionBean.getCurrentPage());
		if(conditionBean.getCurrentPage()>c) {
			int newCurrentPage=(int) (conditionBean.getCurrentPage()-1);
			conditionBean.setCurrentPage(newCurrentPage);
	//		System.out.println("要去查找的页数="+newCurrentPage);
		}
	//	System.out.println("要去查找的页数="+conditionBean.getCurrentPage());
		list=productionMapper.findProductionListPass(conditionBean);
		for(int i=0;i<list.size();i++) {
			
			String auditName=	productionMapper.toFindProductionAuditName(list.get(i).getAuditState());
			list.get(i).setAuditName(auditName);
			String className=	productionMapper.findClassName(list.get(i).getParameterId());
			list.get(i).setClassName(className);
				
			}
	//	System.out.println("list长度8="+list.size());
		conditionBean.setProList(list);
		
	
	//	System.out.println("设置当前页数！！！！！！！！！！！！！！！！="+conditionBean.getCurrentPage());
		request.setAttribute("currentPage",  currentPage);
		request.setAttribute("totalPages", c);
		conditionBean.setTotalPages(c);
		
		return conditionBean;
	}


	@Override
	public void addMoneyPayFinish(HttpServletRequest request, SessionBean sessionBean) {
		// TODO Auto-generated method stub
		
		double money=sessionBean.getAddMoney();
		int userId=sessionBean.getUserId();
		//3.资金表增加数据 3条   两条是 加钱，扣钱  一条是平台加钱  平台ID4
		
     /*   //主动方  买家        被动方卖家      买家扣钱
       productionMapper.addTradRecord(userId, money, userId,7);*/
       
     //主动方:卖家            被动方:买家      卖家加钱
       productionMapper.addTradRecord(userId, money, userId,11);
   /* //主动方: 买家           被动方:平台        平台加钱   平台ID4
       productionMapper.addTradRecord(userId, money, 4,9);*/
       
       //4.账户余额 加钱 扣钱
       		/*//买家扣钱
       							//查询买家余额   扣钱
       double clientMoney=productionMapper.findUserMoney(userId);
       double newClientMoney=clientMoney-price;
       System.out.println("买家id="+userId+"余额="+clientMoney+"买的作品价格="+price+"新余额="+newClientMoney);
       							//更新余额
       productionMapper.setNewUserMoney(userId, newClientMoney);*/
              //卖家加钱
       							//查询卖家余额    加钱
       double proUserMoney=productionMapper.findUserMoney(userId);
       double newProUserMoney=proUserMoney+money;
       System.out.println("充值者id="+userId+"余额="+proUserMoney+"充值者新余额="+newProUserMoney);
       
       //更新余额
       productionMapper.setNewUserMoney(userId, newProUserMoney); 
       
      /* //平台加钱    
       									//查询平台余额    平台ID=4
       double commissionMoney=productionMapper.findUserMoney(4);
       double newCommissionMoney=commissionMoney+price2;
       System.out.println("平台id=4"+"余额="+commissionMoney+"平台赚到的钱="+price2+"新余额="+newCommissionMoney);
       
       //更新余额
       productionMapper.setNewUserMoney(4, newCommissionMoney);
       
       
       //4购买作品后 作品的购买次数加1
                   //查询该作品的购买次数
     int buyCount=  productionMapper.findProductionBuyCount(proId)+1;
       //设置新的购买次数
     productionMapper.setProductionBuyCount(proId, buyCount);*/
       
	}


	@Override
	public Integer checkMoney(Integer userId, Integer proId) {
		// TODO Auto-generated method stub
		
		//查询是否购买过
		ArrayList<ProAndUserBean> list=new ArrayList<ProAndUserBean>();
		list=proAndUserMapper.findHasBeenBuy(userId, proId);
		
		if(list.size()>0) {
			return 3;
		}
		
		//查询余额
		double proUserMoney=productionMapper.findUserMoney(userId);
		
		//查询作品价格
		ProductionBean productionBean=new ProductionBean();
		productionBean=	productionMapper.findProductionDetal(proId);
		double proPrice=productionBean.getProductionMoney();
		
		if(proPrice>proUserMoney) {
			return 0;
		}else {
			return 1;
		}
		
	 
	}
	
}
