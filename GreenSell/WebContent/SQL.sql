
create table Member( -- ȸ�� ���̺�
   email varchar2(50) primary key not null,
   password varchar2(50) not null,
   name varchar2(20) not null,
   nickname varchar2(30) not null,
   phone varchar2(11) not null,
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

create table bbsSort( --�Խ��� ����
   bbsno number primary key not null,
   bbsname varchar2(50) not null,
   bbscm char not null
);

create table BBS( --�Խ��� 
no number primary key not null,
title varchar2(100) not null,
bbscontent long not null, 
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
   cmcontent long not null,
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

create table point( -- ����Ʈ ����
   no number primary key not null,
   email varchar2(50) not null,
   pdate date not null,
   price number not null,
   sort char not null,
   commission number not null,
   foreign key (email) references member(email)
);


create table itemImg( -- ��ǰ �̹���
no number primary key not null,
imgno number not null,
imgname varchar2(100) not null,
foreign key(imgno) REFERENCES itemsell(no)
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