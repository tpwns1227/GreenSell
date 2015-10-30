
create table Member( -- ȸ�� ���̺�
   email varchar2(50) primary key not null,
   password varchar2(50) not null,
   name varchar2(20) not null,
   nickname varchar2(30) not null,
   phone varchar2(20) not null,
   address varchar2(100) not null,
   bank varchar2(15) not null,
   account varchar2(20) not null,
   question varchar2(60) not null,
   answer varchar2(60) not null,
   point number not null,
   grade number not null,
   report number not null,
   joindate date not null
);
select count(no) from bbs where bbsno=1
update member set password=123, bank=1234, address='세준팬티'
where password=1234 and email='tpwns1227'
insert into member values('tpwns1227','1234','윤세준','세준','010','세준0','세준','217053-56-124278','윤세준?','세준',0,0,0,SYSDATE)
select * from member;

create table bbsSort( --�Խ��� ����
   bbsno number primary key not null,
   bbsname varchar2(50) not null,
   bbscm char not null
);

insert into BBSSORT values (1,'��������','f')
select * from BBSSORT
select * from replycomment

create table BBS( --�Խ��� 
no number primary key not null,
title varchar2(100) not null,
bbscontent varchar2(3000) not null, 
email varchar2(50) not null,
bbsdate date not null,
hits number not null,
bbsno number not null,
foreign key (email) references member(email),
foreign key (bbsno) references bbsSort(bbsno)
);

create table replycomment( -- ���
   cmno number primary key not null,
   no number not null,
   email varchar2(50) not null,
   cmdate date not null,
   cmcontent varchar2(200) not null,
   foreign key (no) references bbs(no),
   foreign key (email) references member(email)
);

create table postscript( --�ı�
   no number primary key not null,
   email varchar2(50) not null,
   wdate date not null,
   content varchar2(2000) not null,
   point number not null,
   wemail varchar2(50) not null,
   foreign key (email) references member(email),
   foreign key (wemail) references member(email)
);

create table point( 
   no number primary key not null,
   email varchar2(50) not null,
   pdate date not null,
   price number not null,
   sort char not null,
   commission number not null,
   foreign key (email) references member(email)
);

create table itemsell( -- ��ǰ�Ǹ�
   no number primary key not null,
   itemname varchar2(20) not null,
   itemprice number not null,
   itemstate varchar2(30) not null,
   category varchar2(30) not null,
   howsell varchar2(12) not null,
   itemdetail varchar2(3000) not null,
   email varchar2(50) not null,
   foreign key(email) REFERENCES member(email)
);

create table itemImg( -- 
no number primary key not null,
imgno number not null,
imgname varchar2(100) not null,
foreign key(imgno) REFERENCES itemsell(no)
);

create table auction( --���
   no number primary key,
   itemno number not null,
   startprice number not null,
   nowprice number not null,
   finishtime date not null,
   tendernumber number not null,
   nowemail varchar2(50) not null,
   foreign key(nowemail) REFERENCES member(email),
   foreign key(itemno) REFERENCES itemsell(no)
);

create table selected( -- ����
   no number primary key,
   itemno number not null,
   email varchar2(50) not null,
   foreign key(itemno) REFERENCES itemsell(no),
   foreign key(email) REFERENCES member(email)
); 

create table buy( --���Ÿ��
   no number primary key,
   itemno number not null,
   email varchar2(50) not null,
   foreign key(itemno) REFERENCES itemsell(no),
   foreign key(email) REFERENCES member(email)
);



create sequence no_bbs_seq start with 1 increment by 1;
create sequence no_com_seq start with 1 increment by 1;
create sequence no_postscript_seq start with 1 increment by 1;
create sequence no_point_seq start with 1 increment by 1;
create sequence no_itemsell_seq start with 1 increment by 1;
create sequence no_itemimg_seq start with 1 increment by 1;
create sequence no_auction_seq start with 1 increment by 1;
create sequence no_selected_seq start with 1 increment by 1;
create sequence no_buy_seq start with 1 increment by 1;

select * from zipcode;

alter table bbs drop column bbscontent ;
alter table bbs add (bbscontent varchar2(3000));

alter table replycomment drop column cmcontent ;
alter table replycomment add (cmcontent varchar2(200));














