package org.mlearning.dto.contenu;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.persistence.Column;
import javax.persistence.JoinColumn;

import org.mlearning.dto.users.Apprenant;

@Entity
public class Groupe implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String nom;
	private Date datecreation;
	
	
	@ManyToMany(mappedBy="groupe")
	private List<Formation> formation;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="groupe_apprenant",
				joinColumns = {@JoinColumn(name="groupe_id")},
				inverseJoinColumns = { @JoinColumn(name = "apprenant_id") })
	private List<Apprenant> apprenant;

	public int getId() {
		return id;
	}

	public List<Formation> getFormation() {
		return formation;
	}

	public void setFormation(List<Formation> formation) {
		this.formation = formation;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public List<Apprenant> getApprenant() {
		return apprenant;
	}

	public void setApprenant(List<Apprenant> apprenant) {
		this.apprenant = apprenant;
	}

	public Date getDatecreation() {
		return datecreation;
	}

	public void setDatecreation(Date datecreation) {
		this.datecreation = datecreation;
	}
	
	
}
