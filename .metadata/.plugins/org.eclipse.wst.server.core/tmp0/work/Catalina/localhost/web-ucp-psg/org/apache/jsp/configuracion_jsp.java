/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.76
 * Generated at: 2022-03-08 14:45:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class configuracion_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->\r\n");
      out.write("    <!--  All snippets are MIT license http://bootdey.com/license -->\r\n");
      out.write("    <title>[PSG] Configuración</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("	<script src=\"https://code.jquery.com/jquery-1.10.2.min.js\"></script>\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("	<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("    <script src=\"//code.tidio.co/p26dt4g3heql4zxjwvkmcyecxl33ssqy.js\" async></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("		");

		int idRol = 0;
		if (session.getAttribute("id") == null)
			response.sendRedirect("HomeTuneada.jsp");
		else 
		{
			idRol = Integer.parseInt(session.getAttribute("rol").toString());
		}
		
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("<div class=\"row justify-content-center\">\r\n");
      out.write("    <div class=\"col-12 col-lg-10 col-xl-8 mx-auto\">\r\n");
      out.write("        <div class=\"my-4\">\r\n");
      out.write("            <h5 class=\"mb-0 mt-5\">Notificaciones de ajustes</h5>\r\n");
      out.write("            <p>Selecciona la notificación que quieres recibir</p>\r\n");
      out.write("            <hr class=\"my-4\" />\r\n");
      out.write("            <strong class=\"mb-0\">Seguridad</strong>\r\n");
      out.write("            <p>Alerta de control de seguridad que recibirá.</p>\r\n");
      out.write("            <div class=\"list-group mb-5 shadow\">\r\n");
      out.write("                <div class=\"list-group-item\">\r\n");
      out.write("                    <div class=\"row align-items-center\">\r\n");
      out.write("                        <div class=\"col\">\r\n");
      out.write("                            <strong class=\"mb-0\">Notificaciones de actividades inusuales</strong>\r\n");
      out.write("                            <p class=\"text-muted mb-0\">Donec in quam sed urna bibendum tincidunt quis mollis mauris.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-auto\">\r\n");
      out.write("                            <div class=\"custom-control custom-switch\">\r\n");
      out.write("                                <input type=\"checkbox\" class=\"custom-control-input\" id=\"alert1\" checked=\"\" />\r\n");
      out.write("                                <span class=\"custom-control-label\"></span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"list-group-item\">\r\n");
      out.write("                    <div class=\"row align-items-center\">\r\n");
      out.write("                        <div class=\"col\">\r\n");
      out.write("                            <strong class=\"mb-0\">Actividad financiera no autorizada</strong>\r\n");
      out.write("                            <p class=\"text-muted mb-0\">Fusce lacinia elementum eros, sed vulputate urna eleifend nec.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-auto\">\r\n");
      out.write("                            <div class=\"custom-control custom-switch\">\r\n");
      out.write("                                <input type=\"checkbox\" class=\"custom-control-input\" id=\"alert2\" />\r\n");
      out.write("                                <span class=\"custom-control-label\"></span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <hr class=\"my-4\" />\r\n");
      out.write("            <strong class=\"mb-0\">Sistema</strong>\r\n");
      out.write("            <p>Por favor, habilite la alerta del sistema que recibirá.</p>\r\n");
      out.write("            <div class=\"list-group mb-5 shadow\">\r\n");
      out.write("                <div class=\"list-group-item\">\r\n");
      out.write("                    <div class=\"row align-items-center\">\r\n");
      out.write("                        <div class=\"col\">\r\n");
      out.write("                            <strong class=\"mb-0\">Notifíqueme sobre nuevas funciones y actualizaciones</strong>\r\n");
      out.write("                            <p class=\"text-muted mb-0\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-auto\">\r\n");
      out.write("                            <div class=\"custom-control custom-switch\">\r\n");
      out.write("                                <input type=\"checkbox\" class=\"custom-control-input\" id=\"alert3\" checked=\"\" />\r\n");
      out.write("                                <span class=\"custom-control-label\"></span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"list-group-item\">\r\n");
      out.write("                    <div class=\"row align-items-center\">\r\n");
      out.write("                        <div class=\"col\">\r\n");
      out.write("                            <strong class=\"mb-0\">Notifíqueme por correo electrónico para las últimas noticias</strong>\r\n");
      out.write("                            <p class=\"text-muted mb-0\">Nulla et tincidunt sapien. Sed eleifend volutpat elementum.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-auto\">\r\n");
      out.write("                            <div class=\"custom-control custom-switch\">\r\n");
      out.write("                                <input type=\"checkbox\" class=\"custom-control-input\" id=\"alert4\" checked=\"\" />\r\n");
      out.write("                                <span class=\"custom-control-label\"></span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"list-group-item\">\r\n");
      out.write("                    <div class=\"row align-items-center\">\r\n");
      out.write("                        <div class=\"col\">\r\n");
      out.write("                            <strong class=\"mb-0\">Notificarme sobre consejos sobre el uso de la cuenta</strong>\r\n");
      out.write("                            <p class=\"text-muted mb-0\">Donec in quam sed urna bibendum tincidunt quis mollis mauris.</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-auto\">\r\n");
      out.write("                            <div class=\"custom-control custom-switch\">\r\n");
      out.write("                                <input type=\"checkbox\" class=\"custom-control-input\" id=\"alert5\" />\r\n");
      out.write("                                <span class=\"custom-control-label\"></span>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<a button type=\"button\" class=\"btn btn-outline-secondary\" href=\"HomeTuneada.jsp\">Home</a>\r\n");
      out.write("\r\n");
      out.write("<footer class=\"footer text-center\">\r\n");
      out.write("    Panel de la faccion de Prosegur en [BA:RP] ||\r\n");
      out.write("        <a href=\"https://github.com/Luchoragusa\">Luciano Ragusa</a> || \r\n");
      out.write("        <a href=\"https://github.com/JuaniPucheta\">Juan Ignacio Pucheta</a>.|| \r\n");
      out.write("        <a href=\"https://github.com/CamiloPereyra\">Camilo Pereyra</a>.\r\n");
      out.write("</footer>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("body{\r\n");
      out.write("    color: #8e9194;\r\n");
      out.write("    background-color: #f4f6f9;\r\n");
      out.write("}\r\n");
      out.write(".list-group {\r\n");
      out.write("    display: flex;\r\n");
      out.write("    flex-direction: column;\r\n");
      out.write("    padding-left: 0;\r\n");
      out.write("    margin-bottom: 0;\r\n");
      out.write("    border-radius: 0.25rem;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-action {\r\n");
      out.write("    width: 100%;\r\n");
      out.write("    color: #4d5154;\r\n");
      out.write("    text-align: inherit;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-action:hover,\r\n");
      out.write(".list-group-item-action:focus {\r\n");
      out.write("    z-index: 1;\r\n");
      out.write("    color: #4d5154;\r\n");
      out.write("    text-decoration: none;\r\n");
      out.write("    background-color: #f4f6f9;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-action:active {\r\n");
      out.write("    color: #8e9194;\r\n");
      out.write("    background-color: #eef0f3;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item {\r\n");
      out.write("    position: relative;\r\n");
      out.write("    display: block;\r\n");
      out.write("    padding: 0.75rem 1.25rem;\r\n");
      out.write("    background-color: #ffffff;\r\n");
      out.write("    border: 1px solid #eef0f3;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item:first-child {\r\n");
      out.write("    border-top-left-radius: inherit;\r\n");
      out.write("    border-top-right-radius: inherit;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item:last-child {\r\n");
      out.write("    border-bottom-right-radius: inherit;\r\n");
      out.write("    border-bottom-left-radius: inherit;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item.disabled,\r\n");
      out.write(".list-group-item:disabled {\r\n");
      out.write("    color: #6d7174;\r\n");
      out.write("    pointer-events: none;\r\n");
      out.write("    background-color: #ffffff;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item.active {\r\n");
      out.write("    z-index: 2;\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #1b68ff;\r\n");
      out.write("    border-color: #1b68ff;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item + .list-group-item {\r\n");
      out.write("    border-top-width: 0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item + .list-group-item.active {\r\n");
      out.write("    margin-top: -1px;\r\n");
      out.write("    border-top-width: 1px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-horizontal {\r\n");
      out.write("    flex-direction: row;\r\n");
      out.write("}\r\n");
      out.write(".list-group-horizontal > .list-group-item:first-child {\r\n");
      out.write("    border-bottom-left-radius: 0.25rem;\r\n");
      out.write("    border-top-right-radius: 0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-horizontal > .list-group-item:last-child {\r\n");
      out.write("    border-top-right-radius: 0.25rem;\r\n");
      out.write("    border-bottom-left-radius: 0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-horizontal > .list-group-item.active {\r\n");
      out.write("    margin-top: 0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-horizontal > .list-group-item + .list-group-item {\r\n");
      out.write("    border-top-width: 1px;\r\n");
      out.write("    border-left-width: 0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-horizontal > .list-group-item + .list-group-item.active {\r\n");
      out.write("    margin-left: -1px;\r\n");
      out.write("    border-left-width: 1px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media (min-width: 576px) {\r\n");
      out.write("    .list-group-horizontal-sm {\r\n");
      out.write("        flex-direction: row;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-sm > .list-group-item:first-child {\r\n");
      out.write("        border-bottom-left-radius: 0.25rem;\r\n");
      out.write("        border-top-right-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-sm > .list-group-item:last-child {\r\n");
      out.write("        border-top-right-radius: 0.25rem;\r\n");
      out.write("        border-bottom-left-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-sm > .list-group-item.active {\r\n");
      out.write("        margin-top: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-sm > .list-group-item + .list-group-item {\r\n");
      out.write("        border-top-width: 1px;\r\n");
      out.write("        border-left-width: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-sm > .list-group-item + .list-group-item.active {\r\n");
      out.write("        margin-left: -1px;\r\n");
      out.write("        border-left-width: 1px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media (min-width: 768px) {\r\n");
      out.write("    .list-group-horizontal-md {\r\n");
      out.write("        flex-direction: row;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-md > .list-group-item:first-child {\r\n");
      out.write("        border-bottom-left-radius: 0.25rem;\r\n");
      out.write("        border-top-right-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-md > .list-group-item:last-child {\r\n");
      out.write("        border-top-right-radius: 0.25rem;\r\n");
      out.write("        border-bottom-left-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-md > .list-group-item.active {\r\n");
      out.write("        margin-top: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-md > .list-group-item + .list-group-item {\r\n");
      out.write("        border-top-width: 1px;\r\n");
      out.write("        border-left-width: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-md > .list-group-item + .list-group-item.active {\r\n");
      out.write("        margin-left: -1px;\r\n");
      out.write("        border-left-width: 1px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media (min-width: 992px) {\r\n");
      out.write("    .list-group-horizontal-lg {\r\n");
      out.write("        flex-direction: row;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-lg > .list-group-item:first-child {\r\n");
      out.write("        border-bottom-left-radius: 0.25rem;\r\n");
      out.write("        border-top-right-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-lg > .list-group-item:last-child {\r\n");
      out.write("        border-top-right-radius: 0.25rem;\r\n");
      out.write("        border-bottom-left-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-lg > .list-group-item.active {\r\n");
      out.write("        margin-top: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-lg > .list-group-item + .list-group-item {\r\n");
      out.write("        border-top-width: 1px;\r\n");
      out.write("        border-left-width: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-lg > .list-group-item + .list-group-item.active {\r\n");
      out.write("        margin-left: -1px;\r\n");
      out.write("        border-left-width: 1px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media (min-width: 1200px) {\r\n");
      out.write("    .list-group-horizontal-xl {\r\n");
      out.write("        flex-direction: row;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-xl > .list-group-item:first-child {\r\n");
      out.write("        border-bottom-left-radius: 0.25rem;\r\n");
      out.write("        border-top-right-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-xl > .list-group-item:last-child {\r\n");
      out.write("        border-top-right-radius: 0.25rem;\r\n");
      out.write("        border-bottom-left-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-xl > .list-group-item.active {\r\n");
      out.write("        margin-top: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-xl > .list-group-item + .list-group-item {\r\n");
      out.write("        border-top-width: 1px;\r\n");
      out.write("        border-left-width: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .list-group-horizontal-xl > .list-group-item + .list-group-item.active {\r\n");
      out.write("        margin-left: -1px;\r\n");
      out.write("        border-left-width: 1px;\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-flush {\r\n");
      out.write("    border-radius: 0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-flush > .list-group-item {\r\n");
      out.write("    border-width: 0 0 1px;\r\n");
      out.write("}\r\n");
      out.write(".list-group-flush > .list-group-item:last-child {\r\n");
      out.write("    border-bottom-width: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-primary {\r\n");
      out.write("    color: #0e3685;\r\n");
      out.write("    background-color: #bfd5ff;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-primary.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-primary.list-group-item-action:focus {\r\n");
      out.write("    color: #0e3685;\r\n");
      out.write("    background-color: #a6c4ff;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-primary.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #0e3685;\r\n");
      out.write("    border-color: #0e3685;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-secondary {\r\n");
      out.write("    color: #0a395d;\r\n");
      out.write("    background-color: #bdd6ea;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-secondary.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-secondary.list-group-item-action:focus {\r\n");
      out.write("    color: #0a395d;\r\n");
      out.write("    background-color: #aacae4;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-secondary.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #0a395d;\r\n");
      out.write("    border-color: #0a395d;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-success {\r\n");
      out.write("    color: #107259;\r\n");
      out.write("    background-color: #c0f5e8;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-success.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-success.list-group-item-action:focus {\r\n");
      out.write("    color: #107259;\r\n");
      out.write("    background-color: #aaf2e0;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-success.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #107259;\r\n");
      out.write("    border-color: #107259;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-info {\r\n");
      out.write("    color: #005d83;\r\n");
      out.write("    background-color: #b8eafe;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-info.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-info.list-group-item-action:focus {\r\n");
      out.write("    color: #005d83;\r\n");
      out.write("    background-color: #9fe3fe;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-info.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #005d83;\r\n");
      out.write("    border-color: #005d83;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-warning {\r\n");
      out.write("    color: #855701;\r\n");
      out.write("    background-color: #ffe7b8;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-warning.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-warning.list-group-item-action:focus {\r\n");
      out.write("    color: #855701;\r\n");
      out.write("    background-color: #ffde9f;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-warning.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #855701;\r\n");
      out.write("    border-color: #855701;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-danger {\r\n");
      out.write("    color: #721c24;\r\n");
      out.write("    background-color: #f5c6cb;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-danger.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-danger.list-group-item-action:focus {\r\n");
      out.write("    color: #721c24;\r\n");
      out.write("    background-color: #f1b0b7;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-danger.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #721c24;\r\n");
      out.write("    border-color: #721c24;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-light {\r\n");
      out.write("    color: #7f8081;\r\n");
      out.write("    background-color: #fcfcfd;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-light.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-light.list-group-item-action:focus {\r\n");
      out.write("    color: #7f8081;\r\n");
      out.write("    background-color: #ededf3;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-light.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #7f8081;\r\n");
      out.write("    border-color: #7f8081;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".list-group-item-dark {\r\n");
      out.write("    color: #17191c;\r\n");
      out.write("    background-color: #c4c5c6;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-dark.list-group-item-action:hover,\r\n");
      out.write(".list-group-item-dark.list-group-item-action:focus {\r\n");
      out.write("    color: #17191c;\r\n");
      out.write("    background-color: #b7b8b9;\r\n");
      out.write("}\r\n");
      out.write(".list-group-item-dark.list-group-item-action.active {\r\n");
      out.write("    color: #ffffff;\r\n");
      out.write("    background-color: #17191c;\r\n");
      out.write("    border-color: #17191c;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(".btn-outline-secondary {\r\n");
      out.write("    padding-right: 50px;\r\n");
      out.write("    padding-left: 50px;\r\n");
      out.write("    text-align: center;\r\n");
      out.write("    background-color: #1250ce;\r\n");
      out.write("    color: #fff;\r\n");
      out.write("    width: 200px;\r\n");
      out.write("    position: relative;\r\n");
      out.write("    left: 500px;\r\n");
      out.write("    bottom: 20px;\r\n");
      out.write("    margin-bottom: 30px;\r\n");
      out.write("    margin-top: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
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
