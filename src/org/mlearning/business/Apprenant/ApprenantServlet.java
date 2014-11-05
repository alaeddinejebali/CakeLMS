package org.mlearning.business.Apprenant;

import java.io.IOException;
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
import org.mlearning.dto.contenu.Formation;

/**
 * Servlet implementation class ApprenantServlet
 */
@WebServlet("/ApprenantServlet")
public class ApprenantServlet extends HttpServlet {
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
	
    public ApprenantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


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
	
			request.getRequestDispatcher("Apprenant/index.jsp").forward(request, response);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
