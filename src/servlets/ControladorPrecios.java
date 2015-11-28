package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.group7.business.ListaPreciosVO;
import com.group7.business.ProveedorVO;
import com.group7.business.RodamientoVO;

import manager.AdministradorCotizacion;
import manager.AdministradorPrecios;
import manager.AdministradorProveedor;


public class ControladorPrecios extends HttpServlet {

	private static final long serialVersionUID = 1087702007634924546L;
	private List<RodamientoVO> items;
	private List<Float> precios;
	private HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
        {
            String action = request.getParameter("action");
            String jspPage = "/index.html";
            session = request.getSession();
            
            if(request.getParameter("agregarItem")!=null)
            {
            	action ="add";
            }
            if(request.getParameter("delete")!=null)
            {
            	action ="delete";
            }
            else if(request.getParameter("cancelar")!=null)
            {
            	action ="cancelar";
            }
            else if(request.getParameter("cancelar4")!=null)
            {
            	action ="default";
            }
            else if(request.getParameter("validarProveedor")!=null)
            {
            	ProveedorVO p = AdministradorProveedor.getInstancia().getProveedor(Integer.valueOf(request.getParameter("proveedorid")));
            	session.setAttribute("proveedorSeleccionado", p);
            	action = "displayinterface";
            }
            else if(request.getParameter("show")!=null)
            {
            	action = "show";
            }

            if ((action == null) || (action.length() < 1))
            {
                action = "default";
            }

            if ("default".equals(action))
            {
                jspPage = "/index.html";
            }
            else if ("displayinterface".equals(action))
            {
            	List<ProveedorVO> proveedores = new ArrayList<ProveedorVO>();
            	proveedores = AdministradorProveedor.getInstancia().getProveedores();
            	request.setAttribute("proveedores", proveedores);
            	List<RodamientoVO> rodamientos = new ArrayList<RodamientoVO>();
            	rodamientos = AdministradorCotizacion.getInstancia().getRodamientos(); //Chequear que sea correcto, ya que estamos accediendo a otro administrador puesto que los rodamientos los administra la ODV
            	request.setAttribute("rodamientos", rodamientos);
				jspPage = "jsp/Precio/GenerarListaDePrecios.jsp";
     
             
            }
            else if ("save".equals(action))
            {
            	if (items!=null && precios!=null){
            		if (items.size()>0 && precios.size()>0){
		            	ProveedorVO p = (ProveedorVO) session.getAttribute("proveedorSeleccionado");
		                String tipo = (String) session.getAttribute("tipo");
		                String vigencia = (String)session.getAttribute("vigencia");
		                Float descuento = (Float.parseFloat((String) session.getAttribute("descuento")));
						AdministradorPrecios.getInstancia().armarListaDePrecios(p, items, precios, tipo, vigencia, descuento);
						cerrar();
            		}
            	}
            }
            else if ("cancelar".equals(action))
            {
            	cerrar();
            } else if ("delete".equals(action)) {
            	String del = request.getParameter("delindex");
				int d = (new Integer(del)).intValue();
				items.remove(d);
				precios.remove(d);
				session.setAttribute("items", items);
				session.setAttribute("precios", precios);
				popularCombos(request);
				jspPage = "jsp/Precio/GenerarListaDePrecios.jsp";
				
            } else if ("add".equals(action)){
				boolean existe = false;
				String roda = ((String) request.getParameter("listadoRodamientos"));
				String [] stringRodamiento = roda.split("/");
				Float precioVenta = Float.valueOf(request.getParameter("precioVenta"));
				RodamientoVO unR = AdministradorCotizacion.getInstancia().getRodamiento(stringRodamiento[0],stringRodamiento[1]);	
				if (items == null && precios ==null) {
					items = new ArrayList<RodamientoVO>();
					precios = new ArrayList<Float>();
					items.add(unR);
					precios.add(precioVenta);
				} else {
					for (int i = 0; i < items.size(); i++) {
						RodamientoVO ro = (RodamientoVO) items.get(i);
						if (ro.getCodigoPieza().equals(unR.getCodigoPieza()) && (ro.getCodigoSFK().equals(unR.getCodigoSFK()))){
							precios.set(i,precioVenta);//No sumo el precio anterior, lo reemplazo.
							existe = true;
						} 
					} 
					if (!existe){
						items.add(unR);
						precios.add(precioVenta);
					}
				}
				session.setAttribute("items", items);
				session.setAttribute("precios", precios);
				guardarSessionDeCabecera(request);
				popularCombos(request);
				jspPage = "jsp/Precio/GenerarListaDePrecios.jsp";
            }
            else if ("show".equals(action)){
            	 Integer nro = Integer.valueOf(request.getParameter("listado"));
                 ListaPreciosVO lp = AdministradorPrecios.getInstancia().getListaDePrecio(nro); 
 				 request.setAttribute("lp", lp);
                 jspPage = "jsp/Precio/MostrarListaDePrecio.jsp";
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
        
        private void cerrar() {
        	if (session!=null){
        		session.invalidate();
        		precios.clear();
        		items.clear();
        	}
        }
    	private void popularCombos(HttpServletRequest request) {
			List<RodamientoVO> rodamientos = new ArrayList<RodamientoVO>();
			rodamientos = AdministradorCotizacion.getInstancia().getRodamientos();
			request.setAttribute("rodamientos", rodamientos);
    	}
    	

		private void guardarSessionDeCabecera(HttpServletRequest request) {
			String tipo = (String)request.getParameter("tipo");
			String descuento = (String)request.getParameter("descuento");
			String vigencia =(String) request.getParameter("vigencia");
			session.setAttribute("tipo", tipo);
			session.setAttribute("descuento", descuento);
			session.setAttribute("vigencia", vigencia);
		}


}
