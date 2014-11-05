package org.mlearning.business;

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
@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
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
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		//File f = new File(User.myLocalPath + "/photos/" + request.getParameter("img")); //Linux
		File f = new File(User.myLocalPath + "\\photos\\" + request.getParameter("img")); //Windows
		BufferedImage bi = ImageIO.read(f);
		OutputStream out = response.getOutputStream();
		ImageIO.write(bi, "jpg", out);
		out.close();
		/******************************************************************************************************/
		/***************************************	UNE AUTRE METHODE	***************************************/
		/******************************************************************************************************/
		/*
		try {
		    String urlStr = "D:\\Personal\\DhekraPFE\\PFE m-learning\\WebContent\\assets\\photos\\229038105__ala.jpg";
			File url = new File(urlStr);
			BufferedImage img = null;
			try{
				response.setContentType("image/jpeg");
				img = ImageIO.read(url);
				ImageIO.write(img, "jpeg", response.getOutputStream());
			}catch(Exception e) {
				out.println("error: " + e);
			}
			try {
				//response.setContentType("image/jpeg");
				//JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
				//encoder.encode(img);
				
			}catch(Exception ee) {
				out.println("error: " + ee);
			}
		}catch (Exception e) {
			out.println("error: " + e);
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
