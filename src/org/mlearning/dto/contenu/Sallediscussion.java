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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.Column;
import javax.persistence.JoinColumn;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistryBuilder;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;

@Entity
public class Sallediscussion{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String nom;
	private String description;
	@Temporal(TemporalType.TIMESTAMP)
	private Date debut;
	@Temporal(TemporalType.TIMESTAMP)
	private Date fin;
	
	@ManyToOne
	@JoinColumn(name="formation_id")
	private Formation formation;
	
	@ManyToOne
	@JoinColumn(name="tuteur_id")
	private Tuteur tuteur;	

	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="sallediscussion_apprenant",
				joinColumns = {@JoinColumn(name="sallediscussion_id")},
				inverseJoinColumns = { @JoinColumn(name = "apprenant_id") })
	private List<Apprenant> apprenant;

	public int getId() {
		return id;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDebut() {
		return debut;
	}
	public void setDebut(Date debut) {
		this.debut = debut;
	}
	public Date getFin() {
		return fin;
	}
	public void setFin(Date fin) {
		this.fin = fin;
	}
	public Formation getFormation() {
		return formation;
	}
	public void setFormation(Formation formation) {
		this.formation = formation;
	}
	public Tuteur getTuteur() {
		return tuteur;
	}
	public void setTuteur(Tuteur tuteur) {
		this.tuteur = tuteur;
	}
	public List<Apprenant> getApprenant() {
		return apprenant;
	}
	public void setApprenant(List<Apprenant> apprenant) {
		this.apprenant = apprenant;
	}
}
