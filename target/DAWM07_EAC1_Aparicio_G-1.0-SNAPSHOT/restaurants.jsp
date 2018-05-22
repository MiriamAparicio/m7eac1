<%-- 
    Document   : restaurants
    Created on : 9-sep-2017, 16:22:41
    Author     : Alex Salinas / Miriam Aparicio
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Map<String, Integer> puntuacions = new HashMap<String, Integer>();
    List<String> restaurants = new ArrayList<String>();
%>
<%
    //Definim aquestes variables per fer-les servir al BODY
    String restaurant = "";

    /*
     TODO
     Els restaurants a puntuar són els que podeu veure a la carpeta img 
     (excepte star-0.png, star-1.png i valoracio.png)
     Fem coincidir el nom del restaurant amb el nom del fitxer sense l'extensió
     (Aupres, Cepages, Grenier,...)
     
     Què heu de fer?
     Afegir tots els restaurants en el cas que la variable 'restaurant' estigui 
     buida.
     */
    if (restaurants.isEmpty()){
        
        restaurants.add("Aupres");
        restaurants.add("Cepages");
        restaurants.add("Grenier");
        restaurants.add("Lamelolise");
        restaurants.add("Levernois");
        restaurants.add("Montrachet");
        restaurants.add("Pierre");
        restaurants.add("PontdeParis");
        
    }

       /*
     TODO
     L'aplicació ha d'emmagatzemar la puntuació que l'usuari ha donat als 
     restaurants. 
        
     Llavors, quan l'usuari ha fet clic a un dels enllaços en forma d'estel,
     la puntuació associada es guardarà al 'Map' anomenat 'puntuacions'.
     
     La URL associada a cadascuna dels estels és 
    
     .../restaurants.jsp?rest=xxx&punts=yyy
     on xxx és el nom del restaurant y 'yyy' és la puntuació.
     
     A continuació heu de recuperar el nom del restaurant i la puntuació
     donada. En el cas que no estiguin buits, afegiu-lo al Map 'puntuacions'.
        
     */
       String rest = request.getParameter("rest");
       String punts = request.getParameter("punts");
       if (rest!= null && punts != null){
           puntuacions.put(rest, Integer.valueOf(punts));
       }
      
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Llistat de Restaurants</title>
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
                <div class="col-md-8">
                    <h1>Restaurants</h1>
                </div>
                <div class="col-md-2">
                    <h1>Puntuacions</h1>
                </div>
            </div>                
            <div class="row">
                <div class="col-md-8">
                    <div class="row textcenter">
                        <% 
                        /*
                        TODO
                        
                        Què és vol fer?
                        Es vol mostrar tots els restaurants. S'ha de mostrar
                        el seu nom, la fotografia i el nombre d'estels (puntuació)
                        del restaurant.
                        
                        Com?
                        Realitza un bucle que recorri tots els restaurants de 
                        l'array.
    
                        Recupereu el nom del restaurant actual guardant-lo 
                        a la variable 'restaurant' definida al inici del document.
                        A més a més, Emmagatzemeu la variable 'restaurant', com un atribut que
                        tingui el mateix nom, al context de la pàgina (pageContext).
                        
                        IMPORTANT:
                        Una vegada ho has realitzat, NO tanquis el bucle. L'HTML
                        que hi ha a continuació es part del cos del bucle.
                        */
                        
                        for (String unRestaurant: restaurants){
                            restaurant = unRestaurant;
                            pageContext.setAttribute("restaurant", restaurant);
   
                        %>

                        <div class="col-md-3 divRestaurant ">
                            <div class="row" >
                            <h4>
                                <!--
                                TODO
                                Mostreu en negreta el nom del restaurant actual.                                
                                -->
                                <b><%=restaurant%></b>
                                
                            </h4>
                            <div class="row">
                                 <!--
                                TODO
                                Inseriu un element img class="img-responsive ownImgTable col-centered" amb
                                src de la carpeta img el restaurant xxx.png (on xxx ha de ser variable)
                                -->
                                <img class="img-responsive ownImgTable col-centered" src="img/<%=restaurant%>.png"/>
                            </div>
    
                            </div>
                            <div class="row col-centered" >
<!--
                                TODO
                                Com podeu veure a les imatges de l'enunciat, es mostren uns 
                                estels que corresponen a la puntuació de l'usuari.

                                Què heu de fer?

                                Mostrar correctament el nombre d'estels de color groc i blanc.
                                S'han de mostrar tants estels de color groc com puntuació ha 
                                obtingut el restaurant.
                                Sempre s'han de visualitzar 5 estels i no tenen cap enllaç associat. 
                                Són simples imatges.
                                
                                En el cas que encara no s'hagi puntuat es mostraran
                                5 estels blancs (star-0.png) amb un enllaç que indica el nom del 
                                restaurant i la puntuació que li dóna l'usuari.

                                Com?
                                Heu de mirar si el Map 'puntuacions' conté el restaurant,
                                    Si el conté, llavors heu de mirar la puntuació.
                                        Aquesta us dirà quants estels de color groc (star-1.png) heu
                                        de posar de la següent manera:
                                            <div class="col-md-2">  
                                                <img  class="icon" ..../>
                                            </div>   
                                        Una vegada heu posat els estels grocs, haureu de calcular
                                        quants estels de color blanc (star-0.png) us falten per 
                                        arribar a 5 i posar-los de la següent manera:
                                            <div class="col-md-2">  
                                                <img  class="icon" .../>
                                            </div>    
                                    
                                    Si no el conté, llavors
                                        heu de mostrar 5 estels blancs on cadascun d'ells té
                                        associat un enllaç amb el nom del restaurant i la
                                        puntuació:
                                            <div class="col-md-2"> 
                                                <a href='xxx'><img  class="icon"....></a>
                                                <a href='xxx'><img  class="icon"....></a>
                                                <a href='xxx'><img  class="icon"....></a>
                                                <a href='xxx'><img  class="icon"....></a>
                                                <a href='xxx'><img  class="icon"....></a>
                                            </div>                                      
                                            on xxx l'heu de construir amb JSTL i la url ha de ser:
                                            restaurant.jsp?rest=yyy&punts=zzz
                                                on yyy és el restaurant
                                                i  zzz és la puntuació (pot ser: 1,2,3,4, o 5).
                                            Feu un bucle for del 1 al 5 per construir amb JSTL 
                                            les url amb els enllaços anteriors.
                                -->                                                  
                                <%
                                                                   
                                if (puntuacions.containsKey(restaurant)){
                                        
                                        int estrellesGrogues = puntuacions.get(restaurant);
                                        
                                        for(int i = 0; i < estrellesGrogues; i++){
                                            
                                            out.println("<div class=\"col-md-2\"><img class=\"icon\" src=\"img/star-1.png\"/></div>");
                                        }
                                        
                                        for(int i = estrellesGrogues; i < 5; i++){
                                            
                                            out.println("<div class=\"col-md-2\"><img class=\"icon\" src=\"img/star-0.png\"/></div>");
                                        }
                                        
                        
                                    } else {
                                        
                                       %>
                                        <c:forEach varStatus="loop" begin="1" end="5">
                                            <div class="col-md-2">
                                                <a href="<c:url value="restaurants.jsp?rest=${restaurant}&punts=${loop.index}"></c:url>"><img class="icon" src="img/star-0.png"/></a>
                                            </div>
                                        </c:forEach>
                                        
                                        <%  

                                    }
                                %>
                            </div>
                        </div> 
                            
                        <%
                          }
                        %>
                       </div>        
                            
                </div>
                      
                <div class="col-md-4 " >
                    <div class="row col-centered" >
                    <img class = "img-responsive ownImgTable" src='img/valoracio.png'/>
                    </div>
                    <div class="row">
                        <div class="col-md-6 textcenter">

                            <%
                                /*
                                 TODO
                                 Calculeu el valor de quantitat: Nombre de restaurants puntuats
                                 Calculeu el valor Millor Restaurant: Nom de la restaurant millor puntuat
                                 */
                                int quantitat = puntuacions.size();
                                String millorRestaurant = "";
 
                                /*
                                TODO
                                Per calcular el millor restaurant heu de recòrrer el map anomenat puntuacions.
                                Ho podeu fer amb un bucle de tipus for on a cada volta mireu si la puntuació
                                és la més alta.
                                Per exemple, el for ha de ser així:
                                for (Map.Entry<String, Integer> v : puntuacions.entrySet())
                                
                                on v és l'assossiació <restaurant,puntuació>
                                
                                En cas que sigui més alta, la variable millor s'actualitzarà amb el
                                nom del restaurant. 
                                */
                                
                                int millorPuntuacio = 0;
                                
                                for (Map.Entry<String, Integer> v: puntuacions.entrySet()){
                                    
                                    if (v.getValue()> millorPuntuacio) {
                                        
                                        millorPuntuacio = v.getValue();
                                        millorRestaurant = v.getKey();
                                    }
                                                                        
                                }

                            %>
                            
                            
                            <!-- 
                            TODO
                            Mostreu les variables quantitat' i 'millor' calculades 
                            anteriorment
                            -->
                            <h4>
                                Puntuats:  <%= quantitat%>
                            </h4>
                            <h4>
                                Millor:   <%=millorRestaurant%>
                            </h4>
                            <h4><a href='<c:url value="puntuacions.jsp"/>'>Veure</a></h4>
                            <%
                                /*
                                 TODO
                                 Necessitarem que les variables restaurant i puntuacions
                                 siguin accessibles desde JSTL. Ho necessitareu a puntuacions.jsp
                                 Què heu de fer?
                                 Feu que restaurant i puntuacions siguin accessibles desde JSTL
                                 */                        
                                session.setAttribute("restaurants", restaurants);
                                session.setAttribute("puntuacions", puntuacions);
                            %>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>

