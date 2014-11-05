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
import org.mlearning.dto.contenu.Groupe;
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.contenu.Formation;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class CategorieServlet
 */
@WebServlet("/GroupeServlet")
public class GroupeServlet extends HttpServlet {
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
    public GroupeServlet() {
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
			
			String vGroupe = request.getParameter("groupe");
			List<Groupe> listeDesGroupes = new ArrayList<Groupe>();
	
			if( vGroupe == null ){
				//AFFICHER LA LISTE DES TOUS LES GROUPES
				String Req = "FROM Groupe";
				Query q = session.createQuery(Req);
				listeDesGroupes = (List<Groupe>) q.list();
				request.setAttribute("listeDesGroupes", listeDesGroupes);
				request.getRequestDispatcher("Administrateur/groupes.jsp?code="+request.getParameter("code")).forward(request, response);
			}	
			else{
				//AFFICHER LES APPRENANTS DU GROUPE DEMANDE
				int idGroupe = Integer.parseInt( request.getParameter("groupe") );
				Groupe g = (Groupe)session.get(Groupe.class, idGroupe);
				List<Apprenant> listeDesApprenants = g.getApprenant();
				request.setAttribute("listeDesApprenants", listeDesApprenants);
				request.getRequestDispatcher("Administrateur/apprenants.jsp?code=" + request.getParameter("code") + "&groupeName=" + g.getNom() ).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
