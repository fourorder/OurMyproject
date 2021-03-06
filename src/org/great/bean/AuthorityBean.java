package org.great.bean;


import org.springframework.stereotype.Component;

@Component
public class AuthorityBean {

	private int  authorityId;
	private String authorityName;
	private int pId;
	private String pathName;
	private int state;
	private String divClass;
	private int rank;
	
	
	
	
	
	
	public AuthorityBean() {
		super();
	}
	public AuthorityBean(int authorityId, String authorityName, int pId, String pathName, int state) {
		super();
		this.authorityId = authorityId;
		this.authorityName = authorityName;
		this.pId = pId;
		this.pathName = pathName;
		this.state = state;
	}
	public AuthorityBean(int authorityId, String authorityName, int pId, String pathName, int state, String divClass,
			int rank) {
		super();
		this.authorityId = authorityId;
		this.authorityName = authorityName;
		this.pId = pId;
		this.pathName = pathName;
		this.state = state;
		this.divClass = divClass;
		this.rank = rank;
	}
	public String getDivClass() {
		return divClass;
	}
	public void setDivClass(String divClass) {
		this.divClass = divClass;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(int authorityId) {
		this.authorityId = authorityId;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getPathName() {
		return pathName;
	}
	public void setPathName(String pathName) {
		this.pathName = pathName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
 
}
