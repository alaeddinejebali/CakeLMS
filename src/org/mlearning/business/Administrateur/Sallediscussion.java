package org.mlearning.business.Administrateur;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class Sallediscussion
 */
@WebServlet("/Sallediscussion")
public class Sallediscussion extends HttpServlet {
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
    public Sallediscussion() {
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

			//TOUTES LES SALLES
			String Req = "FROM Sallediscussion";
			Query q = session.createQuery(Req);
			List<Sallediscussion> listeDesSalles = (List<Sallediscussion>) q.list();
			request.setAttribute("listeDesSalles", listeDesSalles);
			
			//LES SALLES ACTIVES
			String Req_actives = "FROM Sallediscussion WHERE now() between debut AND fin";
			Query q_actives = session.createQuery(Req_actives);
			List<Sallediscussion> listeDesSallesActives = (List<Sallediscussion>) q_actives.list();
			request.setAttribute("listeDesSallesActives", listeDesSallesActives);
			
			//LES SALLES FINIS
			String Req_finis = "FROM Sallediscussion WHERE now() > fin";
			Query q_finis = session.createQuery(Req_finis);
			List<Sallediscussion> listeDesSallesFinis = (List<Sallediscussion>) q_finis.list();
			request.setAttribute("listeDesSallesFinis", listeDesSallesFinis);
			
			//LES SALLES NON COMMENCEES
			String Req_noncommences = "FROM Sallediscussion WHERE now() < debut";
			Query q_noncommences = session.createQuery(Req_noncommences);
			List<Sallediscussion> listeDesSallesNoncommences = (List<Sallediscussion>) q_noncommences.list();
			request.setAttribute("listeDesSallesNoncommences", listeDesSallesNoncommences);
			
			request.getRequestDispatcher("Administrateur/sallediscussion.jsp?code="+request.getParameter("code")).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
