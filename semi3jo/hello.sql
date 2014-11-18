--회원가입 테이블 생성
create table member(
	num int not null auto_increment,
	id varchar(20),
	pw varchar(20),
	name varchar(10),
	phone varchar(11),
	email varchar(20),
	address varchar(30),
	constraint pk_mnum primary key(num)
);

create table tblboard(
 num  int not null auto_increment,
 name varchar(20),  
 email varchar(20),
 homepage varchar(20),
 subject  varchar(50),
 content  varchar(4000),
 pass  varchar(10),
 count  int, 
 ip   varchar(30), 
 regdate TIMESTAMP DEFAULT  NOW(),
 pos   int, 
 depth  int, 
 filename varchar(50),
 ofilename varchar(50),
 constraint pk_bnum primary key(num)
);

create table OXQuiz(
	num	 int not null auto_increment,
	userID	varchar(20),
	category	varchar(20),
	quiz	varchar(500),
	answer	varchar(500),
	explanation	varchar(500),
	regdate TIMESTAMP DEFAULT  NOW(),
	constraint	pk_qnum primary key(num)
);

insert into OXQuiz(userID, category, quiz, answer, explanation,regdate) 
 values('hwang', 'word', 'Light enables you (to see/see) objects in a dark room.', '1', 'enable+목적어+to동사원형', sysdate());
show tables;
select * from oxquiz;
delete from oxquiz;

drop table tblboard;
drop table oxquiz;
select * from member;
select * from tblboard;
select * from OXQuiz;
