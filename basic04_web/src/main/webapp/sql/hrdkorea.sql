--hrdkorea.sql

--여행 상품 코드 테이블 생성
create table tbl_tourcode_02 (
    tcode   char(4)       primary key  --상품코드
   ,tarea   varchar2(30)               --여행지역
   ,tdate   char(8)                    --출발일자
   ,ttime   char(4)                    --출발시간
   ,tday    number(2)                  --숙박일수
   ,thotel  varchar2(30)               --숙박호텔
   ,tmoney  number(7)                  --여행금액
   ,tair    varchar2(30)               --항공정보
);


--여행 상품 코드 테이블 삭제
drop table tbl_tourcode_02;


--여행상품코드 샘플 데이터
insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ01', '제주', '20181201', '0930', 2, 'J 호텔', 360000, 'J 항공');

insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ02', '부산', '20181202', '1000', 2, 'B 호텔', 280000, 'B 항공');

insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ03', '제주', '20181204', '1000', 2, 'J 호텔', 360000, 'J 항공');

insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ04', '제주', '20181207', '1100', 3, 'J 호텔', 420000, 'J 항공');

insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ05', '부산', '20181209', '1330', 2, 'B 호텔', 260000, 'B 항공');

insert into tbl_tourcode_02 (tcode, tarea, tdate, ttime, tday, thotel, tmoney, tair)
values ('JJ06', '제주', '20181210', '0930', 3, 'J 호텔', 460000, 'J 항공');
////////////////////////////////////////////////////////////////////////////////////




--예약 등록 테이블 생성
create table tbl_reserve_01 (
    rno      char(8)       primary key  --예약번호
   ,rjumin   varchar2(13)               --주민번호
   ,rname    varchar2(20)               --예약자
   ,rphone1  char(3)                    --전화번호1
   ,rphone2  char(4)                    --전화번호2
   ,rphone3  char(4)                    --전화번호3
   ,remail   varchar2(30)               --이메일
   ,rstat    char(1)                    --입금상태 (1:미납, 2: 완납)
   ,tcode    char(4)                    --상품코드
);


--예약 등록 테이블 삭제
drop table tbl_reserve_01;



--예약 등록 샘플 데이터는 입력하지 않아도 됩니다 (※ 시연할 때 입력)
INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180001', '9901011000001', '김고객', '010', '1111', '2221', 'aaa@hrd.co.kr', 2, 'JJ01');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180002', '9902011000001', '이고객', '010', '1111', '2222', 'bbb@hrd.co.kr', 2, 'JJ02');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180003', '9903012000001', '박고객', '010', '1111', '2223', 'ccc@hrd.co.kr', 2, 'JJ03');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180004', '9904011000001', '최고객', '010', '1111', '2224', 'ddd@hrd.co.kr', 2, 'JJ04');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180005', '9905012000001', '유고객', '010', '1111', '2225', 'eee@hrd.co.kr', 2, 'JJ05');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180006', '9906011000001', '황고객', '010', '1111', '2226', 'fff@hrd.co.kr', 2, 'JJ06');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180007', '9907011000001', '왕고객', '010', '1111', '2227', 'ggg@hrd.co.kr', 2, 'JJ05');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180008', '9908011000001', '주고객', '010', '1111', '2228', 'hhh@hrd.co.kr', 2, 'JJ06');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180009', '9909012000001', '진고객', '010', '1111', '2229', 'iii@hrd.co.kr', 1, 'JJ06');

INSERT INTO tbl_reserve_01 (rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat, tcode)
VALUES ('20180010', '9910012000001', '홍고객', '010', '1111', '2230', 'jjj@hrd.co.kr', 1, 'JJ04');
/////////////////////////////////////////////////////////////////////////////////////////////////


-- sqlplus 콘솔창 예쁘게 출력
>set linesize 1000;
>col rno     for a8;
>col rjumin  for a13;
>col rname   for a6;
>col rphone1 for a3;
>col rphone2 for a4;
>col rphone3 for a4;
>col remail  for a15;
/////////////////////////////////////////////////////////////////////////////////////////////////////////


-- travelBook.jsp에서 상품코드 작성하기
-- 예) [JJ01] 제주 2018-12-01 출발

1) 상품코드 조회
select tcode from tbl_tourcode_02;

2) [JJ01] 제주 2018-12-01 출발 <--- 작성
select tcode, tarea, tdate from tbl_tourcode_02 where tcode='JJ01' && tarea='제주' && tdate='20181201';

--방법1
select tcode
	   ,'['||tcode||']' || tarea 
	    || substr(tdate, 1, 4) || '-' || substr(tdate, 5, 2) || '-' || substr(tdate, 7, 2)
	    || ' 출발' as tname
from tbl_tourcode_02
order by tcode;

--방법2
select '[' || tcode || '] ' 
		|| tarea || ' ' 
		|| to_char(to_date(tdate, 'YYYY-MM-DD'), 'YYYY-MM-DD') 
		|| ' 출발' 
from tbl_tourcode_02;
///////////////////////////////////////////////////////////////////////////////////////////


--travelList.jsp 예약 내역 조회
select tbl_reserve_01.tcode, rno, rjumin, rname, rphone1, rphone2, rphone3, remail, rstat
	  ,tarea, tdate, ttime, tday, thotel, tmoney, tair
from tbl_reserve_01 inner join tbl_tourcode_02
on tbl_reserve_01.tcode = tbl_tourcode_02.tcode
order by tbl_reserve_01.rno


select rno
	,substr(rjumin, 1, 6) || '-' || substr(rjumin, 7, 13) as juminbno
	,rname 
	,substr(rjumin, 7,1) as juminnum
	,rphone1 || '-' || rphone2 || '-' || rphone3 as phone
	,tbl_reserve_01.tcode || '-' || tarea || '-' || tdate || '-' || ttime || '/' || thotel || '/' || tair as tnamecom
	, rstat 
	, tmoney
from tbl_reserve_01 inner join tbl_tourcode_02
on tbl_reserve_01.tcode = tbl_tourcode_02.tcode
order by tbl_reserve_01.rno


