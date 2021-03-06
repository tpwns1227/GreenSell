<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/detail.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script>
	$(document).ready(function(){
		$("#bid").click(function(){
			if('${skey}' == '' || '${skey}' == null){
				alert('로그인을 한 후에 이용해 주세요.');
				location.href="login_form";
				return;
			}
				if($("#fintime").text()=='마감종료'){
					alert("이미 마감된 상품입니다.");
					return;
				}
				
				
				var bid = window.open('bid_form', "post",
					     "toolbar=no ,width=450 ,height=200 ,directories=no,"
					           + "status=yes,scrollbars=yes,menubar=no");
				
				});
		
		
		
	var chk = '';
	
	setInterval(function () {	
		var str = $("#fintime").text();
		var d = str.substring(0,str.indexOf('일'));
		if(d<0){
			clearInterval(timer);
			$("#fintime").html("<font size='5px' color='red'>마감종료</font>");
			
			$.ajax({
				url: 'buychk',
				data: 'itemno=${auctionitem.no}',
				type:'post',
				success : function(data){ 
					chk=data;
				}
			});
		}
		
		if(chk=='미존재'){
			$.ajax({
				type:"post",
				url: "auctionok",
				data: "itemno=${auctionitem.no}&rvemail=${auctionitem.email}&itemname=${auctionitem.itemname}&buyemail=${auctionitem.getNowemail()}",
				success : function(data){
					chk='존재';
				}
			});
		}
		
	},1);
		
		
		
		var findate = new Date('${auctionitem.finishtime}');
		var finmonth = findate.getMonth();
		var findate = findate.getDate();
		var timer = setInterval(function () {        // 타이머
			 $.ajax({ 
		         url : "time",
		         success : function(data){ 
		        	 var nowdate = new Date(data);
		        	 var fM = (finmonth+1) - (nowdate.getMonth()+1);
		        	 var fd = findate - nowdate.getDate(); 
		        	 var i=0;
		        	 if(fM!=0){ // 마감일과 현재날짜의 달이 다르면
		        		 for(i; i<10; i++){
		        			 var ndate = new Date(nowdate.setDate(i));
		        			 if(ndate.getDate()==findate){
		        				 i=i-1;
		        				 break;
		        			 }
		        		 } 
		        	 }else{
		        		 i = fd;
		        	 }
		        	 var fh = 23 - nowdate.getHours();
		        	 var fm = 59 - nowdate.getMinutes();
		        	 var fs = 60 - nowdate.getSeconds();
		        	 if((i-1)!=0){
		        		 $("#fintime").html((i-1)+"일   "+fh+"시간"+fm+"분"+fs+"초 전");
		        	 }else{
		        		 $("#fintime").html(fh+"시간"+fm+"분"+fs+"초 전");
		        	 }
		         } 		 
		      });
        }, 1000);
		
		
		setInterval(function () {	
			if('${auctionitem.no}'!=null && '${auctionitem.no}'!=''){
			$.ajax({
				url: 'auctionre',
				data: 'no=${auctionitem.no}',
				success : function(data){ 
					var spl = data.split(",");
					if(spl[2]=='0'){
						$("#nowemail").html('없음');//입찰자
					}else{
					$("#nowemail").html(spl[0]);//입찰자
					}
					$("#nowprice").html(Number(spl[1]).toLocaleString().split('.')[0]+"원");
					$("#num").html(spl[2]);//입찰횟수
					
				}
			});}
		},10);
		
		
		
		
		$("#selectedbtn").click(function(){
			var howsell='';
			var itemno=0;
			
			if('${skey}' == '' || '${skey}' == null){
				alert('로그인을 한 후에 이용해 주세요.');
				location.href="login_form";
				return;
			}
			
			if('${skey}'=='${auctionitem.email}' || '${skey}'=='${itemone.email}'){
				alert("자신의 게시물에는 찜을 할수 없습니다.");
				return;
			}
			
			if('${auctionitem.howsell}'=='경매'){
				howsell='경매';
				itemno='${auctionitem.no}'}else{
				howsell='중고';
				itemno='${itemone.no}'}
			 $.ajax({ 
				 type : "post",
					url : "insert_cart",
					data : 'email='+'${skey}'+'&itemno='+itemno,
					success : function(data){ 
						if(data=='ok'){
							alert('찜목록에 추가되었습니다.');
						}else{
							alert('이미 찜목록에 존재하는 상품 입니다.');
						}
						
					}
		          
		      });
		 });

		$(".simg").click(function(){
			var s = $(this).attr('src');
			$(".mimg").attr('src', s);
		});
		
		
		$("#updateitem").click(function(){
			if($("#sellresult").text()=='판매 완료'){
				alert("이미 판매가 완료된 상품은 수정하실 수 없습니다.");
				return;
			}
			
			location.href="updateitem_form?no=${itemone.no}";
		});
		
		$("#deleteitem").click(function(){
			if($("#sellresult").text()=='판매 완료'){
				alert("이미 판매가 완료된 상품은 수정하실 수 없습니다.");
				return;
			}
			if(confirm('정말로 삭제하시겠습니까? \r\n 두번 안 묻습니다.'))
			{
			location.href="deleteitem?no=${itemone.no}";
			}else{return;}
		});
		
		
		$("#email").click(function(){
			if('${skey}' == '' || '${skey}' == null){
				alert("이용하시려면 먼저 로그인을 해주세요.");
				return;
				}
			if('${auctionitem.getHowsell()}'=='경매'){
				window.open('sell_contact?email=${auctionitem.email}','_blank','width=1000 height=700');
			}
			else
			{
			window.open('sell_contact?email=${itemone.getEmail()}','_blank','width=1000 height=700');
			}	
				
						
		});
		var point = parseInt('${point}');
		var price = parseInt('${itemone.getItemprice()}');
		
		$("#safe").click(function(){
			if('${skey}' == '' || '${skey}' == null){
				alert("이용하시려면 먼저 로그인을 해주세요.")
				return;
				}
			if('${skey}'=='${itemone.email}'){
				alert("자신의 게시물에는 거래신청을 할 수 없습니다.");
				return;
			}
			if($("#sellresult").text()=='판매 완료'){
				alert('이미 판매된 상품입니다.');
				return;
			}
			if(point<price){
				alert('포인트가 부족합니다.');
				return;
			}
			
				
			if(confirm("정말로 입찰하시겠습니까?\n 입찰 하시게 되면 포인트에서 차감됩니다.")){
				
				$.ajax({
					type:"post",
					url: "sellok",
					data: "itemno=${itemone.no}&rvemail=${itemone.email}&itemname=${itemone.itemname}&price=${itemone.itemprice}",
					success : function(data){ 
						$("#point").html("<font color='red'>"+data+"</font>");
					}
				});
				
				$("#sellresult").html("<font size='5px' color='red'>판매 완료</font>");
			}else{
				return;
			}
				
			
		});
			
		

	});
	
</script>
</head>
<body>
	<c:set var="nprice" value="" />
		
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='test'>
	<div class="container3">
		
		<div class='img' style='text-align: left;'>
			<img id="bigimg" src='/GreenSell/img/item/${imglist.get(0)}' class='mimg'>
			
			<c:forEach var="img" items="${imglist}">
				<img src="/GreenSell/img/item/${img}" class='simg'>
			</c:forEach>
			<c:if test="${itemone.getEmail()==skey && auctionitem.getHowsell()!='경매'}">
			<br>
				<input id="updateitem" class='callbtn' type="button" value="수정" style='width: 195px'>
				<input id="deleteitem" class='callbtn' type="button" value="삭제" style='width: 195px'>
			</c:if>
			<c:if test="${auctionitem.getHowsell()=='경매'}">
			<br>
				<input class='callbtn' id="bid" type="button" value="입찰하기" style='width: 150px'>
				<input class='callbtn' id="selectedbtn" type="button" value="찜 하기" style='width: 90px'>
				<input class='callbtn' id="email" type="button" value="연락처" style='width: 150px'>
				<br><font size="4px"><strong>입찰자</strong></font><br>
				<c:if test="${auctionitem.getNowemail()==auctionitem.getEmail()}">
				<label id="nowemail">없음</label>
				</c:if>
				<c:if test="${auctionitem.getNowemail()!=auctionitem.getEmail()}">
				<label id="nowemail">${auctionitem.getNowemail()}</label>
				</c:if>
			</c:if>
		</div>
			
		<c:if test="${itemone.getHowsell() == '중고'}">
		<div class='info'>
		<span id="sellresult"><font size='5px' color='red'>${itemone.getSellstate()}</font></span>
			<div class='bold3'>제품명</div>
			<div class='font2'>${itemone.getItemname()}</div>
						<div class='bold3'>가격</div>
			<div class='font2'><fmt:formatNumber value="${itemone.getItemprice()}"/>원</div>	
			
			<div style='float: right;     margin-right: 88px;'>
			<table width='400px'>
			
			<tr>
			<td width="280px"><div class='bold2' style='margin-left: 0px; margin-right: 0px'>판매방법</div>
			<div class='font' style='margin-left: 0px; margin-right: 0px'>${itemone.getHowsell()}</div></td>
			<td><div class='bold2' style='margin-left: 0px; margin-right: 0px'>제품상태</div>
			<div class='font' id='num' style='margin-left: 0px; margin-right: 0px'>${itemone.getItemstate()}</div></td>
			</tr>
			<tr>
			<td colspan='2'><div class='bold2' style='margin-left: 0px; margin-right: 0px'>카테고리</div>
			<div class='font' style='margin-left: 0px; margin-right: 0px'>${itemone.getCategory()}</div></td>
			</tr>
			<tr>
			<td colspan='2'><div class='bold2' style='margin-right: 0px;'>판매자</div>
			<div class='font' id="wemail" style='margin-right: 0px;'>${itemone.getEmail()}</div></td>
			</tr>
			</table>	
			</div>
			<div style='float: right;    margin-right: 88px;'>
			<div class='bold2' style='margin-right: 0px;'>설명</div>
			<textarea class='tb' readonly style='margin-right: 0px;'>${itemone.getItemdetail()}</textarea>
			 </div>
			 <div style='float: right;    margin-right: 88px;'>
				<input type="hidden" value="${itemone.getEmail() }" name="em">
				<input type="hidden" value="${itemone.getNo() }" name="no">
				<input class='callbtn' id="email" type="button" value="연락처" style='width: 150px'>
				
			<input class='callbtn' type="button" id="safe" value="안전거래" style='width: 150px'>
			<input class='callbtn' type="button" id="selectedbtn" value="찜 하기" style='width: 100px'> 
			</div>
		
		
		</div>
		</c:if>
		<c:if test="${auctionitem.getHowsell()=='경매'}">
		
	
		
		
		<div class='info2'>
			
			<div class='bold3'>제품명</div>
			<div class='font2'>${auctionitem.getItemname()}</div>
			
			<div class='bold3'>경매시작가</div>
			<div class='font2' id="startprice" style="font-size: 15px"><fmt:formatNumber value="${auctionitem.getStartprice()}"/>원</div>
			<input type="hidden" id="startpr" value="${auctionitem.getStartprice()}">
			<div class='bold3' >현재가격</div>
			<div class='font2' id="nowprice" style='color: blue'><fmt:formatNumber pattern="#,##0" value="${auctionitem.getNowprice()}"/>원</div>
			<input type="hidden" id="nowpr" value="${auctionitem.getNowprice()}">
			<div class='bold3'>마감시간</div>
			<div class='font2' style='font-size: 30px; color: green' id="fintime"></div>
			<div style='float: right'>
			<table width='350px'>
			<tr>
			<td width="160px"><div class='bold2' style='margin-left: 0px; margin-right: 0px'>제품상태</div>
			<div class='font' style='margin-left: 0px; margin-right: 0px'>${auctionitem.getItemstate()}</div></td>
			<td><div class='bold2' style='margin-left: 0px;'>입찰횟수</div>
			<div class='font' id='num' style='margin-left: 0px;'>${auctionitem.getTendernumber()}</div></td>
			</tr>
			<tr>
			<td><div class='bold2' style='margin-left: 0px; margin-right: 0px'>판매방법</div>
			<div class='font' style='margin-left: 0px; margin-right: 0px'>${auctionitem.getHowsell()}</div></td>
			<td><div class='bold2' style='margin-left: 0px;'>카테고리</div>
			<div class='font' style='margin-left: 0px'>${auctionitem.getCategory()}</div></td>
			</tr>
			<tr>
			<td colspan='2'><div class='bold2'>판매자</div>
			<div class='font' id="wemail">${auctionitem.getEmail()}</div></td>
			</tr>
			</table>
			</div>
			<div>			
			
			<div style='text-align: right; float: right'>
			<div class='bold2'>설명</div>
			<textarea style='margin-right: 85px' class='tb' readonly>${auctionitem.getItemdetail()}</textarea>
			</div>
			</div>	
		</div>
		</c:if>
	</div>
	</div>
	
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>
