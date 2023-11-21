<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<body>
<h2>Create Car</h2>

<form action="/create-recipeDeprecated" method="post" enctype="multipart/form-data">

    <div>
        <label>Crie sua receita</label>
        <input type="text" name="recipe-name" id="recipe-name" value="${param.name}">
        <input type="text" name="recipe-preparation" id="recipe-preparation" value="${param.name}">
        <input type="text" name="recipe-ingredient" id="recipe-ingredient" value="${param.name}">
    </div>
    <br>
    <div>
        <label>Insira a imagem</label>
        <input type="file" name="image" id="image">
    </div>
    </br>
    <button type="submit">Register</button>

</form>

</body>
</html>