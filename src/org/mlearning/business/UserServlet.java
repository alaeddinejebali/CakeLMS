package org.mlearning.business;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import javax.servlet.RequestDispatcher;
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
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.Tuteur;
import org.mlearning.dto.users.User;


/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
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
	
    
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getParameter("logout").equals("1") ){
			request.getSession().removeAttribute("loggedUser");
		}
		response.sendRedirect("index.jsp?code=null");
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = User.md5( request.getParameter("password") );
		String Req;
		Query q;
		
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		
		Req = "FROM Apprenant WHERE login='" + login + "' AND password='" + password + "'";
		q = session.createQuery(Req);
		Apprenant a = (Apprenant) q.uniqueResult();

		if(a != null){
			request.getSession().setAttribute("loggedUser", a);
			response.sendRedirect("ApprenantServlet");
		}
		else{
			Req = "FROM Tuteur WHERE login='" + login + "' AND password='" + password + "'";
			q = session.createQuery(Req);
			Tuteur t = (Tuteur) q.uniqueResult();		
			if(t != null){
				request.getSession().setAttribute("loggedUser", t);
				response.sendRedirect("TuteurServlet");
			}
			else{
				Req = "FROM User WHERE login='" + login + "' AND password='" + password + "'";
				q = session.createQuery(Req);
				User u = (User) q.uniqueResult();		
				if(u != null){
					request.getSession().setAttribute("loggedUser", u);
					response.sendRedirect("AdministrateurServlet");
				}
				else{
					response.sendRedirect("index.jsp?code=1");
				}				
			}
		}

	}
}
