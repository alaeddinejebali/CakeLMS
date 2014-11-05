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

/**
 * Servlet implementation class AssignerCategoriesServlet
 */
@WebServlet("/AssignerCategoriesServlet")
public class AssignerCategoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignerCategoriesServlet() {
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
			
			//GET LISTE DES FORMATIONS
			String Req = "FROM Formation";
			Query q = session.createQuery(Req);
			List<Formation> listeDesFormations = (List<Formation>) q.list();
			request.setAttribute("listeDesFormations", listeDesFormations);
				
			//GET LISTE DES CATEGORIES
			Req = "FROM Categorie WHERE parent=0";
			q = session.createQuery(Req);
			List<Categorie> listeDesCategories = (List<Categorie>) q.list();
			request.setAttribute("listeDesCategories", listeDesCategories);
			
			request.getRequestDispatcher("Administrateur/assignerCategories.jsp").forward(request, response);
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
		String idCategories = request.getParameter("categories");
		int id = Integer.parseInt(idFormation);
		
		//GET THE REQUESTED FORMATION OBJECT
		Formation f = (Formation)session.get(Formation.class, id);

		//GET CATEGORIES OBJECTS
		List<Categorie> listeDesCategorie = new ArrayList<Categorie>();
		String[] tabCategoriesId = idCategories.split(",");
		for(int i=0 ; i<tabCategoriesId.length; i++){
			int idCategory = Integer.parseInt(tabCategoriesId[i]);
			Categorie c = (Categorie)session.get(Categorie.class, idCategory);
			listeDesCategorie.add(c);
		}	
		f.setCategorie(listeDesCategorie);
		
		//UPDATE DATABASE
		session.saveOrUpdate(f);
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("DetailsFormationServlet?id=" + idFormation);
	}

}
