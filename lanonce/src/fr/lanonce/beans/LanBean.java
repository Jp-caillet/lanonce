package fr.lanonce.beans;

import java.sql.Date;

public class LanBean {
	private String picture;
	private String title;
	private Date date;
	private String lieux;
	private String description;
	private String idUser;
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLieux() {
		return lieux;
	}
	public void setLieux(String lieux) {
		this.lieux = lieux;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
}
