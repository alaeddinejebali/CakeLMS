package org.mlearning.business.Administrateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.mlearning.dto.contenu.Categorie;
import org.mlearning.dto.contenu.Formation;
import org.mlearning.dto.contenu.Sallediscussion;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class AjouterSallediscussion
 */
@WebServlet("/AjouterSallediscussion")
public class AjouterSallediscussion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;

	private static SessionFactory configureSessionFactory() throws HibernateException {
	    Configuration configuration = new Configuration();
	    configuration.configure();
	    serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	    return sessionFactory;
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterSallediscussion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("loggedUser")==null ) response.sendRedirect("InscriptionServlet?code=-1");
		else{
			SessionFactory sessionFoctory = configureSessionFactory();
			Session session = sessionFoctory.openSession();
			session.beginTransaction();
			
			//GET LISTE DES FORMATIONS
			String Req = "FROM Formation";
			Query q = session.createQuery(Req);
			List<Formation> listeDesFormations = (List<Formation>) q.list();
			request.setAttribute("listeDesFormations", listeDesFormations);
				
			//GET LISTE DES TUTEURS
			Req = "FROM Tuteur";
			q = session.createQuery(Req);
			List<Tuteur> listeDesTuteurs = (List<Tuteur>) q.list();
			request.setAttribute("listeDesTuteurs", listeDesTuteurs);
			
			//GET LISTE DES CATEGORIES
			Req = "FROM Apprenant";
			q = session.createQuery(Req);
			List<Apprenant> listeDesApprenants = (List<Apprenant>) q.list();
			request.setAttribute("listeDesApprenants", listeDesApprenants);
			
			request.getRequestDispatcher("Administrateur/ajouterSallediscussion.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String nom = request.getParameter("nom");
		String description = request.getParameter("description");
		String idApprenants = request.getParameter("apprenants");
		String idTuteur = request.getParameter("tuteur");
		String idFormation = request.getParameter("formation");
		//DEBUT DE LA FORMATION
		String vDebut = request.getParameter("debut");
		String[] tabDebut = vDebut.split("/");
		String tempsDebut = request.getParameter("tempsDebut");
		String[] tabTempsDebut = tempsDebut.split(":");
		String strDebut = tabDebut[2] + "-" + tabDebut[0] + "-" + tabDebut[1] + " " + tabTempsDebut[0] + ":" + tabTempsDebut[1] + ":" + tabTempsDebut[2];
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		java.util.Date debut = null;
		try{debut = ft.parse(strDebut);} catch (ParseException e) {}
		//FIN DE LA FORMATION
		String vFin = request.getParameter("fin");
		String[] tabFin = vFin.split("/");
		String tempsFin = request.getParameter("tempsFin");
		String[] tabTempsFin = tempsFin.split(":");
		String strfin = tabFin[2] + "-" + tabFin[0] + "-" + tabFin[1] + " " + tabTempsFin[0] + ":" + tabTempsFin[1] + ":" + tabTempsFin[2];
		java.util.Date fin = null;
		try{fin = ft.parse(strfin);} catch (ParseException e) {}

		Sallediscussion s = new Sallediscussion();
		s.setNom(nom);
		s.setDescription(description);
		s.setDebut(debut);
		s.setFin(fin);
		
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		Formation f = (Formation)session.get(Formation.class, Integer.parseInt(idFormation));
		s.setFormation(f);
		Tuteur t = (Tuteur)session.get(Tuteur.class, Integer.parseInt(idTuteur));
		s.setTuteur(t);
		//LISTE DES APPRENANTS
		List<Apprenant> listeDesApprenants = new ArrayList<Apprenant>();
		String[] tabidApprenantsId = idApprenants.split(",");
		for(int i=0 ; i<tabidApprenantsId.length; i++){
			int idApprenant = Integer.parseInt(tabidApprenantsId[i]);
			Apprenant a = (Apprenant)session.get(Apprenant.class, idApprenant);
			listeDesApprenants.add(a);
		}
		s.setApprenant(listeDesApprenants);

		session.save(s);
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("Sallediscussion?code=1");
	}

}
