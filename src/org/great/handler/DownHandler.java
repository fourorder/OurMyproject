package org.great.handler;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.opensymphony.xwork2.ActionSupport;
@Controller //��ע�͵ĺ����ǽ��������ó�Ϊ������ύ����������
@RequestMapping("/")
public class DownHandler extends ActionSupport{

	
	@RequestMapping("/download.action")
	public ResponseEntity<byte[]> download(HttpServletRequest request,String upUrl,MultipartFile myfile	) throws IllegalStateException, IOException {
	
		System.out.println("文件名称="+upUrl);
		 //下载文件路径
        String path = request.getServletContext().getRealPath("/images/");
        File file = new File(path + File.separator + upUrl);
        HttpHeaders headers = new HttpHeaders();  
        //下载显示的文件名，解决中文名称乱码问题  
        String downloadFielName = new String(upUrl.getBytes("UTF-8"),"iso-8859-1");
        //通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", downloadFielName); 
        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                headers, HttpStatus.CREATED);  
		
	//	return ServletActionContext.getServletContext().getResourceAsStream(
	//			"/upload/"+upUrl);
	}
	
	
	@Override
	public String execute() throws Exception
	{
		return SUCCESS;
	}
}
