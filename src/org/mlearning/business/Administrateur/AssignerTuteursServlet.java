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
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.users.Tuteur;

/**
 * Servlet implementation class AssignerCategoriesServlet
 */
@WebServlet("/AssignerTuteursServlet")
public class AssignerTuteursServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SessionFactory sessionFactory;
	private static ServiceRegistry serviceRegistry;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignerTuteursServlet() {
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
			
			//GET LISTE DES MODULES
			String Req = "FROM Module";
			Query q = session.createQuery(Req);
			List<Module> listeDesModules = (List<Module>) q.list();
			request.setAttribute("listeDesModules", listeDesModules);
				
			//GET LISTE DES CATEGORIES
			Req = "FROM Tuteur";
			q = session.createQuery(Req);
			List<Tuteur> listeDesTuteurs = (List<Tuteur>) q.list();
			request.setAttribute("listeDesTuteurs", listeDesTuteurs);
			
			request.getRequestDispatcher("Administrateur/assignerTuteurs.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		String idModule = request.getParameter("module");
		String idTuteurs = request.getParameter("tuteurs");
		int id = Integer.parseInt(idModule);
		
		//GET THE REQUESTED FORMATION OBJECT
		Module m = (Module)session.get(Module.class, id);

		//GET CATEGORIES OBJECTS
		List<Tuteur> listeDesTuteurs = new ArrayList<Tuteur>();
		String[] tabTuteursId = idTuteurs.split(",");
		for(int i=0 ; i<tabTuteursId.length; i++){
			int idTuteur = Integer.parseInt(tabTuteursId[i]);
			Tuteur t = (Tuteur)session.get(Tuteur.class, idTuteur);
			listeDesTuteurs.add(t);
		}	
		m.setTuteur(listeDesTuteurs);
		
		//UPDATE DATABASE
		session.saveOrUpdate(m);
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("ModuleServlet?id=" + idModule);
	}

}
