package org.great.handler;

import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

 

 

@Controller
@RequestMapping("/picture")
public class PictureIoHandler {
	private InputStream imageStream;
	
	@RequestMapping("/findPicture.action")
	public ModelAndView findPicture(HttpServletRequest request,HttpServletResponse response
			,String url  
			) throws FileNotFoundException, IOException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsp/productionAllList");
		
		 
		
	 
		FileInputStream fis = null;
		 OutputStream os = null;
		try {
			
			String path = request.getRealPath("/images/");
		
			
			fis = new FileInputStream(path+url);
			os = response.getOutputStream();
			int count = 0;
			byte[] buffer = new byte[1024 * 8];
			while ((count = fis.read(buffer)) != -1) {
				os.write(buffer, 0, count);
				os.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			
			fis.close();
			os.close();
			//response.reset();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		return  null;
	}

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}
	
		
	
}
