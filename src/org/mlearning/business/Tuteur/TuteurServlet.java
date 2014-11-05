package org.mlearning.business.Tuteur;

import java.io.IOException;
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
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;

/**
 * Servlet implementation class TuteurServlet
 */
@WebServlet("/TuteurServlet")
public class TuteurServlet extends HttpServlet {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("loggedUser")==null ) response.sendRedirect("InscriptionServlet?code=-1");
		else{
			SessionFactory sessionFoctory = configureSessionFactory();
			Session session = sessionFoctory.openSession();
			session.beginTransaction();
			
			//GET TOUTES LES FORMATIONS
			String Req = "FROM Formation";
			Query q = session.createQuery(Req);
			List<Formation> listeDesFormations = (List<Formation>) q.list();
			request.setAttribute("listeDesFormations", listeDesFormations);

			/*
			List<Formation> listeDesFormations = new ArrayList<Formation>();
			List<Module> mesModules = new ArrayList<Module>();
			String Req = "FROM Formation";
			Query q = session.createQuery(Req);
			List<Formation> toutesLesFormations = (List<Formation>) q.list();
			for(Formation uneFormation: toutesLesFormations){
				int contientUnModuleAffectePourCeTuteur = 0;
				List<Categorie> allCategories = uneFormation.getCategorie();
				for(Categorie uneCategorie: allCategories){
					List<Module> categorie_modules = uneCategorie.getModule();
					for(Module m: categorie_modules){
						mesModules.add(m);
					}
				}	
			}
			request.setAttribute("listeDesFormations", listeDesFormations);
			*/
	
			request.getRequestDispatcher("Tuteur/index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
