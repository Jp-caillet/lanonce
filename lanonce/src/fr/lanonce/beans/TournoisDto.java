package fr.lanonce.beans;

import java.sql.Date;

public class TournoisDto {
	
	private String picture;
	private String nameGame;
	private String date;
	private String id_url;
	private String lieux;
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getNameGame() {
		return nameGame;
	}
	public void setNameGame(String nameGame) {
		this.nameGame = nameGame;
	}
	public String getId_url() {
		return id_url;
	}
	public void setId_url(String id_url) {
		this.id_url = id_url;
	}
	public String getLieux() {
		return lieux;
	}
	public void setLieux(String lieux) {
		this.lieux = lieux;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	

}
