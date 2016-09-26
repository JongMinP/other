create sequence PRENTCATEIDX_SEQ start with 10000 increment by 100 nocycle
create sequence CHILDCATEIDX_SEQ start with 1000 increment by 10 nocycle
	


create table WEB_BOARD_TBL(
	BNO number not null,
	--USERID도 신경쓰시지 않으셔도 됩니다.
	USERID varchar2(50) not null,
	WRITER varchar2(50) not null,
	TITLE varchar2(200) not null,
	CONTENT CLOB not null,
	VIEWCNT number default 0,
	REGDATE date default sysdate,
	REPLYCNT number default 0
)

--기본키 설정
alter table WEB_BOARD_TBL
add constraint WEB_BOARD_TBL primary key(BNO);

--시퀀스 생성
create sequence web_board_bno_seq

create table WEB_BOARD_FILES_TBL(
	bno number not null,
	file_url varchar2 (300) not null,
	--외래키 설정
	CONSTRAINT FK_BNO FOREIGN KEY(bno) REFERENCES WEB_BOARD_TBL(bno)
);

