<html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html" charset=UTF-8>
<body>
<h2>Create Car</h2>

<form action="/create-recipe" method="post" enctype="multipart/form-data">

    <div>
        <label>Car Name</label>
    </div>
    <div>
        <label>Image</label>
        <input type="file" name="image" id="image">
    </div>
    <button type="submit">Register</button>

</form>

</body>
</html>