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

@Entity
public class Categorie implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String nom;
	private String description;
	private String excerpt;
	private int parent;
	
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
	
	@ManyToMany(mappedBy="categorie")
	private List<Formation> formation;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(	name="categorie_module",
				joinColumns = {@JoinColumn(name="categorie_id")},
				inverseJoinColumns = { @JoinColumn(name = "module_id") })
	private List<Module> module;
	
	public List<Module> getModule() {
		return module;
	}
	public void setModule(List<Module> module) {
		this.module = module;
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
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
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
	public List<Formation> getFormation() {
		return formation;
	}
	public void setFormation(List<Formation> formation) {
		this.formation = formation;
	}

	private static SessionFactory configureSessionFactory() throws HibernateException {
	    Configuration configuration = new Configuration();
	    configuration.configure();
	    serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	    return sessionFactory;
	} 
	
	//GET LIST OF CHILDS
	public List<Categorie> getListChild(){
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		String Req = "FROM Categorie WHERE parent = " + this.getId();
		Query q = (Query) session.createQuery(Req);
		List<Categorie> listeDesCategories = (List<Categorie>) q.list();
		
		return listeDesCategories;
	}
}
