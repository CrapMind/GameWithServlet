<%--
  Created by IntelliJ IDEA.
  User: omen
  Date: 02.12.2022
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Servlet Game</title>
</head>
<body>
<% request.setAttribute("name", session.getAttribute("name"));%>
<section>
    <div style="text-align: center; width: 400px">
        <fieldset>
            <legend><h1>${name} Ты проиграл!</h1></legend>
            <%session.invalidate();%>
            <form action="index.jsp">
                <button id="agree" type="submit">Еще раз?</button>
            </form>
        </fieldset>
    </div>
</section>
</body>
</html>
