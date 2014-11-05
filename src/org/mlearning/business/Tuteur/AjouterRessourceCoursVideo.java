package org.mlearning.business.Tuteur;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.mlearning.dto.contenu.Cours;
import org.mlearning.dto.users.Apprenant;
import org.mlearning.dto.users.User;

/**
 * Servlet implementation class AjouterRessourceCoursVideo
 */
@WebServlet("/AjouterRessourceCoursVideo")
public class AjouterRessourceCoursVideo extends HttpServlet {
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
    public AjouterRessourceCoursVideo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Tuteur/ajouterRessourceCoursVideo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory sessionFoctory = configureSessionFactory();
		Session session = sessionFoctory.openSession();
		session.beginTransaction();
		
		PrintWriter out = response.getWriter();
		String titre="", description="", excerpt="", contenu="", url="";
		int tempsRequis = 0;
		//DATE DE NAISSANCE
		java.util.Date dt = new java.util.Date();
		int timestamp = -1 * (int) (long) dt.getTime();
		
		String fileName =  "";
		File file ;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		String filePath = User.myLocalPath + "thumbnail/";

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
						if(name.equals("titre")) titre = value;
						else if(name.equals("description")) description = value;
						else if(name.equals("excerpt")) excerpt = value;
						else if(name.equals("contenu")) contenu = value;
						else if(name.equals("tempsRequis")){
							String[] vTab = value.split(":");
							String vHeures = vTab[0];
							String vMinutes = vTab[1];
							String vSecondes = vTab[2];
							tempsRequis = (Integer.parseInt(vHeures)*3600) + (Integer.parseInt(vMinutes)*60) + Integer.parseInt(vSecondes);							
						}
						else if(name.equals("url")) url = value;
					}
					if(pass){
						Cours c = new Cours();
						c.setTitre(titre);
						c.setDescription(description);
						c.setExcerpt(excerpt);
						c.setContenu(contenu);
						c.setTempsRequis(tempsRequis);
						c.setThumbnail(fileName);
						c.setType(2);
						c.setUrl(url);
						
						session.saveOrUpdate(c);
						session.getTransaction().commit();
						//response.sendRedirect("ApprenantsServlet?code=1");
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
