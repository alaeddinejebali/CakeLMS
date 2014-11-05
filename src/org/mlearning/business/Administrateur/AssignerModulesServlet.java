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
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.contenu.Formation;

/**
 * Servlet implementation class AssignerCategoriesServlet
 */
@WebServlet("/AssignerModulesServlet")
public class AssignerModulesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignerModulesServlet() {
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
			
			//GET LISTE DES CATEGORIES
			String Req = "FROM Categorie";
			Query q = session.createQuery(Req);
			List<Categorie> listeDesCategories = (List<Categorie>) q.list();
			request.setAttribute("listeDesCategories", listeDesCategories);
				
			//GET LISTE DES MODULES
			Req = "FROM Module";
			q = session.createQuery(Req);
			List<Module> listeDesModules = (List<Module>) q.list();
			request.setAttribute("listeDesModules", listeDesModules);
			
			request.getRequestDispatcher("Administrateur/assignerModules.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		String idCategorie = request.getParameter("categorie");
		String idModules = request.getParameter("modules");
		
		//GET THE REQUESTED CATEGORIE OBJECT
		Categorie c = (Categorie)session.get(Categorie.class, Integer.parseInt(idCategorie));

		//GET MODULES OBJECTS
		List<Module> listeDesModule = new ArrayList<Module>();
		String[] tabModulesId = idModules.split(",");
		for(int i=0 ; i<tabModulesId.length; i++){
			int idModule = Integer.parseInt(tabModulesId[i]);
			Module m = (Module)session.get(Module.class, idModule);
			listeDesModule.add(m);
		}	
		c.setModule(listeDesModule);
		
		//UPDATE DATABASE
		session.saveOrUpdate(c);
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("ModuleServlet?categorie=" + idCategorie + "&categorieName=" + c.getNom());
	}

}
