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
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class AjouterFormationServlet
 */
@WebServlet("/AjouterFormationServlet")
public class AjouterFormationServlet extends HttpServlet {
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
    public AjouterFormationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("loggedUser")==null ) response.sendRedirect("InscriptionServlet?code=-1");
		else{		
			request.getRequestDispatcher("Administrateur/ajouterFormation.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out = response.getWriter();
		String nom = request.getParameter("nom");
		String description = request.getParameter("description");
		int client = Integer.parseInt( request.getParameter("client") );
		
		//DEBUT DE LA FORMATION
		String vDebut = request.getParameter("debut");
		String[] tabDebut = vDebut.split("/");
		String strDebut = tabDebut[2] + "-" + tabDebut[0] + "-" + tabDebut[1];
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		java.util.Date debut = null;
		try{debut = ft.parse(strDebut);} catch (ParseException e) {}
		
		//FIN DE LA FORMATION
		String vFin = request.getParameter("fin");
		String[] tabFin = vFin.split("/");
		String strFin = tabFin[2] + "-" + tabFin[0] + "-" + tabFin[1];
		java.util.Date fin = null;
		try{fin = ft.parse(strFin);} catch (ParseException e) {}
		
		Formation f = new Formation();
		f.setNom(nom);
		f.setClient(client);
		f.setDebut(debut);
		f.setFin(fin);
		f.setDescription(description);
		f.setDatecreation( new java.util.Date() );

		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		session.save(f);
		
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("AdministrateurServlet?code=1");
		
	}

}
