package org.mlearning.business.Administrateur;

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
import org.mlearning.dto.contenu.Categorie;
import org.mlearning.dto.contenu.Formation;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class AjouterCategorieServlet
 */
@WebServlet("/AjouterCategorieServlet")
public class AjouterCategorieServlet extends HttpServlet {
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
    public AjouterCategorieServlet() {
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
			
		//GET LISTE DES CATEGORIES
		String Req = "FROM Categorie WHERE parent=0";
		Query q = session.createQuery(Req);
		List<Categorie> listeDesCategories = (List<Categorie>) q.list();
		request.setAttribute("listeDesCategories", listeDesCategories);
		
		request.getRequestDispatcher("Administrateur/ajouterCategorie.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String description = request.getParameter("description");
		String excerpt = request.getParameter("excerpt");
		int parent = Integer.parseInt( request.getParameter("parent") );
		
		Categorie c = new Categorie();
		c.setNom(nom);
		c.setDescription(description);
		c.setExcerpt(excerpt);
		c.setParent(parent);

		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		session.save(c);
		
		session.getTransaction().commit();
		session.close();
		
		response.sendRedirect("CategorieServlet?code=1");
	}

}
