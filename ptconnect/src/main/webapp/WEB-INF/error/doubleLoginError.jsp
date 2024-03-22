<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인에러페이지</title>
</head>
<body>
    <script>
        alert("접근오류입니다.");
        self.location = "${prev_url}";
    </script>
</body>
</html>