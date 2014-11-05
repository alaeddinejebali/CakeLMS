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
 * Servlet implementation class ApprenantsServlet
 */
@WebServlet("/ApprenantsServlet")
public class ApprenantsServlet extends HttpServlet {
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
    public ApprenantsServlet() {
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
			
			String vApprenant = request.getParameter("apprenant");
			String vActivate = request.getParameter("activate");
			if( (vApprenant != null) && (!vApprenant.equals("null")) ){
				Apprenant a = (Apprenant)session.get(Apprenant.class, Integer.parseInt(vApprenant));
				request.setAttribute("lApprenant", a);
				//AFFICHER DETAILS DE L'APPRENANT
				if( (vActivate != null) && (!vActivate.equals("null")) ){
					//ACTIVER/DESACTIVER APPRENANT
					boolean isactive =false;
					if (vActivate.equals("1")) isactive = true;
					a.setIsactive(isactive);
					session.saveOrUpdate(a);
					session.getTransaction().commit();
					session.close();
					request.getRequestDispatcher("Administrateur/detailsApprenant.jsp?apprenant="+vApprenant).forward(request, response);
				}
				else{
					request.getRequestDispatcher("Administrateur/detailsApprenant.jsp?code="+request.getParameter("code")).forward(request, response);
				}
			}
			else{
				//AFFICHET TOUS LES APPRENANTS
				String Req = "FROM Apprenant";
				Query q = session.createQuery(Req);
				List<Apprenant> listeDesApprenants = (List<Apprenant>) q.list();
				request.setAttribute("listeDesApprenants", listeDesApprenants);
				request.getRequestDispatcher("Administrateur/apprenants.jsp?code="+request.getParameter("code")).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
