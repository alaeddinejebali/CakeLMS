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
import org.mlearning.dto.users.Tuteur;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class ApprenantsServlet
 */
@WebServlet("/TuteursServlet")
public class TuteursServlet extends HttpServlet {
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
    public TuteursServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		String vTuteur = request.getParameter("tuteur");
		String vActivate = request.getParameter("activate");
		if( (vTuteur != null) && (!vTuteur.equals("null")) ){
			Tuteur t = (Tuteur)session.get(Tuteur.class, Integer.parseInt(vTuteur));
			request.setAttribute("leTuteur", t);
			//AFFICHER DETAILS DE L'APPRENANT
			if( (vActivate != null) && (!vActivate.equals("null")) ){
				//ACTIVER/DESACTIVER APPRENANT
				boolean isactive =false;
				if (vActivate.equals("1")) isactive = true;
				t.setIsactive(isactive);
				session.saveOrUpdate(t);
				session.getTransaction().commit();
				session.close();
				request.getRequestDispatcher("Administrateur/detailsTuteur.jsp?apprenant="+vTuteur).forward(request, response);
			}
			request.getRequestDispatcher("Administrateur/detailsTuteur.jsp?code="+request.getParameter("code")).forward(request, response);
		}
		else{
			//AFFICHET TOUS LES APPRENANTS
			String Req = "FROM Tuteur";
			Query q = session.createQuery(Req);
			List<Tuteur> listeDesTuteurs = (List<Tuteur>) q.list();
			request.setAttribute("listeDesTuteurs", listeDesTuteurs);
			request.getRequestDispatcher("Administrateur/tuteurs.jsp?code="+request.getParameter("code")).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
