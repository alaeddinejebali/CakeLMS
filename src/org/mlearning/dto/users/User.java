package org.mlearning.dto.users;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.OneToMany;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="discriminator", discriminatorType=DiscriminatorType.STRING)
@DiscriminatorValue(value="U")
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String nom;
	private String login;
	private String password;
	private String identifiantunique;
	private String natureidentifiant;
	private String email;
	private Date naissance;
	private String phone;
	private String pays;
	private String ville;
	@OneToMany(mappedBy="user")
	private List<Message> message;
	//public static String myLocalPath = "/media/ajebali/Data/Dhekra/PFE m-learning/WebContent/assets/"; //Linux
	public static String myLocalPath = "D:\\Personal\\PFE m-learning\\WebContent\\assets\\"; //Windows
	
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	private String adresse;
	private Date dateinscription;
	
	public Date getDateinscription() {
		return dateinscription;
	}
	public void setDateinscription(Date dateinscription) {
		this.dateinscription = dateinscription;
	}
	public String getIdentifiantunique() {
		return identifiantunique;
	}
	public void setIdentifiantunique(String identifiantunique) {
		this.identifiantunique = identifiantunique;
	}
	public String getNatureidentifiant() {
		return natureidentifiant;
	}
	public void setNatureidentifiant(String natureidentifiant) {
		this.natureidentifiant = natureidentifiant;
	}
	public Date getNaissance() {
		return naissance;
	}
	public void setNaissance(Date naissance) {
		this.naissance = naissance;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	private String photo;
	private boolean isactive;
	
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
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return adresse;
	}
	public boolean isIsactive() {
		return isactive;
	}
	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}
	public static String md5(String input) {
		String md5 = null;
		if(null == input) return null;
		try {
			//Créer l'objet MessageDigest pour MD5
			MessageDigest digest = MessageDigest.getInstance("MD5");
			//Mettre à jour le champs en digest
			digest.update(input.getBytes(), 0, input.length());
			//Convertir le message digest an base 16 (hex) 
			md5 = new BigInteger(1, digest.digest()).toString(16);
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return md5;
	}
	
	public List<Message> getMessage() {
		return message;
	}
	
	public void setMessage(List<Message> message) {
		this.message = message;
	}
	public List<Message> getMessageNonLus(){
		List<Message> Res = new ArrayList<Message>();
		List<Message> mesMessages = this.getMessage();
		for(Message m : mesMessages){
			if( !m.isLu() ) Res.add(m);
		}
		return Res;
	}
	
}
