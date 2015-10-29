package com.greensell.model.bbs;

public class PageCount {
	int links = 10;
	int limit = 10;
	int totalpage = 0;
	
	public PageCount()
	{
		super();
	}
	
	public PageCount(int numrows)
	{
		super();
		this.totalpage = ((numrows-1)/limit)+1;
	}
	
	public PageCount(int numrows, int links, int limit)
	{
		super();
		this.links = links;
		this.limit = limit;
		this.totalpage = ((numrows-1)/limit)+1;
	}
	
	public int countOffset(int page)
	{
		int offset = (page-1) * this.limit;
		return offset;
	}
	
	public String showPaging(int pagelink, String pagename)
	{
		String str = "";
		str = "<table width=\"550\" border\"1\" align=\"center\">";
		str = str+"<tr><td align=\"center\" bgcolor=\"#CCCCCC\">";
		
		int bpage = 0;
		int boffset = 0;
		int cpage = 0;
		int coffset = 0;
		int vpage = 0;
		int noffset = 0;
		int loffset = 0;
		
//		<!-- 1������ -->
		if(pagelink != 1)
		{
			str = str+"[<a href="+pagename+"?pagelink=1&offset=0><font size=2 color=red>ó��</font></a>]";
		}
		else
		{
			str = str+"[<font size=2 color=gray>ó��</font>]";
		}
		
		bpage = pagelink-10;
		boffset = countOffset(bpage);
		if(pagelink > links)
		{
			str = str+"[<a href="+pagename+"?pagelink="+bpage+"&offset="+boffset+"><font size=2 color=blue>����10</font></a>]";
		}
		else
		{
			str = str+"[<font size=2 color=gray>����10</font>]";
		}
		
		vpage = pagelink;
		pagelink = ((pagelink-1)/links)*links+1;
		
		for(cpage = pagelink; cpage < pagelink+links;cpage++)
		{
			if(cpage>totalpage)
			{
				break;
			}
			coffset = countOffset(cpage);
			if(cpage!=vpage)
			{
				str = str+"[<a href="+pagename+"?pagelink="+cpage+"&offset="+coffset+"><font size=2 color=black>"+cpage+"</font></a>]";
			}
			else
			{
				str = str+"[<font size=2 color=red>"+cpage+"</font>]";
			}
		}
		
		noffset=countOffset(cpage);
		if((totalpage - pagelink) >= links)
		{
			str = str+"[<a href="+pagename+"?pagelink="+cpage+"&offset="+noffset+"><font size=2 color=blue>����10</font></a>]";
		}
		else
		{
			str = str+"[<font size=2 color=gray>����10</font>]";
		}
		
		loffset=countOffset(totalpage);
		if(vpage!=totalpage)
		{
			str = str+"[<a href="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"><font size=2 color=red>������</font></a>]";
		}
		else
		{
			str = str+"[<font size=2 color=gray>������</font>]";
		}
		str = str +"</td></tr></table>";
		return str;
	}
	public String showPaging(int pagelink,String pagename,String find,String search) {
		
		   String str = ""; 
				
			str="<TABLE width=\"550\" border=\"1\" align=\"center\">";
			str=str+"<TR><TD align=\"center\" bgcolor=\"#CCCCCC\">";
					
				
					int bpage = 0 ; 
					int boffset = 0 ; 

					int cpage = 0 ; 
					int coffset = 0 ; 

					int vpage = 0 ;
					int noffset = 0 ;

					int loffset = 0 ; 

		  	
//					<!-- 1 ������ -->
					if(pagelink != 1 ){
						str=str+"[<A HREF="+pagename+"?pagelink=1&offset=0&find="+find+"&search="+search+"><FONT SIZE=2 COLOR=red>ó��</FONT></A>]";
					}
					else{
						str=str+"[<FONT SIZE=2 COLOR=gray>ó��</FONT>]";
					
					}

//					<!-- ����10 -->
					bpage=pagelink - 10 ; 
					boffset= countOffset (bpage);
					if(pagelink > links){
						str = str + "[<A HREF="+pagename+"?pagelink="+bpage+"&offset="+boffset+"&find="+find+"&search="+search+"><FONT SIZE=2 COLOR=blue>����10</FONT></A>]"  ; 	
					
					}
					else{
						str = str + "[<FONT SIZE=2 COLOR=gray>����10</FONT>]"  ; 
					
					}
//					<!-- ��ũ������ -->
					vpage = pagelink ;        // ������������ ��� �ٸ������� �Ʒ��� ����� 
					pagelink= ((pagelink-1)/links)*links+1  ;   // ���� ������ ���ϱ� 
					for(cpage=pagelink; cpage < pagelink+links; cpage++) {
					 if(cpage>totalpage){  
					   break ; 
					 }
					 coffset=countOffset (cpage);
					  if(cpage!=vpage){
						  str = str + "[<A HREF="+pagename+"?pagelink="+cpage+"&offset="+coffset+"&find="+find+"&search="+search+"><FONT SIZE=2 COLOR=black>"+cpage+"</FONT></A>]"  ; 
					
					  }
					  else{
						  str = str + "[<FONT SIZE=2 COLOR=red>"+cpage+"</FONT>]"  ; 
					
					  }
					}

//					<!-- ����10 --> 
//					 for���� ���� �������� cpage�� ���� 1��ŭ �� �����Ǿ��ֱ� ������ �׳� ����Ѵ�.  
					noffset=countOffset (cpage);
					if((totalpage-pagelink) >= links){
						str = str + "[<A HREF="+pagename+"?pagelink="+cpage+"&offset="+noffset+"&find="+find+"&search="+search+"><FONT SIZE=2 COLOR=blue>����10</FONT></A>]"  ; 
					
					}
					else{
						str = str + "[<FONT SIZE=2 COLOR=gray>����10</FONT>]"  ; 
					
					}

//					<!-- ������������ -->
					loffset=countOffset (totalpage);

					if(vpage!=totalpage){
						str = str + "[<A HREF="+pagename+"?pagelink="+totalpage+"&offset="+loffset+"&find="+find+"&search="+search+"><FONT SIZE=2 COLOR=red>������</FONT></A>]"  ; 
					
					}
					else{
						str = str + "[<FONT SIZE=2 COLOR=gray>������</FONT>]"  ; 
					
					}
					
					str = str + "</TD></TR></TABLE>"  ; 
				
		      return str ; 
			}
}

