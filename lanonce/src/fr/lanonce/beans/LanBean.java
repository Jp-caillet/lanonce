package fr.lanonce.beans;

import java.sql.Date;

public class LanBean {
	private String picture;
	private String nameLan;
	private Date date;
	private String lieux;
	private String invite;
	private String visibleAdresse;
	private String description;
	private String info;
	private String idUser;
	
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
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
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public String getNameLan() {
		return nameLan;
	}
	public void setNameLan(String nameLan) {
		this.nameLan = nameLan;
	}
	public String getInvite() {
		return invite;
	}
	public void setInvite(String invite) {
		this.invite = invite;
	}
	public String getVisibleAdresse() {
		return visibleAdresse;
	}
	public void setVisibleAdresse(String visibleAdresse) {
		this.visibleAdresse = visibleAdresse;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
