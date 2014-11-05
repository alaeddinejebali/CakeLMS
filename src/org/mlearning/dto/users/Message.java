package org.mlearning.dto.users;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Message implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String sujet;
	private String contenu;
	private Date datecreation;
	private boolean lu;
	private int expediteurid;
	private String expediteurnom;
	@ManyToOne
	@JoinColumn(name="recepteur")
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSujet() {
		return sujet;
	}

	public void setSujet(String sujet) {
		this.sujet = sujet;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public Date getDatecreation() {
		return datecreation;
	}

	public void setDatecreation(Date datecreation) {
		this.datecreation = datecreation;
	}

	public boolean isLu() {
		return lu;
	}

	public void setLu(boolean lu) {
		this.lu = lu;
	}

	public int getExpediteur() {
		return expediteurid;
	}

	public void setExpediteur(int expediteurid) {
		this.expediteurid = expediteurid;
	}

	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public String getExpediteurnom() {
		return expediteurnom;
	}

	public void setExpediteurnom(String expediteurnom) {
		this.expediteurnom = expediteurnom;
	}
	
}
