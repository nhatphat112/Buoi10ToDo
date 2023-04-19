<%--
  Created by IntelliJ IDEA.
  User: peanhatphat
  Date: 19/04/2023
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Play TODO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
            integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"></script>
</head>
<body style="background-image: url('img/background-play.jpg');background-size: cover; background-repeat: no-repeat">
        <% String path = request.getContextPath();%>
        <div class="container">
            <h2 class="mt-4" style="color: darksalmon ; text-align: center"> Xin Chào <c:out value="${users.getUsername()}"></c:out></h2>
            <form action="play" method="post">
                <div class="mb-3">
                    <label class="mt-3 " style="text-align: center ; color: cyan" class="form-label">Hãy Nhập Một Số </label>
                    <input type="text" class="form-control"  name="chooseUser" required >
                </div>
                <input style="display: none" type="text" class="form-control"  name="count" value="${users.getCount()}"  >
                <input style="display: none" type="text" class="form-control"  name="valueRandom" value="${users.getValueRandom()}"  >
                <input style="display: none" type="text" class="form-control"  name="username" value="${users.getUsername()}"  >


                <button type="submit" class="btn btn-primary" style="margin: 0 auto">Đồng ý</button>
            </form>
            <div class="mt-3" style="color: darkseagreen"><h3>${message}</h3></div>

        </div>

</body>
</html>
