/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.76
 * Generated at: 2022-03-09 23:43:49 UTC
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

public final class GestionInt_005f2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>[PSG] Gestion Integrante</title>\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("    \r\n");
      out.write("    .input[type=submit] {\r\n");
      out.write("    padding:5px 15px; \r\n");
      out.write("    background:#ccc; \r\n");
      out.write("    border:0 none;\r\n");
      out.write("    cursor:pointer;\r\n");
      out.write("    -webkit-border-radius: 5px;\r\n");
      out.write("    border-radius: 5px; \r\n");
      out.write("    text-align:center;\r\n");
      out.write("}\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("		");
 
			Integrante i = new Integrante();
			i.setIdIntegrante(Integer.parseInt(request.getParameter("id")));
			application.setAttribute("idApp", i.getIdIntegrante());
			DataIntegrante di = new DataIntegrante();
			i=di.getByIdIntegrante(i);
		
      out.write("\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"main-body\">\r\n");
      out.write("            <!-- Breadcrumb -->\r\n");
      out.write("            <nav aria-label=\"breadcrumb\" class=\"main-breadcrumb\">\r\n");
      out.write("            <ol class=\"breadcrumb\">\r\n");
      out.write("                <li class=\"breadcrumb-item\"><a href=\"HomeTuneada.jsp\">Home</a></li>\r\n");
      out.write("            </ol>\r\n");
      out.write("            </nav>\r\n");
      out.write("            <!-- /Breadcrumb -->    \r\n");
      out.write("            <div class=\"row gutters-sm\">\r\n");
      out.write("            <div class=\"col-md-4 mb-3\">\r\n");
      out.write("                <div class=\"card\">\r\n");
      out.write("                <div class=\"card-body\">\r\n");
      out.write("                    <div class=\"d-flex flex-column align-items-center text-center\">\r\n");
      out.write("\r\n");
      out.write("                    <!-- Imagen para subir INICIO-->\r\n");
      out.write("                    <img src=\"./assets/images/logo-light-icon.png\" alt=\"Preview Image\" width=\"200\" height=\"200\"/>\r\n");
      out.write("                    <!-- Imagen para subir FIN-->\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"mt-3\">\r\n");
      out.write("                        <h4>GESTION INTEGRANTE</h4>\r\n");
      out.write("                        <p class=\"text-secondary mb-1\">Menu de Gestion de integrante.</p>\r\n");
      out.write("                        <p class=\"text-muted font-size-sm\">[UCP-PSG] </p>\r\n");
      out.write("                        <!--<button class=\"btn btn-primary\">Follow</button>\r\n");
      out.write("                        <button class=\"btn btn-outline-primary\">Message</button>-->\r\n");
      out.write("                        \r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            		\r\n");
      out.write("            \r\n");
      out.write("            <div class=\"col-md-8\">\r\n");
      out.write("                <div class=\"card mb-3\">\r\n");
      out.write("                <div class=\"card-body\">\r\n");
      out.write("          		  <form action=\"editarPerfilS?idInte=");
      out.print(i.getIdIntegrante());
      out.write("\" method=\"post\">      \r\n");
      out.write("          		  \r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-3\">\r\n");
      out.write("                        <h6 class=\"mb-0\">Nombre</h6>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                        <input type = \"text\" name = \"nombre\" value=\"");
      out.print(i.getNombre());
      out.write("\"Required><br><br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-sm-3\">\r\n");
      out.write("                            <h6 class=\"mb-0\">Apellido</h6>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                            <input type = \"text\" name = \"apellido\" value=\"");
      out.print(i.getApellido());
      out.write("\"Required><br><br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-sm-3\">\r\n");
      out.write("                            <h6 class=\"mb-0\">DiscordID</h6>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                            <input type = \"text\" name = \"discordId\" value=\"");
      out.print(i.getDiscordId());
      out.write("\"Required><br><br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                        <div class=\"col-sm-3\">\r\n");
      out.write("                            <h6 class=\"mb-0\">SteamHex</h6>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                            <input type = \"text\" name = \"usuario\" value=\"");
      out.print(i.getUsuario());
      out.write("\"Required><br><br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-3\">\r\n");
      out.write("                        <h6 class=\"mb-0\">Nombre Usuario</h6>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                        <input type = \"text\" name = \"usuario\" value=\"");
      out.print(i.getSteamHex());
      out.write("\"Required><br><br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-3\">\r\n");
      out.write("                        <h6 class=\"mb-0\">Contraseña</h6>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                        <input type = \"submit\" class=\"btn btn-warning\" onclick = \"mostrarForm()\" value = \"Editar PW\" id=\"btn1\">\r\n");
      out.write("                        <h4 id=\"lbl1\" hidden=\"\">Contrasenia:</h4><input type = \"password\" id=\"txt1\" name = \"pw\" hidden=\"\" placeholder=\"Obligatorio\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    ");

 						DataRango dr = new DataRango();
 						LinkedList<Rango> lista = new LinkedList<Rango>();
 						lista = dr.getAll();
 					
      out.write("\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-3\">\r\n");
      out.write("                        <h6 class=\"mb-0\">Rango</h6>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                        <select name=\"rango\">\r\n");
      out.write("				 			");

				 				for(Rango r :  lista) {
				 			
      out.write("\r\n");
      out.write("					        <option value=\"");
      out.print(r.getIdRango());
      out.write("\">\r\n");
      out.write("					        	");
      out.print(r.getNomRango());
      out.write("\r\n");
      out.write("					        </option>\r\n");
      out.write("						    ");

								}
							
      out.write("\r\n");
      out.write("						</select><br><br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <hr>\r\n");
      out.write("                    \r\n");
      out.write("                    ");

		 				DataRol drol = new DataRol();
		 				LinkedList<Rol> listaRol = new LinkedList<Rol>();
		 				listaRol = drol.getAll();
		 			
      out.write("\r\n");
      out.write("                    <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-3\">\r\n");
      out.write("                        <h6 class=\"mb-0\">Rol</h6>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                        <select name=\"rol\">\r\n");
      out.write("				 			");

				 				for(Rol rol :  listaRol) {
				 			
      out.write("\r\n");
      out.write("					        <option value=\"");
      out.print(rol.getIdRol());
      out.write("\"> \r\n");
      out.write("					        	");
      out.print(rol.getdescRol());
      out.write("\r\n");
      out.write("					        </option>\r\n");
      out.write("						    ");

								}
							
      out.write("\r\n");
      out.write("						</select><br><br>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    </div>                    																	\r\n");
      out.write("					                    <hr>\r\n");
      out.write("					</form>\r\n");
      out.write("					\r\n");
      out.write("					<script type=\"text/javascript\">\r\n");
      out.write("						function mostrarForm()\r\n");
      out.write("						{\r\n");
      out.write("							document.getElementById('txt1').hidden=false;\r\n");
      out.write("							document.getElementById('txt1').required=true;\r\n");
      out.write("							document.getElementById('lbl1').hidden=false;\r\n");
      out.write("							document.getElementById('btn1').hidden=true;\r\n");
      out.write("						}\r\n");
      out.write("					</script>	\r\n");
      out.write("					\r\n");
      out.write("				<div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-3\">\r\n");
      out.write("                        <h6 class=\"mb-0\">Sub-Division</h6>\r\n");
      out.write("                    </div>\r\n");
      out.write("	                    <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("							<input type = \"submit\" class=\"btn btn-warning\" onclick = \"mostrarFormSub()\" value = \"Editar Sub-division\" id=\"btn2\"><br><br>\r\n");
      out.write("						</div><hr>&nbsp;&nbsp;\r\n");
      out.write("                </div>  \r\n");
      out.write("				\r\n");
      out.write("					<script type=\"text/javascript\">\r\n");
      out.write("						function mostrarFormSub()\r\n");
      out.write("						{\r\n");
      out.write("							document.getElementById('frmSub').hidden=false;\r\n");
      out.write("							document.getElementById('btn2').hidden=true;\r\n");
      out.write("						}\r\n");
      out.write("					</script>\r\n");
      out.write("					\r\n");
      out.write("					");
int idSub = 0; 
      out.write("\r\n");
      out.write("					\r\n");
      out.write("					<form id=\"frmSub\" hidden=\"\" id=\"subId\" onchange =\"selectRanSub()\" action=\"gestionRanSub.jsp?idSub=\"");
      out.print(idSub);
      out.write(">\r\n");
      out.write("						\r\n");
      out.write("						<h3 class=\"card-title\" style= \"color:red\">Sanciones</h3>\r\n");
      out.write("						\r\n");
      out.write("						<h4 class=\"card-title\" style=\"color:rgb(246, 117, 117)\">Sanciones \r\n");
      out.write("						");
 if(i.getSub() != null) out.print(i.getSub().getDescripcion()); else out.print("No pertenece a ninguna subdivision"); 
      out.write(" </h4>\r\n");
      out.write("					\r\n");
      out.write("			       		<select name=\"sub\">\r\n");
      out.write("							");

				 				DataSubdivision ds = new DataSubdivision();
				 				LinkedList<Subdivision> listaSub = new LinkedList<Subdivision>();
				 				listaSub = ds.getAll();
				 			
      out.write("\r\n");
      out.write("				       		<option value = \"\"> \r\n");
      out.write("					        ");
out.print("Seleccionar"); 
      out.write("</option>\r\n");
      out.write("				 			");

				 				for(Subdivision s :  listaSub) {
				 			
      out.write("\r\n");
      out.write("					        <option value=\"");
      out.print(s.getIdSub());
      out.write("\"> \r\n");
      out.write("					        ");
      out.print(s.getDescripcion());
      out.write("</option>\r\n");
      out.write("						    ");

								}
							
      out.write("\r\n");
      out.write("							\r\n");
      out.write("						</select><br><br>\r\n");
      out.write("						\r\n");
      out.write("						");
 session.setAttribute("idSub", idSub);
      out.write("\r\n");
      out.write("						\r\n");
      out.write("						<input type = \"submit\" value = \"Asignar Rango Sub division\"><br><br>\r\n");
      out.write("					</form>\r\n");
      out.write("			\r\n");
      out.write("			<div style=\"text-align:center\">\r\n");
      out.write("					<form action=\"AplicarSancionTuneado.jsp\">\r\n");
      out.write("						<input type = \"submit\" class=\"btn btn-info\" value = \"Aplicar Sancion\"><br><br>\r\n");
      out.write("					</form>\r\n");
      out.write("						\r\n");
      out.write("					<form action=\"deleteIntegranteS?idInte=");
      out.print(i.getIdIntegrante());
      out.write("\" method=\"post\">\r\n");
      out.write("						<input type = \"submit\" class=\"btn btn-danger\" value = \"Eliminar\" ><br>\r\n");
      out.write("					</form>\r\n");
      out.write("\r\n");
      out.write("					<br><input type = \"submit\" class=\"btn btn-success\" value = \"Guardar cambios\" style=\"width: 300px;\"></br>\r\n");
      out.write("			</div>\r\n");
      out.write("                </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("<div id=\"main-wrapper\" data-layout=\"vertical\" data-navbarbg=\"skin5\" data-sidebartype=\"full\"\r\n");
      out.write("        data-sidebar-position=\"absolute\" data-header-position=\"absolute\" data-boxed-layout=\"full\">\r\n");
      out.write("            <footer class=\"footer text-center\">\r\n");
      out.write("                Panel de la faccion de Prosegur en [BA:RP] ||\r\n");
      out.write("                    <a href=\"https://github.com/Luchoragusa\">Luciano Ragusa</a> || \r\n");
      out.write("                    <a href=\"https://github.com/JuaniPucheta\">Juan Ignacio Pucheta</a>|| \r\n");
      out.write("                    <a href=\"https://github.com/CamiloPereyra\">Camilo Pereyra</a>\r\n");
      out.write("            </footer>\r\n");
      out.write("</div>\r\n");
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
