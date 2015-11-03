<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<form action="updateok" method="post">
<div class='container'>
         <div class='border'>글수정</div>
         <div class='p'>제목</div>
         <input class='textbox' name="title" type='text' value=" ${view.title}">
         <br>
         <div class='p'>작성자</div>
         <input class='textbox' type='text' value="${view.email}" name="email"
            readonly="readonly"> <br>
         <div class='p'>내용</div>
         <textarea name="bbscontent">${view.bbscontent}</textarea>
         <input class='button' type='button' value='목록' style='width: 200px'
            onclick="location.href='list?no=${view.bbsno}'">   
                <input class='button'
            type='submit' value='수정' style='width: 200px' onclick="location.href='updateok'">      
			<input type="hidden" value="${view.no }" name="no">
      </div>
 </form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>