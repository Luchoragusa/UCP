/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.76
 * Generated at: 2022-03-09 15:36:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import data.*;
import entities.*;
import java.util.LinkedList;
import java.time.Duration;
import java.time.LocalTime;

public final class AltaIntegranteTuneado_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("data");
    _jspx_imports_packages.add("entities");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.time.Duration");
    _jspx_imports_classes.add("java.time.LocalTime");
    _jspx_imports_classes.add("java.util.LinkedList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html dir=\"ltr\" lang=\"en\">\r\n");
      out.write("    \r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <!-- Favicon icon -->\r\n");
      out.write("    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"./assets/images/favicon.png\">\r\n");
      out.write("    <!-- Custom CSS -->\r\n");
      out.write("    <link href=\"./dist/css/style.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    <link href=\"./dist/css/entrarsalir.css\" rel=\"stylesheet\">\r\n");
      out.write("    <title>[PSG] Alta Integrante</title>\r\n");
      out.write("    <style type=\"text/css\">     \r\n");
      out.write("		.form {\r\n");
      out.write("		        text-align: right;\r\n");
      out.write("    margin: auto;\r\n");
      out.write("    display: table;\r\n");
      out.write("		    }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("		");

			if (session.getAttribute("id") == null)
				response.sendRedirect("LoginTUNEADO.jsp");
		
      out.write("\r\n");
      out.write("		\r\n");
      out.write("		");
 
			DataIntegrante di = new DataIntegrante();
			Integrante i = new Integrante();
			i.setIdIntegrante((int)session.getAttribute("id"));
			i = di.getByIdIntegrante(i);
		
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"main-body\">\r\n");
      out.write("            <!-- Breadcrumb -->\r\n");
      out.write("            <nav aria-label=\"breadcrumb\" class=\"main-breadcrumb\">\r\n");
      out.write("            <ol class=\"breadcrumb\">\r\n");
      out.write("                <li class=\"breadcrumb-item\"><a href=\"HomeTuneada.jsp\">Home</a></li>\r\n");
      out.write("                <li class=\"breadcrumb-item active\" aria-current=\"page\"><a href=\"miPerfilTUNEADO.jsp\">Mi perfil</a></li>\r\n");
      out.write("            </ol>\r\n");
      out.write("            </nav>\r\n");
      out.write("            <!-- /Breadcrumb -->    \r\n");
      out.write("            <div class=\"row gutters-sm\">\r\n");
      out.write("                <div class=\"card\">\r\n");
      out.write("                <div class=\"card-body\">\r\n");
      out.write("                    <div class=\"d-flex flex-column align-items-center text-center\">\r\n");
      out.write("\r\n");
      out.write("                    <img src=\"./assets/images/logo-light-icon.png\" alt=\"Preview Image\" width=\"200\" height=\"200\"/>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"mt-3\">\r\n");
      out.write("                        <h4>ALTA INTEGRANTE</h4>\r\n");
      out.write("                        <p class=\"text-secondary mb-1\">Ingrese los datos requeridos para dar de alta un nuevo integrante en el sistema.</p>\r\n");
      out.write("                        <p class=\"text-muted font-size-sm\">[UCP-PSG] </p>                        \r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            <form action=\"altaIntegranteS\" method=\"post\">\r\n");
      out.write("	            <div class=\"col-md-6\">\r\n");
      out.write("	                <div class=\"card mb-3\">\r\n");
      out.write("	                	<div class=\"card-body\">\r\n");
      out.write("	                    	<div class=\"row\">\r\n");
      out.write("	                    		<div class=\"col-sm-3\">\r\n");
      out.write("	                        		<h6 class=\"mb-0\">Nombre</h6>\r\n");
      out.write("	                    		</div>\r\n");
      out.write("                    			<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                        			<input type = \"text\" name = \"nombre\" Required><br><br>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    		</div>\r\n");
      out.write("                    		\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                        		<div class=\"col-sm-3\">\r\n");
      out.write("                            		<h6 class=\"mb-0\">Apellido</h6>\r\n");
      out.write("                        		</div>\r\n");
      out.write("                        		<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                            		<input type=\"text\" name = \"apellido\" Required><br><br>\r\n");
      out.write("                        		</div>\r\n");
      out.write("                        	</div>\r\n");
      out.write("                        	\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                        		<div class=\"col-sm-3\">\r\n");
      out.write("                            		<h6 class=\"mb-0\">DiscordID</h6>\r\n");
      out.write("                        		</div>\r\n");
      out.write("                       			<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                            		<input type=\"text\" name = \"dsId\" Required><br><br>\r\n");
      out.write("                        		</div>\r\n");
      out.write("                        	</div>\r\n");
      out.write("                        	\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                        		<div class=\"col-sm-3\">\r\n");
      out.write("                            		<h6 class=\"mb-0\">SteamHex</h6>\r\n");
      out.write("                        		</div>\r\n");
      out.write("                        		<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                            		<input type=\"text\" name = \"steamHex\" Required><br><br>\r\n");
      out.write("                        		</div>\r\n");
      out.write("                        	</div>\r\n");
      out.write("                        	\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                    			<div class=\"col-sm-3\">\r\n");
      out.write("                        			<h6 class=\"mb-0\">Nombre Usuario</h6>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    			<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                        			<input type=\"text\" name = \"nombreUsuario\" Required><br><br>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    		</div>\r\n");
      out.write("                    		\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                    			<div class=\"col-sm-3\">\r\n");
      out.write("                        			<h6 class=\"mb-0\">Contraseña</h6>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    			<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                        			<input type=\"password\" name = \"pw\" Required><br><br>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    		</div>\r\n");
      out.write("                    		\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    ");

 						DataRango dr = new DataRango();
 						LinkedList<Rango> lista = new LinkedList<Rango>();
 						lista = dr.getAll();
 					
      out.write("\r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                    			<div class=\"col-sm-3\">\r\n");
      out.write("                        			<h6 class=\"mb-0\">Rango</h6>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    			<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                        			<select name=\"rango\">\r\n");
      out.write("							 			");

							 				for(Rango r :  lista) {
							 			
      out.write("\r\n");
      out.write("								        <option value=\"");
      out.print(r.getIdRango());
      out.write("\">\r\n");
      out.write("								        	");
      out.print(r.getNomRango());
      out.write("\r\n");
      out.write("								        </option>\r\n");
      out.write("									    ");

											}
										
      out.write("\r\n");
      out.write("									</select><br><br>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    		</div>\r\n");
      out.write("                    		\r\n");
      out.write("                    <hr>\r\n");
      out.write("                  	");

		 				DataRol drol = new DataRol();
		 				LinkedList<Rol> listaRol = new LinkedList<Rol>();
		 				listaRol = drol.getAll();
		 			
      out.write("\r\n");
      out.write("                    		<div class=\"row\">\r\n");
      out.write("                    			<div class=\"col-sm-3\">\r\n");
      out.write("                        			<h6 class=\"mb-0\">Rol</h6>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    			<div class=\"col-sm-5 text-secondary\">\r\n");
      out.write("                        			<select name=\"rol\">\r\n");
      out.write("							 			");

							 				for(Rol rol :  listaRol) {
							 			
      out.write("\r\n");
      out.write("								        <option value=\"");
      out.print(rol.getIdRol());
      out.write("\"> \r\n");
      out.write("								        	");
      out.print(rol.getdescRol());
      out.write("\r\n");
      out.write("								        </option>\r\n");
      out.write("									    ");

											}
										
      out.write("\r\n");
      out.write("									</select><br><br>\r\n");
      out.write("                    			</div>\r\n");
      out.write("                    		</div>\r\n");
      out.write("                    \r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("	                    <div class=\"col-sm-12\">\r\n");
      out.write("							<input type = \"submit\" class = \"btn btn-primary\" value = \"Agregar\"><br>       \r\n");
      out.write("						</div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("               </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("           </form>\r\n");
      out.write("\r\n");
      out.write("          </div>\r\n");
      out.write("         </div>\r\n");
      out.write("        </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}