var wn = 0;
  	
    function changeImg2(num){
    	//0:mouseover  1:mousedown  2:mouseout
    	if(num==1) document.img3.src='images/1.jpg';
    	else if(num==2) document.img3.src='images/2.jpg';
    	else if(num==3) document.img3.src='images/3.jpg';
    	else if(num==4) document.img3.src='images/4.jpg';
    	else if(num==5) document.img3.src='images/5.jpg';
    	else if(num==6) document.img3.src='images/6.jpg';
    	wn = num;
    	//else document.img3.src='images/3.jpg';  //if(num==2)
     }
    
    function memoryImg(wn){
    	if(wn==1) location.href="http://naver.com";
	    	else if(wn==2) location.href="http://daum.net";
	    	else if(wn==3) location.href="http://google.com";
	    	else if(wn==4) location.href="http://facebook.com";
	    	else if(wn==5) location.href="http://nate.com";
	    	else if(wn==6) location.href="http://www.doowon.ac.kr";
	    	else return;
    	
    }