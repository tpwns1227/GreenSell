<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결과창</title>
<link rel="stylesheet" type="text/css" href="css/zip.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
</head>
<script>
    //main페이지로 값 전달: 부모로 값전달하기 위해서는 opener사용
    function sendAdd(zipcode,sido, gugun, dong, bunji){
    	opener.document.getElementById("zip").value=zipcode;
    	var adr = sido + " " + gugun + " " + dong + " " + bunji;
     	opener.document.getElementById("zip2").value=adr;
        window.close();
    }
    //널값체크
    function check() {
        var checkValue = document.zipform.address.value;
        if(checkValue == ""){
            alert("동이름을 입력하세요.");
            document.zipform.address.focus();
            return false;
        }else{
        	 /* $.ajax({ 
		         type : "post", 
		         url : "zip_result", 
		         data : "address="+$("input[name='address']").val(),
		         success : function(data){ 
		        	if(data == '결과있음'){
		        		
		        	}else{
		        		alert(data);
		        		return;
		        	}
		         } 
		      });  */
		      document.zipform.submit();
        }
        
       
    }
</script>
<body>
    <form name="zipform" method="post" action="zip_result">
        <table width="450px" style='border: 0px none'>
            <tr align="center">
                <td><div class='border'>동 이름 검색</div>
                <input class='textbox' type="text" name="address" size="15">
                    <input class='button' type="button" value="검색" onclick="check()">
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
                            '${post.zipcode }',
                            '${post.sido}',
                            '${post.gugun}', 
                            '${post.dong}', 
                             '${post.bunji}')"> 
                      
                            ${post.zipcode }
                            ${post.sido} 
                             ${post.gugun} 
                             ${post.dong} 
                             ${post.bunji} 
                             
                        </a></td>
                </tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>