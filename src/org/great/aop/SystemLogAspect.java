package org.great.aop;


import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.great.bean.UserBean;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



@Aspect
@Component
public class SystemLogAspect {


	private static Logger logger = Logger.getLogger("zxtest");  
    
    @Pointcut("execution (* org.great.handler..*.login(..))")  
    public  void controllerAspect() {  
    }  
    

//    @Before("controllerAspect()")
//    public void doBefore(JoinPoint joinPoint) {
//        System.out.println("==========执行controller前置通知===============");
//        
//        if(logger.isInfoEnabled()){
//            logger.info("before " + joinPoint);
//        }
//    }    
    
//      @Around("controllerAspect()")
//      public void around(JoinPoint joinPoint){
//          System.out.println("==========开始执行controller环绕通知===============");
//          long start = System.currentTimeMillis();
//          
//          String methodName = joinPoint.getSignature().getName();
//          
//          try {
//              ((ProceedingJoinPoint) joinPoint).proceed();
//              long end = System.currentTimeMillis();
//              if(logger.isInfoEnabled()){
//                  logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms!");
//              }
//              System.out.println("==========controller后置通知开始===============");
//          } catch (Throwable e) {
//        	  System.out.println("鐜粫閫氱煡涓殑寮傚父--------------------------------"+methodName+"-------"+e.getMessage());
//              long end = System.currentTimeMillis();
//              if(logger.isInfoEnabled()){
//                  logger.info("around " + joinPoint + "\tUse time : " + (end - start) + " ms with exception : " + e.getMessage());
//              }
//          }
//      }
    
     
    @After("controllerAspect()")  
    public  void after(JoinPoint joinPoint) throws Throwable{  
  
//        User user = new User();
//        user.setId(1);
//        user.setName("陈毅");
//        String ip = "127.0.0.1";
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
    	UserBean ub=new UserBean();
    	ub=(UserBean) request.getSession().getAttribute("user");
         try {  
            
            String targetName = joinPoint.getTarget().getClass().getName();  
            String methodName = joinPoint.getSignature().getName();  
            Object[] arguments = joinPoint.getArgs();  
            Class targetClass = Class.forName(targetName);  
            Method[] methods = targetClass.getMethods();
            String operationType = "";
            String operationName = "";
             /*for (Method method : methods) {  
                 if (method.getName().equals(methodName)) {  
                    Class[] clazzs = method.getParameterTypes();  
                     if (clazzs.length == arguments.length) {  
                         operationType = method.getAnnotation(Log.class).operationType();
                         operationName = method.getAnnotation(Log.class).operationName();
                         break;  
                    }  
                }  
            }*/
          
            System.out.println("=====controller后置通知开始=====");  
            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);  
            System.out.println("方法描述:" + operationName);  
            System.out.println("请求人:" + ub.getUserAccount());  
//            System.out.println("请求IP:" + ip);  
//       
//            SystemLog log = new SystemLog();  
//            log.setId(UUID.randomUUID().toString());
//            log.setDescription(operationName);  
//            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);  
//            log.setLogType((long)0);  
//            log.setRequestIp(ip);  
//            log.setExceptioncode( null);  
//            log.setExceptionDetail( null);  
//            log.setParams( null);  
//            log.setCreateBy(user.getName());  
//            log.setCreateDate(new Date());  

            System.out.println("=====controller后置通知结束=====");  
        }  catch (Exception e) {  
 
            e.printStackTrace();
            
            throw e;
        }  
    } 
    
   
//     @AfterThrowing(pointcut = "controllerAspect()", throwing="e")  
//     public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) throws Throwable{  
//       
//        System.out.println("寮傚父閫氱煡寮�濮�------------------------------------------");
//        User user = new User();
//        user.setId(1);
//        user.setName("寮犱笁");
//        String ip = "127.0.0.1";
//        
//        String params = "";  
//         if (joinPoint.getArgs() !=  null && joinPoint.getArgs().length > 0) {  
//             for ( int i = 0; i < joinPoint.getArgs().length; i++) {  
////                params += JsonUtil.getJsonStr(joinPoint.getArgs()[i]) + ";";  
//            	 params += joinPoint.getArgs()[i] + ";"; 
//            }  
//        }  
//         try {  
//             
//             String targetName = joinPoint.getTarget().getClass().getName();  
//             String methodName = joinPoint.getSignature().getName();  
//             Object[] arguments = joinPoint.getArgs();  
//             Class targetClass = Class.forName(targetName);  
//             Method[] methods = targetClass.getMethods();
//             String operationType = "";
//             String operationName = "";
//              for (Method method : methods) {  
//                  if (method.getName().equals(methodName)) {  
//                     Class[] clazzs = method.getParameterTypes();  
//                      if (clazzs.length == arguments.length) {  
//                          operationType = method.getAnnotation(Log.class).operationType();
//                          operationName = method.getAnnotation(Log.class).operationName();
//                          break;  
//                     }  
//                 }  
//             }
//             /*========鎺у埗鍙拌緭鍑�=========*/  
//            System.out.println("=====寮傚父閫氱煡寮�濮�=====");  
//            System.out.println("寮傚父浠ｇ爜:" + e.getClass().getName());  
//            System.out.println("寮傚父淇℃伅:" + e.getMessage());  
//            System.out.println("寮傚父鏂规硶:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);  
//            System.out.println("鏂规硶鎻忚堪:" + operationName);  
//            System.out.println("璇锋眰浜�:" + user.getName());  
//            System.out.println("璇锋眰IP:" + ip);  
//            System.out.println("璇锋眰鍙傛暟:" + params);  
//               /*==========鏁版嵁搴撴棩蹇�=========*/  
//            SystemLog log = new SystemLog();
//            log.setId(UUID.randomUUID().toString());
//            log.setDescription(operationName);  
//            log.setExceptioncode(e.getClass().getName());  
//            log.setLogType((long)1);  
//            log.setExceptionDetail(e.getMessage());  
//            log.setMethod((joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));  
//            log.setParams(params);  
//            log.setCreateBy(user.getName());  
//            log.setCreateDate(new Date());  
//            log.setRequestIp(ip);  
//            //淇濆瓨鏁版嵁搴�  
////            systemLogService.insert(log);  
//            System.out.println("=====寮傚父閫氱煡缁撴潫=====");  
//        }  catch (Exception ex) {  
//            //璁板綍鏈湴寮傚父鏃ュ織  
//            logger.error("==寮傚父閫氱煡寮傚父==");  
//            logger.error("寮傚父淇℃伅:{}------"+ ex.getMessage());
//        }  
//        
//  
//    }

}