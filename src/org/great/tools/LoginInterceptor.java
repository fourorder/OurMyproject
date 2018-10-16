package org.great.tools;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object obj) throws Exception {
        System.out.println("[AccessInterceptor]:preHandle执行");
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){    //未登录
        	response.setContentType("text/html;charset=utf-8");
        	response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            StringBuffer sb = new StringBuffer("<script type=\"text/javascript\" charset=\"UTF-8\">");
//            sb.append("alert(\"你的页面已经过期，请重新登录\")");
//            sb.append("window.location.href='/user/home.action';");
//            sb.append("</script>");
            String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";	
            out.write("<script type='text/javascript'>alert('你的页面已经过期，请重新登录！'); location.href='"+path+"/user/home.action';</script>");
//          out.print(sb.toString());
            out.close();
            return false;
        }else{    //已经登录
            return true;
        }
    }

	

}
