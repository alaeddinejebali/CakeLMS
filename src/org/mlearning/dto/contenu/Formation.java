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
public class Formation implements java.io.Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String nom;
	private int client;
	private Date debut;
	private Date fin;
	private String description;
	private Date datecreation;
	
	@Transient
	private float progress;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="formation_categorie",
				joinColumns = {@JoinColumn(name="formation_id")},
				inverseJoinColumns = { @JoinColumn(name = "categorie_id") })
	private List<Categorie> categorie;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="formation_apprenant",
				joinColumns = {@JoinColumn(name="formation_id")},
				inverseJoinColumns = { @JoinColumn(name = "apprenant_id") })
	private List<Apprenant> apprenant;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="formation_groupe",
				joinColumns = {@JoinColumn(name="formation_id")},
				inverseJoinColumns = { @JoinColumn(name = "groupe_id") })
	private List<Groupe> groupe;
	
	@OneToMany(mappedBy="formation")	
	private List<Sallediscussion> sallediscussion;
	

	public List<Sallediscussion> getSallediscussion() {
		return sallediscussion;
	}
	public void setSallediscussion(List<Sallediscussion> sallediscussion) {
		this.sallediscussion = sallediscussion;
	}
	public List<Groupe> getGroupe() {
		return groupe;
	}
	public void setGroupe(List<Groupe> groupe) {
		this.groupe = groupe;
	}
	public List<Apprenant> getApprenant() {
		return apprenant;
	}
	public void setApprenant(List<Apprenant> apprenant) {
		this.apprenant = apprenant;
	}
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
	public int getClient() {
		return client;
	}
	public void setClient(int client) {
		this.client = client;
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
	public String getDescription(){
		return this.description;
	}
	public void setDescription(String description){
		this.description = description;
	}	
	public List<Categorie> getCategorie() {
		return categorie;
	}
	public void setCategorie(List<Categorie> categorie) {
		this.categorie = categorie;
	}
	public float getProgress() {
		Date today = new Date();
		if(this.debut.after(today)) setProgress(0);
		else if( this.fin.before(today) ) setProgress(100);
		else{
			long vDebut = this.debut.getTime();
			long vFin = this.fin.getTime();
			long vToday = today.getTime();
			float lengthPeriode = vFin - vDebut;
			float posToday = vToday - vDebut;
			float p = ( ( posToday*100 ) / lengthPeriode );
			setProgress(p);			
		}
		return this.progress;
	}
	public void setProgress(float progress) {
		this.progress = progress;
	}
	public void getListCategories(){
		List<Categorie> mesCategories = this.getCategorie();
		for (Categorie oneCategory : mesCategories) {
			//System.out.println("\n*********************************** -> " + oneCategory.getNom());
		}
	}
	public Date getDatecreation() {
		return datecreation;
	}
	public void setDatecreation(Date datecreation) {
		this.datecreation = datecreation;
	}
	
	


	
	

	
	
}
