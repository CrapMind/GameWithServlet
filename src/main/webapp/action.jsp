<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Servlet Game</title>
</head>
<body>

<%
    if ((int) session.getAttribute("step_counter") == 0 && !request.getParameter("name").isEmpty()) {
        session.setAttribute("name", request.getParameter("name"));
    }
    if ((int) session.getAttribute("step_counter") > 3) {
        session.invalidate();
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    final Map<Integer, List<String>> messages = Map.of(
            0, List.of("Ты потерял память. Принять вызов НЛО?", "Принять вызов", "Отклонить вызов"),
            1, List.of("Ты принял вызов. Поднимаешься на мостик к капитану?", "Подняться на мостик", "Отказаться подниматься на мостик"),
            2, List.of("Ты поднялся на мостик. Ты кто?", "Рассказать о себе правду", "Солгать о себе"),
            3, List.of("Победа! Игрок " + session.getAttribute("name") + " победил!", "Еще раз?", "Выход"));
    int counter = (int) session.getAttribute("step_counter");
    request.setAttribute("title", messages.get(counter).get(0));
    request.setAttribute("agree", messages.get(counter).get(1));
    request.setAttribute("deny", messages.get(counter).get(2));
%>

<section>
    <div style="text-align: center; width: 400px">
    <fieldset>
    <legend><h1>${title}</h1></legend>
        <form action="action.jsp">
            <button id="agree" type="submit">${agree}</button>
            <%session.setAttribute("step_counter", counter + 1);%>
        </form>
        <form action="lose.jsp">
            <button id="deny" type="submit">${deny}</button>
        </form>
    </fieldset>
    </div>
</section>
</body>
</html>