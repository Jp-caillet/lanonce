package fr.lanonce.beans;

import java.sql.Date;

public class TournoisBean {
	private String picture;
	private String nameTournois;
	private String lieux;
	private Date date;
	private String description;
	private String info;
	private String id_user;
	private int priv_checked;
	private String typeTournois;
	private String status;
	private int pay;
	private int nombreUser;
	private String id_url;
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getNameTournois() {
		return nameTournois;
	}
	public void setNameTournois(String nameTournois) {
		this.nameTournois = nameTournois;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getId_user() {
		return id_user;
	}
	public void setId_user(String id_user) {
		this.id_user = id_user;
	}

	public String getTypeTournois() {
		return typeTournois;
	}
	public void setTypeTournois(String typeTournois) {
		this.typeTournois = typeTournois;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNombreUser() {
		return nombreUser;
	}
	public void setNombreUser(int nombreUser) {
		this.nombreUser = nombreUser;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getPriv_checked() {
		return priv_checked;
	}
	public void setPriv_checked(int priv_checked) {
		this.priv_checked = priv_checked;
	}
	public String getId_url() {
		return id_url;
	}
	public void setId_url(String id_url) {
		this.id_url = id_url;
	}
}
