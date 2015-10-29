<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과창</title>
</head>
<script>
    //main페이지로 값 전달: 부모로 값전달하기 위해서는 opener사용
    function sendAdd(sido, gugun, dong, bigo,zipcode){
        
        opener.document.getElementById("zip").value=sido;
        opener.document.getElementById("zip").value=gugun;
        opener.document.getElementById("zip").value=dong;
        opener.document.getElementById("zip").value=bigo;
        opener.document.getElementById("zip2").value=zipcode;
    }
    //널값체크
    function check() {
        var checkValue = document.zipform.address.value;
        if(checkValue == ""){
            alert("동이름을 입력하세요.");
            document.zipform.address.focus();
            return false;
        }
    }
</script>
<body>
    <form name="zipform" method="post" onsubmit="check()">
        <table border="1" width="100%">
            <tr align="center">
                <td>동이름 검색 : <input type="text" name="address" size="15">
                    <input type="submit" value="검색">
                </td>
            </tr>
            <tr>
                <!-- 안내문 -->
                <td align=center><font color=red>※ 동이름을 입력하시고 검색 후, 아래
                        부분의<br> 우편번호를 클릭하시면 자동으로 주소가 입력됩니다.
                </font></td>
            </tr>
            <c:forEach items="${result}" var="post">
                <tr>
                    <td><a href="javascript:sendAdd(
                            '${post.sido_name}',
                             '${post.gugun_name}', 
                             '${post.dong_name}', 
                             '${post.bigo}',
                             '${post.zipcode }')"> 
                             
                            ${post.sido_name} 
                             ${post.gugun_name} 
                             ${post.dong_name} 
                             ${post.bigo} 
                             ${post.zipcode }
                        </a></td>
                </tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>