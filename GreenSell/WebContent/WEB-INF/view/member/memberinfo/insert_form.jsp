<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>입력폼</h3>
 <hr>
  <form method="post" action="result">
    <input type="text" name="email"> <br>
    <input type="password" name="password"> <br>
    <input type="text" name="name"> <br>
    <input type="text" name="nickname"><br>
    <input type="text" name="phone"><br>
    <input type="text" name="address"><br>
    <input type="text" name="bank"><br>
    <input type="text" name="account"><br>
    <select name="question">
       <option value="니엄마">니엄마?</option>
       <option value="니애비">니애비?</option>
    </select>
    <input type="text" name="answer">
    <input type="text" name="point">
    <input type="text" name="grade">
    <input type="text" name="report">
     <input type="submit" value="등록">
  </form>
</body>
</html>