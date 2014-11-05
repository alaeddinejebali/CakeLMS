package org.mlearning.business.Administrateur;

import java.util.List;
import java.io.IOException;
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
import org.mlearning.dto.contenu.Formation;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class AdministrateurServlet
 */
@WebServlet("/AdministrateurServlet")
public class AdministrateurServlet extends HttpServlet {
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
    public AdministrateurServlet() {
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
			
			//GET TOUTES LES FORMATIONS
			String Req = "FROM Formation";
			Query q = session.createQuery(Req);
			List<Formation> listeDesFormations = (List<Formation>) q.list();
			request.setAttribute("listeDesFormations", listeDesFormations);
			
			//GET LES 5 DERNIERS APPRENANTS INSCRITS
			Req = "FROM Apprenant ORDER BY dateinscription";
			q = session.createQuery(Req).setMaxResults(5);
			List<Apprenant> listeDesDerniersApprenantsInscrits = (List<Apprenant>) q.list();
			request.setAttribute("listeDesDerniersApprenantsInscrits", listeDesDerniersApprenantsInscrits);
			
			//GET LES 5 DERNIERS TUTEURS INSCRITS
			Req = "FROM Tuteur ORDER BY dateinscription";
			q = session.createQuery(Req).setMaxResults(5);
			List<Tuteur> listeDesDerniersTuteursInscrits = (List<Tuteur>) q.list();
			request.setAttribute("listeDesDerniersTuteursInscrits", listeDesDerniersTuteursInscrits);		
	
			request.getRequestDispatcher("Administrateur/index.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
