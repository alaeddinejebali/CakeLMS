package org.mlearning.business.Administrateur;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.mlearning.dto.contenu.Groupe;
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;

/**
 * Servlet implementation class AssignerApprenantsGroupeServlet
 */
@WebServlet("/AssignerApprenantsFormationServlet")
public class AssignerApprenantsFormationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignerApprenantsFormationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	private static SessionFactory configureSessionFactory() throws HibernateException {
	    Configuration configuration = new Configuration();
	    configuration.configure();
	    serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
	    sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	    return sessionFactory;
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
			
			//GET LISTE DES FORMATION
			String Req = "FROM Formation";
			Query q = session.createQuery(Req);
			List<Formation> listeDesformations = (List<Formation>) q.list();
			request.setAttribute("listeDesFormations", listeDesformations);
				
			//GET LISTE DES CATEGORIES
			Req = "FROM Apprenant";
			q = session.createQuery(Req);
			List<Apprenant> listeDesApprenants = (List<Apprenant>) q.list();
			request.setAttribute("listeDesApprenants", listeDesApprenants);
			
			request.getRequestDispatcher("Administrateur/assignerApprenantsFormation.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		String idFormation = request.getParameter("formation");
		String idApprenants = request.getParameter("apprenants");
		int id = Integer.parseInt(idFormation);
		//GET THE REQUESTED GROUPE OBJECT
		Formation f = (Formation)session.get(Formation.class, id);

		//GET APPRENANTS OBJECTS
		List<Apprenant> listeDesApprenants = new ArrayList<Apprenant>();
		String[] tabApprenantsId = idApprenants.split(",");
		for(int i=0 ; i<tabApprenantsId.length; i++){
			int idApprenant = Integer.parseInt(tabApprenantsId[i]);
			Apprenant a = (Apprenant)session.get(Apprenant.class, idApprenant);
			listeDesApprenants.add(a);
		}	
		f.setApprenant(listeDesApprenants);
		
		//UPDATE DATABASE
		session.saveOrUpdate(f);
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("DetailsFormationServlet?id=" + idFormation );
	}

}
