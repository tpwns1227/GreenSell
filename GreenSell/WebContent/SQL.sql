create table Member( 
   email varchar2(50) primary key not null,
   password varchar2(50) not null,
   name varchar2(20) not null,
   nickname varchar2(30) not null,
   phone varchar2(20) not null,
   zipcode varchar2(10) not null,
   address varchar2(200) not null,
   bank varchar2(20) not null,
   account varchar2(20) not null,
   question varchar2(50) not null,
   answer varchar2(50) not null,
   point number not null,
   grade number not null,
   report number not null,
   joindate date not null
);
--select count(no) from bbs where bbsno=1
--update member set password=123, bank=1234, address='세준팬티'
--where password=1234 and email='tpwns1227'
--insert into member values('tpwns1227','1234','윤세준','세준','010','세준0','세준','217053-56-124278','윤세준?','세준',0,0,0,SYSDATE)
--select * from member;

update member set password=1234 ,  answer='안녕'  where email='jskim7067@naver.com'

select email,password from member;

create table bbsSort( --�Խ��� ����
   bbsno number primary key not null,
   bbsname varchar2(50) not null,
   bbscm char not null
);
--insert into BBSSORT values (1,'��������','f')
--select * from BBSSORT
--select * from replycomment

create table BBS( --�Խ��� 
no number primary key not null,
title varchar2(150) not null,
bbscontent varchar2(3000) not null, 
email varchar2(50) not null,
bbsdate date not null,
hits number not null,
bbsno number not null,
foreign key (email) references member(email) on delete cascade,
foreign key (bbsno) references bbsSort(bbsno) on delete cascade
);

insert into BBSSORT values(2,'공지사항',0);
insert into BBSSORT values(3,'질문하기',1);
insert into BBSSORT values(4,'자주 묻는 질문',0);

create table replycomment(
   cmno number primary key not null,
   no number not null,
   email varchar2(50) not null,
   cmdate date not null,
   cmcontent varchar2(200) not null,
   foreign key (no) references bbs(no) on delete cascade,
   foreign key (email) references member(email) on delete cascade
);

create table postscript( --�ı�
   no number primary key not null,
   email varchar2(50) not null,
   wdate date not null,
   content varchar2(2000) not null,
   point number not null,
   wemail varchar2(50) not null,
   foreign key (email) references member(email) on delete cascade,
   foreign key (wemail) references member(email) on delete cascade
);

create table point( 
   no number primary key not null,
   email varchar2(50) not null,
   pdate date not null,
   price number not null,
   sort char not null,
   commission number not null,
   foreign key (email) references member(email) on delete cascade
);

create table itemsell(
   no number primary key not null,
   itemname varchar2(200) not null,
   itemprice number not null,
   itemstate varchar2(20) not null,
   category varchar2(20) not null,
   howsell varchar2(10) not null,
   itemdetail varchar2(4000) not null,
   email varchar2(50) not null,
   foreign key(email) REFERENCES member(email) on delete cascade
);

create table itemImg( -- 
no number primary key not null,
imgno number not null,
imgname varchar2(200) not null,
foreign key(imgno) REFERENCES itemsell(no) on delete cascade
);

create table auction( --���
   no number primary key,
   itemno number not null,
   startprice number not null,
   nowprice number not null,
   finishtime date not null,
   tendernumber number not null,
   nowemail varchar2(50) not null,
   foreign key(nowemail) REFERENCES member(email) on delete cascade,
   foreign key(itemno) REFERENCES itemsell(no) on delete cascade
);

create table selected( -- ����
   selectno number primary key,
   itemno number not null,
   email varchar2(50) not null,
   foreign key(itemno) REFERENCES itemsell(no) on delete cascade,
   foreign key(email) REFERENCES member(email) on delete cascade
);

select * from itemsell where email='jskim7076@naver.com'
select email from itemsell;
select * from selected

create table buy( --���Ÿ��
   no number primary key,
   itemno number not null,
   email varchar2(50) not null,
   foreign key(itemno) REFERENCES itemsell(no) on delete cascade,
   foreign key(email) REFERENCES member(email) on delete cascade
);

create table zipcode  (
   zipcode              VARCHAR2(10),
   sido                 VARCHAR2(30),
   gugun                VARCHAR2(30),
   dong                 VARCHAR2(43),
   bunji                VARCHAR2(30)
)

create table Message(	--밑에 시퀀스도 추가하세요. (메세지 테이블)
no number primary key,
sendemail varchar2(50) not null,
rvemail varchar2(50) not null,
content varchar2(3000) not null,
title varchar2(20) not null,
mdate date not null,
foreign key (sendemail) references member(email) on delete cascade,
foreign key (rvemail) references member(email) on delete cascade
);

select * from message

drop table Message
drop table buy;
drop table member;
drop table itemsell;
drop table itemimg;
drop table auction;
drop table selected;
drop table bbs;
drop table bbssort;
drop table replycomment;
drop table postscript;
drop table point;


create sequence no_bbs_seq start with 1 increment by 1;
create sequence no_com_seq start with 1 increment by 1;
create sequence no_postscript_seq start with 1 increment by 1;
create sequence no_point_seq start with 1 increment by 1;
create sequence no_itemsell_seq start with 1 increment by 1;
create sequence no_itemimg_seq start with 1 increment by 1;
create sequence no_auction_seq start with 1 increment by 1;
create sequence no_selected_seq start with 1 increment by 1;
create sequence no_buy_seq start with 1 increment by 1;
create sequence no_meg_seq start with 1 increment by 1;