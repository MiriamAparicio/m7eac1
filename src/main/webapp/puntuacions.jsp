<%-- 
    Document   : puntuacions
    Created on : 9-sep-2017, 20:04:12
    Author     : Àlex Salinas / Miriam Aparicio
--%>
<%@page import="java.util.Map"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*
     TODO
     Si  l'usuari ha donat a un dels enllaços Eliminar, llavors la url serà:
     .../puntuacions.jsp?rest=xxx, on xxx és el nom del restaurant.
     
     A la variable Java rest, hem recuperat aquest nom amb
     request.getParameter("rest") 
    
     I a la variable Java puntuacions, hem recuperat la llista de puntuacions
      amb session.getAttribute("puntuacions");     
    
     Què heu de fer?
     Elimineu el restaurant de la llista de puntuacions
     */
    String rest = request.getParameter("rest");
    Map <String,Integer> puntuacions = (Map) session.getAttribute("puntuacions");
    puntuacions.remove(rest);
    

    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Puntuacions</title>
        <!-- CSS -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- css propis -->
        <link href="owncss/restaurant.css" rel="stylesheet">

        <!-- JAVA SCRIPT -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10">
                    <h1>Puntuacions realitzades</h1>
                </div>
            </div>                
            <div class="row">
                <div class="col-md-8">
                    <table class="table table-hover">
                        <thead class="thead-inverse">
                            <tr>
                                <th></th>
                                <th>Restaurant</th>
                                <th>Puntuació</th>
                                <th>Acció</th>
                            </tr>
                        </thead>
                        <!--
                        TODO
                        Amb JSTL heu de desenvolupar les files de la table que es pot veure a l'enunciat.
                        El contingut són els restaurants que estan puntuats.
                        No cal que sigui exacte a la que veieu, però el contingut ha de ser el mateix.
                        Heu de cambiar cada color de la fila amb JSTL.
                        L'enllaç Eliminar de cada fila, és l'element
                            <a  href='xxx'>Eliminar</a>
                                on xxx l'heu de construir amb JSTL i la url ha de ser 
                        ...puntuacions.jsp?rest=yyy
                                    on yyy és el restaurant de la fila
                        Per a la imatge, podeu fer servir la classe css ownImgTable
                        
                        Heu de definir i calcular la variable JSTL ptotal com la suma de les puntuacions
                        de cada restaurant. Auesta variable l'utilitzareu per fer una mitjana de les puntuacions
                        de tots els restaurants.
                        La mitjana és la suma de puntuacions entre el nombre de restaurants puntuats.
                        -->
                        <c:set value="0" var="ptotal" scope="page"></c:set>
                        
                        <c:forEach items="${puntuacions}" var="puntuacio" varStatus="loop">
                            <tr class="${loop.index%2 == 0? "even":"odd"}">
                                <td>
                                    <img class="ownImgTable" src="img/${puntuacio.key}.png"/>
                                </td>
                                <td>${puntuacio.key}</td>
                                <td><c:out value="${puntuacio.value}" escapeXml="false"/></td>
                                <td>
                                    <a href="<c:url value="puntuacions.jsp?rest=${puntuacio.key}"/>">Eliminar</a>
                                </td>
                            </tr>
                            <c:set value="${ptotal + puntuacio.value}" var="ptotal"></c:set>
                        </c:forEach>
                        
                        
                        <tfoot>
                            <tr>     
                                <th></th>
                                <th class="text-right">Mitjana</th>                                                                        
                                <th>
                                    <fmt:setLocale value="es_ES"/>
                                    <!-- 
                                    TODO
                                    heu de modificar value="${ptotal}" per a que realitzi la mitjana 
                                    -->
                                    <c:set value="${ptotal / puntuacions.size()}" var="ptotal"></c:set>
                                    <fmt:formatNumber value="${ptotal}" type="number"/></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                    </table>
                </div>
                <div class="col-md-2">
                   <h4><a href='<c:url value="restaurants.jsp"/>'>Tornar</a></h4>
                </div>
            </div>
        </div>
    </body>
</html>