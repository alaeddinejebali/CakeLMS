package org.mlearning.business.Administrateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
import org.mlearning.dto.contenu.Groupe;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class AjouterFormationServlet
 */
@WebServlet("/AjouterGroupeServlet")
public class AjouterGroupeServlet extends HttpServlet {
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
    public AjouterGroupeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("loggedUser")==null ) response.sendRedirect("InscriptionServlet?code=-1");
		else{		
			request.getRequestDispatcher("Administrateur/ajouterGroupe.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out = response.getWriter();
		String nom = request.getParameter("nom");
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		java.util.Date datecreation = new java.util.Date();
		try{datecreation = ft.parse(datecreation.toString());} catch (ParseException e) {}
		
		Groupe g = new Groupe();
		g.setNom(nom);
		g.setDatecreation(datecreation);
		
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		session.save(g);
		
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("GroupeServlet?code=1");
		
	}

}
