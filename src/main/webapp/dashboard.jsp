<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
  <div>
    <h1>Receitas</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="receita" items="${receitas}">
            <tr>
                <td>${receita.idReceita}</td>

                <td>${receita.nomeReceita}</td>

                <form action="/delete-recipe" method="post">

                <input type="hidden" id="idReceita" name="nomeReceita" value="${receita.idReceita}">

                <button type="submit">Delete</button>

                <span> | </span>

                <a href="index.jsp?id=${receita.idReceita}&name=${receita.nomeReceita}">Atualizar Receitas</a>

                </form>


            </tr>
        </c:forEach>
    </table>
  </div>
</body>
</html>