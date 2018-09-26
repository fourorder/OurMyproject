package org.great.bean;

public class CharacterBean {
	private int characterId;
	private String characterName;
	private String characterTime;
	private String characterIntro;
	public CharacterBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CharacterBean(int characterId, String characterName) {
		super();
		this.characterId = characterId;
		this.characterName = characterName;
	}
	public int getCharacterId() {
		return characterId;
	}
	public void setCharacterId(int characterId) {
		this.characterId = characterId;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public String getCharacterTime() {
		return characterTime;
	}
	public void setCharacterTime(String characterTime) {
		this.characterTime = characterTime;
	}
	public String getCharacterIntro() {
		return characterIntro;
	}
	public void setCharacterIntro(String characterIntro) {
		this.characterIntro = characterIntro;
	}
	
}
