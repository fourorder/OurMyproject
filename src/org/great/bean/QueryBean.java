package org.great.bean;

import org.springframework.stereotype.Service;

@Service
public class QueryBean {
	private String name;
	private int star;
	private int end; 
	public QueryBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QueryBean(String name, int star, int end) {
		super();
		this.name = name;
		this.star = star;
		this.end = end;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
}
