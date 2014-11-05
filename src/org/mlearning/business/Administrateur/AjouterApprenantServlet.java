package org.mlearning.business.Administrateur;

import java.awt.image.BufferedImage;
import java.io.IOException;

import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.io.*;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.mlearning.dto.contenu.Categorie;
import org.mlearning.dto.contenu.Module;
import org.mlearning.dto.contenu.Formation;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

/**
 * Servlet implementation class AjouterApprenantServlet
 */
@WebServlet("/AjouterApprenantServlet")
public class AjouterApprenantServlet extends HttpServlet {
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
    public AjouterApprenantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("loggedUser")==null ) response.sendRedirect("InscriptionServlet?code=-1");
		else{		
			request.getRequestDispatcher("Administrateur/ajouterApprenant.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		PrintWriter out = response.getWriter();
		String nom="", login="", password="", identifiant="", vNaissance="", natureidentifiant="", email="", phone="", pays="", ville="", adresse="";
		//DATE DE NAISSANCE
		java.util.Date dt = new java.util.Date();
		int timestamp = -1 * (int) (long) dt.getTime();
		
		String fileName =  "";
		File file ;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		String filePath = User.myLocalPath + "photos\\";

		// Verify the content type
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)){
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// maximum size that will be stored in memory
			factory.setSizeThreshold(maxMemSize);
			// Location to save data that is larger than maxMemSize.

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// maximum file size to be uploaded.
			upload.setSizeMax( maxFileSize );
			try{
				boolean pass = false;
				// Parse the request to get file items.
				List fileItems = upload.parseRequest(request);
				// Process the uploaded file items
				Iterator i = fileItems.iterator();
				while ( i.hasNext () ) {
					FileItem fi = (FileItem)i.next();
					if ( !fi.isFormField () ){
						// Get the uploaded file parameters
						String fieldName = fi.getFieldName();
						fileName = Integer.toString(timestamp) + "__" + fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// Write the file
						if( fileName.lastIndexOf("\\") >= 0 ){
							file = new File( filePath + 
							fileName.substring( fileName.lastIndexOf("\\"))) ;
						}
						else{
							file = new File( filePath + 
							fileName.substring(fileName.lastIndexOf("\\")+1)) ;
						}
						fi.write( file ) ;
						pass = true;
						out.println("Uploaded Filename: " + filePath + fileName + "<br>");
						//session.save(u);
					}
					else{
						//GET OTHER FORM PARAMETER
						String name = fi.getFieldName();
						String value = fi.getString();
						if(name.equals("nom")) nom = value;
						else if(name.equals("prenom")) nom += " " + value;
						else if(name.equals("login")) login = value;
						else if(name.equals("password")) password = value;
						else if(name.equals("identifiant")) identifiant = value;
						else if(name.equals("natureidentifiant")) natureidentifiant = value;
						else if(name.equals("email")) email = value;
						else if(name.equals("naissance")) vNaissance = value;
						else if(name.equals("phone")) phone = value;
						else if(name.equals("pays")) pays = value;
						else if(name.equals("ville")) ville = value;
						else if(name.equals("adresse")) adresse = value;
					}
					if(pass){
						//DATE DE NAISSANCE
						String[] tabNaissance= vNaissance.split("/");
						String strNaissance = tabNaissance[2] + "-" + tabNaissance[0] + "-" + tabNaissance[1];
						SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
						java.util.Date naissance = null;
						try{naissance = ft.parse(strNaissance);} catch (ParseException e) {}
						//DATE D'INSCRIPTION
						java.util.Date dateinscription = new java.util.Date();
						try{dateinscription = ft.parse(dateinscription.toString());} catch (ParseException e) {}
						
						Apprenant a = new Apprenant();
						a.setNom(nom);
						a.setLogin(login);
						a.setPassword( User.md5(password) );
						a.setIdentifiantunique(identifiant);
						a.setNatureidentifiant(natureidentifiant);
						a.setEmail(email);
						a.setPhone(phone);
						a.setPays(pays);
						a.setVille(ville);
						a.setAdresse(adresse);
						a.setNaissance(naissance);
						a.setDateinscription(dateinscription);
						a.setPhoto(fileName);
						a.setIsactive(false);						
						
						session.saveOrUpdate(a);
						session.getTransaction().commit();
						response.sendRedirect("ApprenantsServlet?code=1");
					}	
				}
				}catch(Exception ex) {
					out.println(ex);
			}
		}
		else{
			out.println("No file uploaded");
		}
		
		
		session.close();

	}

}
