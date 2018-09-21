package org.great.bean;

public class CharacteBean {
	private int chaeacterId;
	private String characterName;
	public CharacteBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CharacteBean(int chaeacterId, String characterName) {
		super();
		this.chaeacterId = chaeacterId;
		this.characterName = characterName;
	}
	public int getChaeacterId() {
		return chaeacterId;
	}
	public void setChaeacterId(int chaeacterId) {
		this.chaeacterId = chaeacterId;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	
}
