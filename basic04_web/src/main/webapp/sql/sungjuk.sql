-- sungjuk.sql

● [오라클 DB 서비스 확인]
  - 명령프롬프트
  	-> sqlplus system/1234
  	
 
● 오라클 콘솔창 예쁘게 출력 (sqlplus 사용자 추천)
set linesize 1000;
col uname for a10; --col 칼럼명 for 20자
col addr  for a10;


-- 성적테이블 삭제
drop table sungjuk;


-- 성적테이블 생성
create table sungjuk(
     sno   int         not null --일련번호
    ,uname varchar(50) not null --이름
    ,kor   int         not null --국어
    ,eng   int         not null --영어
    ,mat   int         not null --수학
    ,aver  int         null     --평균
    ,addr  varchar(50)          --주소
    ,wdate date                 --등록일(년월일시분초)
    ,primary key(sno)
);

--sungjuk테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

--sungjuk_seq시퀀스 삭제
drop sequence sungjuk_seq;
//////////////////////////////////////////////////////////

● [게시판 페이지 흐름]

  목록 -> 입력
  	 -> 상세보기 -> 삭제/수정
  	 

1) 입력
   sungjukForm.jsp -> sungjukIns.jsp
   
2) 목록
					  sno=3			상세보기			sno=3
   sungjukList.jsp ------------> sungjukRead.jsp -----------> 삭제 sungjukDel.jsp
   													sno=3
   												 -----------> 수정 sungjukUpdate.jsp
   
3) 수정
   ⓘ sungjukUpdate.jsp
     수정하고자 행을 DB에서 가져와서(select문), 사용자가 작성했던 내용을 그대로 성적폼에 출력하고
     sungjukRead.jsp와 sungjukForm.jsp 참조
     
   ② sungjukUpdateProc.jsp                                            
     사용자가 다시 입력한 내용으로 수정(update문)

//////////////////////////////////////////////////////////////

● [전체목록] sungjukList.jsp
select *
from sungjuk
order by wdate desc;

● [상세보기] sungjukRead.jsp
※ sungjukList.jsp참조
select * from sungjuk where sno=?

● [행삭제] sungjukDel.jsp
delete from sungjuk where sno=?

● [행수정]
-> sungjukUpdate.jsp	:select문
-> sungjukUpdatePorc.jsp: update sungjuk
						  set uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate
						  where sno=?