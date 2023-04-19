<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: peanhatphat
  Date: 19/04/2023
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TODO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
            integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"></script>
</head>
<body style="background-image: url('img/background.jpg'); background-size: cover">
        <c:if test="${success=='success'}">
            <div style="color: aquamarine; text-align: center"> <h3>${message}</h3></div>
            <audio autoplay>
                <source src="audio/tiengvotay.mp3" type="audio/mpeg">
            </audio>


        </c:if>
    <div class="container">
        <h1 class="mt-3 " style="text-align: center ; color: cyan"> Chào Mừng Bạn Đến Với Game ToDo</h1>
        <form action="play" method="post">
            <div class="mb-3">
                <label class="mt-3 " style="text-align: center ; color: cyan" class="form-label">Tên Của Bạn </label>
                <input type="text" class="form-control" id="idUsername " name="username" required >
            </div>
                <button type="submit" class="btn btn-primary" style="margin: 0 auto">Bắt Đầu</button>
        </form>

    </div>
    <div class="container">
        <h2 style="color: darkorange">Bản Xếp Hạng</h2>
        <table class="table table-success table-striped">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Tên Người Chơi</th>
                <th scope="col">Số Lần Đoán</th>

            </tr>
            </thead>



        <tbody>
        <c:forEach varStatus="loop" var="item" items="${userArrayList}">

            <tr>
                <th scope="row">${loop.index+1}</th>
                <td>${item.getUsername()}</td>
                <td>${item.getCount()}</td>
            </tr>
        </c:forEach>
        </tbody>
        </table>

    </div>

</body>
</html>
