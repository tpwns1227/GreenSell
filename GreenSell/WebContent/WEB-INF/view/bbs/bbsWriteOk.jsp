<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
${msg}

0.1초 후에 리스트로 이동합니다.
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN 2.0//EN" 
"http://www.springframework.org/dtd/spring-beans.dtd">
<meta http-equiv="Refresh" content="0.1;url=list?no=${no}"> 