<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한에러페이지</title>
</head>
<body>
    <script>
        alert("페이지 접근권한이 없습니다.");
        self.location = "${pageContext.request.contextPath}/findTrainer";
    </script>
</body>
</html>