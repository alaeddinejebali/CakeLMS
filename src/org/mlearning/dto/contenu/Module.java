package org.mlearning.dto.contenu;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.mlearning.dto.users.Tuteur;

@Entity
public class Module implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String nom;
	private String description;
	private String excerpt;
	
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
	
	@ManyToMany(mappedBy="module")
	private List<Categorie> categorie;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="module_tuteur",
				joinColumns = {@JoinColumn(name="module_id")},
				inverseJoinColumns = { @JoinColumn(name = "tuteur_id") })
	private List<Tuteur> tuteur;
	
	public List<Categorie> getCategorie() {
		return categorie;
	}
	public void setCategorie(List<Categorie> categorie) {
		this.categorie = categorie;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExcerpt() {
		return excerpt;
	}
	public void setExcerpt(String excerpt) {
		this.excerpt = excerpt;
	}


	private static SessionFactory configureSessionFactory() throws HibernateException {
	    Configuration configuration = new Configuration();
	    configuration.configure();
	    serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	    return sessionFactory;
	}
	public List<Tuteur> getTuteur() {
		return tuteur;
	}
	public void setTuteur(List<Tuteur> tuteur) {
		this.tuteur = tuteur;
	} 
}
