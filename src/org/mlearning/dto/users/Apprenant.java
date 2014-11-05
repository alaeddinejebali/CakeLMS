package org.mlearning.dto.users;

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
import org.mlearning.dto.contenu.Categorie;
import org.mlearning.dto.contenu.Formation;
import org.mlearning.dto.contenu.Groupe;
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.contenu.Sallediscussion;

import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;

@Entity
@DiscriminatorValue("A")
public class Apprenant extends User implements java.io.Serializable {
	@ManyToMany(mappedBy="apprenant")
	private List<Formation> formation;

	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
	
	@ManyToMany(mappedBy="apprenant")
	private List<Groupe> groupe;
	
	@ManyToMany(mappedBy="apprenant")
	private List<Sallediscussion> sallediscussion;

	public List<Groupe> getGroupe() {
		return groupe;
	}

	public void setGroupe(List<Groupe> groupe) {
		this.groupe = groupe;
	}

	public List<Formation> getFormation() {
		return formation;
	}

	public void setFormation(List<Formation> formation) {
		this.formation = formation;
	}

	public List<Sallediscussion> getSallediscussion() {
		return sallediscussion;
	}

	public void setSallediscussion(List<Sallediscussion> sallediscussion) {
		this.sallediscussion = sallediscussion;
	}

	private static SessionFactory configureSessionFactory() throws HibernateException {
	    Configuration configuration = new Configuration();
	    configuration.configure();
	    serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	    return sessionFactory;
	} 
}
