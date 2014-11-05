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
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class CategorieServlet
 */
@WebServlet("/ModuleServlet")
public class ModuleServlet extends HttpServlet {
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
    public ModuleServlet() {
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
			
			String vCategorie = request.getParameter("categorie");
			List<Module> listeDesModules = new ArrayList<Module>();
	
			if( vCategorie == null ){
				//AFFICHER LA LISTE DES TOUS MODULES
				String Req = "FROM Module";
				Query q = session.createQuery(Req);
				listeDesModules = (List<Module>) q.list();
			}	
			else{
				//AFFICHER LES MODULES DU CATEGORIE DEMANDEE
				int id = Integer.parseInt(request.getParameter("categorie"));
				Categorie c = (Categorie)session.get(Categorie.class, id);
				listeDesModules = c.getModule();
			}
			request.setAttribute("listeDesModules", listeDesModules);
	
			request.getRequestDispatcher("Administrateur/modules.jsp?code="+request.getParameter("code")).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
