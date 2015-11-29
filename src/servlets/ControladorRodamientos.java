package servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import manager.AdministradorRodamientos;



public class ControladorRodamientos extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
        {
            String action = request.getParameter("action");
            String jspPage = "/index.jsp";
            if ((action == null) || (action.length() < 1))
            {
                action = "default";
            }

            if ("default".equals(action))
            {
                jspPage = "/index.jsp";
            }
            else if ("procesar".equals(action))
            {
            	String codigosfk ="";
            	String codigopieza="";
            	String descripcion="";
            	String paisorigen="";
            	String marca="";
            	boolean estado=true;
            	String path = request.getParameter("path");
            	try {
        			File rodamientos = new File(path);
        			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        			Document doc = dBuilder.parse(rodamientos);
        			doc.getDocumentElement().normalize();

        			NodeList nodes = doc.getElementsByTagName("rodamiento");
        			for (int i = 0; i < nodes.getLength(); i++) {
        				Node node = nodes.item(i);
        				if (node.getNodeType() == Node.ELEMENT_NODE) {
        					Element element = (Element) node;
        					codigosfk = getValue("codigosfk", element);
        					codigopieza = getValue("codigopieza", element);
        					descripcion=getValue("descripcion", element);
        					paisorigen=getValue("paisorigen", element);
        					marca=getValue("marca", element);
        					AdministradorRodamientos.getInstancia().alta(codigosfk, codigopieza, descripcion, paisorigen, marca, estado);
        				}
        			}
        		} catch (Exception ex) {
        			ex.printStackTrace();
        		}
     
             
            }
            dispatch(jspPage, request, response);
        }
    
		protected void dispatch(String jsp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
        {
            if (jsp != null)
            {
                RequestDispatcher rd = request.getRequestDispatcher(jsp);
                rd.forward(request, response);
            }
        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
        {
        	System.out.println(request.toString());
            doPost(request, response);
        }
        
        private static String getValue(String tag, Element element) {
    		NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
    		Node node = (Node) nodes.item(0);
    		return node.getNodeValue();
    	}
 }
