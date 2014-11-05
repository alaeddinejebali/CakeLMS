package org.mlearning.business.Administrateur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.mlearning.dto.contenu.Categorie;
import org.mlearning.dto.users.Message;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class EnvoyerMessageServlet
 */
@WebServlet("/EnvoyerMessageServlet")
public class EnvoyerMessageServlet extends HttpServlet {
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
    public EnvoyerMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("loggedUser")==null ) response.sendRedirect("InscriptionServlet?code=-1");
		else{		
			request.getRequestDispatcher("Administrateur/envoyerMessage.jsp?code=" + request.getParameter("code") + "&groupe=" + request.getParameter("groupe") + "&groupeName=" + request.getParameter("groupeName") + "&user=" + request.getParameter("user") + "&userName=" + request.getParameter("userName")).forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		User loggedUser = (User) request.getSession().getAttribute("loggedUser");
		User u = (User) session.get(User.class, Integer.parseInt(request.getParameter("user")));
		Message m = new Message();
		m.setSujet( request.getParameter("sujet") );
		m.setContenu( request.getParameter("message") );
		m.setUser(u);
		m.setLu(false);
		m.setExpediteur( loggedUser.getId() );
		m.setExpediteurnom( loggedUser.getNom() );
		m.setDatecreation( new java.util.Date() );

		session.save(m);
		session.getTransaction().commit();
		session.close();
		
		request.getRequestDispatcher("Administrateur/envoyerMessage.jsp?code=1&groupe=" + request.getParameter("groupe") + "&groupeName=" + request.getParameter("groupeName") + "&user=" + request.getParameter("user") + "&userName=" + request.getParameter("userName")).forward(request, response);
	}

}
