<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/GreenSellEX/js/jquery.glide.min.js"></script>
<script type="text/javascript" src="/GreenSellEX/js/jquery-1.10.2.min.js"></script>


<script type="text/javascript">

	function inputnext(nextid, did){
		var nexttag = document.getElementById(nextid);
		nexttag.style.display = '';
		inputdisabled(did);
		buttondisabled(did);
		location.href='#a'+nextid;
	}
	
	function inputbefore(beforeid, id, beforeattr){	
		var tag = document.getElementById(id);
		tag.style.display = 'none';
		reinput(beforeattr);
		rebutton(beforeattr);
		location.href='#a'+beforeid;
	}
	
	function selectionNext(nextid, dname){
		var str = eval('document.inputproduct.'+dname+'.value');	
		if(str!=null && str!=''){
			var nextele = document.getElementById(nextid);
			nextele.style.display='';
			buttondisabled(dname);
			var list = document.getElementsByName(dname);
			for(i=0;i<list.length;i++){
				var rd = eval('document.inputproduct.'+dname+'[i]');
				rd.disabled = true;
			}
			location.href='#a'+nextid;
		}else{
			alert("항목을 선택해 주세요.");
			return;
		}
	}
	
	function Beforeselection(beforeid, id, beforeattr){
		document.getElementById(id).style.display = 'none';
		var list = document.getElementsByName(beforeattr);
		for(i=0;i<list.length;i++){
			var rd = eval('document.inputproduct.'+beforeattr+'[i]');
			rd.disabled = false;
		}
		rebutton(beforeattr);
		location.href='#a'+beforeid;
	}
	
	function buttondisabled(id){
		var btnele = document.getElementById("n"+id+"btn");
		btnele.setAttribute("disabled", "disabled");
		var btnele2 = document.getElementById("b"+id+"btn");
		if(btnele2!=null){
			btnele2.setAttribute("disabled", "disabled");
		}
	}
	function rebutton(beforeattr){
		var btnele = document.getElementById("n"+beforeattr+"btn");
			btnele.removeAttribute("disabled");
		var btnele2 = document.getElementById("b"+beforeattr+"btn");
		if(btnele2!=null){
			btnele2.removeAttribute("disabled");
		}
	}
	
	function inputdisabled(id){
		var ele = document.getElementById(id);
		ele.setAttribute("readOnly", true);
	}
	
	function reinput(beforeattr){
		var ele = document.getElementById(beforeattr);
		ele.removeAttribute("readOnly");
	}
	
	
	
</script>

</head>
<body>
	<form name="inputproduct" action="home">
	<center>
		<a id="aproductpname"></a>
		<fieldset id="productname" style="border: none;">
			<fieldset style="width: 660px; margin: 400px;">
				<legend>제품명을 입력해 주세요.</legend>
				<input type="text" id="pname">&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="button" id="npnamebtn" value="다음" onclick="inputnext('selection','pname')">
			</fieldset>
		</fieldset>
		
		
			<a id="aselection"></a>
		<fieldset id="selection" style="border: none; display: none">
			<fieldset style="width: 660px; margin: 400px;">
				<legend>판매 방법</legend>
				<input type="radio" value="auction" name="selltype" id="selltype">경매 <input
					type="radio" value="sell" name="selltype" id="selltype">판매
					<br>
					<input type="button" id="nselltypebtn" value="다음" onclick="selectionNext('categorys','selltype')">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="bselltypebtn" value="이전" onclick="inputbefore('productname','selection', 'pname')">			</fieldset>
		</fieldset>
		
		
		
			<a id="acategorys"></a>
		<fieldset id="categorys" style="border: none; display: none">
			<fieldset style="width: 660px; margin: 400px;">
				<legend>카테고리 선택</legend>
				<input type="radio" name="category" id="category" value="cg">의류/잡화 <input
					type="radio" name="category" id="category" value="fe">가구/전자 <input
					type="radio" name="category" id="category" value="ts">여행/스포츠 <input
					type="radio" name="category" id="category" value="bt">도서/티켓 <input
					type="radio" name="category" id="category" value="besides">기타
					<br>
					<input type="button" id="ncategorybtn" value="다음" onclick="selectionNext('pprice','category')">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="bcategorybtn" value="이전" onclick="Beforeselection('selection','categorys','selltype')">
			</fieldset>
		</fieldset>
		
		
			<a id="apprice"></a>
		<fieldset id="pprice"  style="border: none; display: none">
			<fieldset style="width: 660px; margin: 400px;">
				<legend>가격 설정</legend>
				<input type="text" id="price">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="npricebtn" value="다음" onclick="inputnext('pstate', 'price')">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="bpricebtn" value="이전" onclick="Beforeselection('categorys','pprice','category')">
			</fieldset>
		</fieldset>
		

		<a id="apstate"></a>
		<fieldset id="pstate" style="border: none; display: none">
			<fieldset  style="width: 660px; margin: 400px;">
				<legend>판매 방법</legend>
				<input type="radio" name="state" id="state" value="beforerelease">미개봉
				<input type="radio" name="state" id="state" value="Aclass">A급 <input
					type="radio" name="state" id="state" value="Bclass">B급 <input
					type="radio" name="state" id="state" value="Cclass">C급
					<br>
					<input type="button" id="nstatebtn" value="다음" onclick="selectionNext('pcontent','state')">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="bstatebtn" value="이전" onclick="inputbefore('pprice','pstate', 'price')">
					
			</fieldset>
		</fieldset>
		
		
		
		<a id="apcontent"></a>
		<fieldset id="pcontent" style="border: none; display: none">
			<fieldset style="width: 660px; margin: 400px;">
				<legend>추가정보 입력</legend>
				<textarea id="content" cols="80" rows="10"></textarea><br>
				<input type="button" value="다음" id="ncontentbtn" onclick="inputnext('pphoto', 'content')">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="bcontentbtn" value="이전" onclick="Beforeselection('pstate', 'pcontent', 'state')">
			</fieldset>
		</fieldset>
		
		
		<a id="apphoto"></a>
		<fieldset id="pphoto" style="border: none; display: none">
			<fieldset style="width: 660px; margin: 400px;">
				<legend>사진 추가</legend>
				
				
				
				<input type="submit" value="완료">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="bphotobtn" value="이전" onclick="Beforeselection('pcontent', 'pphoto', 'content')">
				
				
				
				
			</fieldset>
		</fieldset>


	</center>
</form>


</body>
</html>