package org.great.tools;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.great.bean.ProductionBean;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Worm {

	public static List<ProductionBean> getInfo(String name) {
		ArrayList<ProductionBean> list=new ArrayList<ProductionBean>();
		ArrayList<String> list1=new ArrayList<String>();
		List<Object> objects=new ArrayList<Object>();

		String path="https://search.zbj.com/s/?kw=";
		path=path+name;
		System.out.println(path);
		try {
			String code=Jsoup.connect(path).execute().body();
			Document document=Jsoup.parse(code);
			Elements elements=document.getElementsByClass("lazy fl");
			Elements elements1=document.select("div.expertTags>span");//获得id为expertTags的div下的span
			Elements elements2=document.select("div.service-category-detail>a[data-id]");
			int len=elements.size();
			for (int i = 0; i < len; i++) {
				ProductionBean productionBean=new ProductionBean();
				productionBean.setProductionImage(elements.get(i).attr("data-original"));
				System.out.println(elements.get(i).attr("data-original"));
				productionBean.setProductionDetal(elements1.get(i).text());
				productionBean.setProductionFile(elements2.get(i).attr("href"));
				list.add(productionBean);
			}
			
//			objects.add(list);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static void main(String[] args) {
		String path="https://search.zbj.com/s/?kw=java";
		String code;
		try {
			code = Jsoup.connect(path).execute().body();
//			System.out.println(code);
			Document document=Jsoup.parse(code);
			Elements elements=document.select("div.expertTags>span");//获得id为expertTags的div下的span
			Elements elements1=document.select("div.service-category-detail>a[data-id]");
			int len=elements1.size();
			for (int i = 0; i < len; i++) {
				System.out.println(elements1.get(i).attr("href"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
