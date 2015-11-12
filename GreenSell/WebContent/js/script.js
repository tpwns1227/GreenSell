var wn = 0;
  	
    function changeImg2(num){
    	//0:mouseover  1:mousedown  2:mouseout
    	if(num==1) document.img3.src='/GreenSell/img/useimg/초록이3.jpg';
    	else if(num==2) document.img3.src='/GreenSell/img/useimg/logo.png';
    	else if(num==3) document.img3.src='/GreenSell/img/useimg/1untitled.png';
    	wn = num;
    	//else document.img3.src='images/3.jpg';  //if(num==2)
     }
    
    function memoryImg(wn){
    		if(wn==1) location.href="http://naver.com";
	    	else if(wn==2) location.href="http://daum.net";
	    	else if(wn==3) location.href="http://google.com";
	    	else return;
    	
    }