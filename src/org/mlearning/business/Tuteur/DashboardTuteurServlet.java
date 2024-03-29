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
import org.mlearning.dto.contenu.Groupe;
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;

/**
 * Servlet implementation class DashboardTuteurServlet
 */
@WebServlet("/DashboardTuteurServlet")
public class DashboardTuteurServlet extends HttpServlet {
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
			
			//GET LA FORMATION DEMANDEE
			Formation f;
			String vFormation = request.getParameter("f");
			if( (vFormation != null) && (!vFormation.equals("null")) ){
				f = (Formation)session.get(Formation.class, Integer.parseInt(vFormation));
				request.getSession().setAttribute("idFormation", vFormation);
			}
			else{
				vFormation = (String) request.getSession().getAttribute("idFormation");
				f = (Formation)session.get(Formation.class, Integer.parseInt(vFormation));
			}

			//GET TOUS LES MODULES DU TUTEUR EN COURS
			List<Categorie> allCategories = f.getCategorie();
			List<Module> mesModules = new ArrayList<Module>();
			for(Categorie oneCategorie: allCategories){
				List<Module> categorie_modules = oneCategorie.getModule();
				for(Module m: categorie_modules){
					mesModules.add(m);
				}
			}
			request.getSession().setAttribute("mesModules", mesModules);
			
			//GET TOUS LES APPRENANTS ETGROUPES DE CETTE FORMATION
			List<Apprenant> listeDesApprenants = f.getApprenant();
			request.setAttribute("listeDesApprenants", listeDesApprenants);
			List<Groupe> listeDesGroupes = f.getGroupe();
			request.setAttribute("listeDesGroupes", listeDesGroupes);
			request.setAttribute("nomFormation", f.getNom());
			
			
			//AFFICHER LE DASHBOARD DU TUTEUR
			request.getRequestDispatcher("Tuteur/dashboard.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
