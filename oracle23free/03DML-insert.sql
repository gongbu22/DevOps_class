-- 고객테이블에 모든 컬럼에 회원정보 추가
insert into CUSTOMERS
values ('strawberry', '최유경', 30, 'VIP', '공무원', 100);

-- 고객테이블의 일부 컬럼에 회원정보 추가
insert into CUSTOMERS (cid, name, age, job)
values ('abc123', '홍길동', 99, '무사');

select * from CUSTOMERS;

-- 고객 테이블에 데이터 추가
insert into CUSTOMERS (cid, name, age, grade, job, MILEAGE)
values ('apple', '정소화', 20, 'gold', '학생', '1000');

insert into Customers
values ('banana', '김선우', 25, 'vip', '간호사', 2500);

insert into CUSTOMERS
values ('carrot', '고명성', 28, 'gold', '교사', 4500);

insert into CUSTOMERS (cid, name, age, job)
values ('orange','김용욱', 22, '학생');

insert into CUSTOMERS
values ('melon', '성원용', 35, 'gold', '회사원', 5000);

insert into CUSTOMERS (cid, name, age, job, MILEAGE)
values ('peach','오형준', NULL, '의사', 300);

insert into CUSTOMERS (cid, name, age, job, MILEAGE)
values ('pear', '채광주', 31, '회사원', 500);

delete from CUSTOMERS;

-- 제품 테이블에 데이터 추가
-- insert all
--      into 테이블명 values (값1, 값2, 값3, 값4)
--      ...
-- select 1 from dual;


insert All
    into PRODUCTS values ('p01', '그냥만두', 5000, 4500, '대한식품')
    into PRODUCTS values ('p02', '매운쫄면', 2500, 5500, '민국푸드')
    into PRODUCTS values ('p03', '쿵떡파이', 3600, 2600, '한빛제과')
    into PRODUCTS values ('p04', '맛난초콜릿', 1250, 2500, '한빛제과')
    into PRODUCTS values ('p05', '얼큰라면', 2200, 1200, '대한식품')
    into PRODUCTS values ('p06', '통통우동', 1000, 1550, '민국푸드')
    into PRODUCTS values ('p07', '달콤비스킷', 1650, 1500, '한빛제과')
select 1 from dual;

insert into PRODUCTS (pid, pname, stock, price, maker)
values ('p01', '그냥만두', 5000, 4500, '대한식품');

select * from PRODUCTS;

insert into PRODUCTS (pid, pname, stock, price, maker)
values ('p02', '매운쫄면', 2500, 5500, '민국푸드');

insert into PRODUCTS (pid, pname, stock, price, maker)
values ('p03', '쿵떡파이', 3600, 2600, '한빛제과');

insert into PRODUCTS
values ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');

insert into PRODUCTS
values ('p05', '얼큰라면', 2200, 1200, '대한식품');

insert into PRODUCTS
values ('p06', '통통우동', 1000, 1550, '민국푸드');

insert into PRODUCTS
values ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

delete from PRODUCTS;

-- 주문 테이블에 데이터 추가

-- insert into 테이블명
-- select 값1, 값2, 값3, 값4 from dual
-- union all select 값1, 값2, 값3, 값4 from dual;
insert into Orders
    select 'o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01' from dual
    union all select 'o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10' from dual
    union all select 'o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11' from dual
    union all select 'p04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01' from dual
    union all select 'o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20' from dual
    union all select 'o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02' from dual
    union all select 'o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15'  from dual
    union all select 'o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10' from dual
    union all select 'o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11' from dual
    union all select 'o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22' from dual;

insert into ORDERS (oid, cid, pid, qty, addr, odate)
values ('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01');

select * from ORDERS;

insert into ORDERS (oid, cid, pid, qty, addr, odate)
values ('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10');

insert into ORDERS (oid, cid, pid, qty, addr, odate)
values ('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11');

insert into ORDERS (oid, cid, pid, qty, addr, odate)
values ('p04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01');

insert into ORDERS
values ('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20');

insert into ORDERS
values ('o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02');

insert into ORDERS
values ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15');

insert into ORDERS
values ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10');

insert into ORDERS
values ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11');

insert into ORDERS
values ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');

delete from ORDERS;


------ oracle 21c --------

insert into CUSTOMERS values
    ('apple', '정소화', 20, 'gold', '학생', '1000'),
    ('banana', '김선우', 25, 'vip', '간호사', 2500),
    ('carrot', '고명성', 28, 'gold', '교사', 4500),
    ('orange','김용욱', 22, 'sliver', '학생', 0),
    ('melon', '성원용', 35, 'gold', '회사원', 5000),
    ('peach','오형준', NULL, 'silver', '의사', 300),
    ('pear', '채광주', 31, 'silver', '회사원', 500);

INSERT INTO PRODUCTS VALUES
    ('p01', '그냥만두', 5000, 4500, '대한식품'),
    ('p02', '매운쫄면', 2500, 5500, '민국푸드'),
    ('p03', '쿵떡파이', 3600, 2600, '한빛제과'),
    ('p04', '맛난초콜릿', 1250, 2500, '한빛제과'),
    ('p05', '얼큰라면', 2200, 1200, '대한식품'),
    ('p06', '통통우동', 1000, 1550, '민국푸드'),
    ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

select * from PRODUCTS;
delete from PRODUCTS;


insert into ORDERS values
     ('o01', 'apple', 'p03', 10, '서울시 마포구', '2022-01-01'),
    ('o02', 'melon', 'p01', 5, '인천시 계양구', '2022-01-10'),
    ('o03', 'banana', 'p06', 45, '경기도 부천시', '2022-01-11'),
    ('p04', 'carrot', 'p02', 8, '부산시 금정구', '2022-02-01'),
    ('o05', 'melon', 'p06', 36, '경기도 용인시', '2022-02-20'),
    ('o06', 'banana', 'p01', 19, '충청북도 보은군', '2022-03-02'),
    ('o07', 'apple', 'p03', 22, '서울시 영등포구', '2022-03-15'),
    ('o08', 'pear', 'p02', 50, '강원도 춘천시', '2022-04-10'),
    ('o09', 'banana', 'p04', 15, '전라남도 목포시', '2022-04-11'),
    ('o10', 'carrot', 'p03', 20, '경기도 안양시', '2022-05-22');

select * from ORDERS;
delete from ORDERS;

---------
insert into BOOKS values
    (1, '축구의 역사', '굿스포츠', 7000),
    (2, '축구 아는 여자', '나무수', 13000),
    (3, '축구의 이해', '대한미디어', 22000),
    (4, '골프 바이블', '대한미디어', 35000),
    (5, '피겨 교본', '굿스포츠', 8000),
    (6, '배구 단계별기술', '굿스포츠', 6000),
    (7, '야구의 추억', '이상미디어', 20000),
    (8, '야구를 부탁해', '이상미디어', 13000),
    (9, '올림픽 이야기', '삼성당', 7500),
    (10, 'Olympic Champions', 'Pearson', 13000);

select * from BOOKS;

insert into CLIENTS values
    (1, '박지성', '영국 맨체스타', '000-5000-0001'),
    (2, '김연아', '대한민국 서울', '000-6000-0001'),
    (3, '김연경', '대한민국 경기도', '000-7000-0001'),
    (4, '추신수', '미국 클리블랜드', '000-8000-0001'),
    (5, '박세리', '대한민국 대전',  NULL);

select * from CLIENTS;

insert into SPELLS values
    (1, 1, 1, 6000, '2024-07-01'),
    (2, 1, 3, 21000, '2024-07-03'),
    (3, 2, 5, 8000, '2024-07-03'),
    (4, 3, 6, 6000, '2024-07-04'),
    (5, 4, 7, 20000, '2024-07-05'),
    (6, 1, 2, 12000, '2024-07-07'),
    (7, 4, 8, 13000,  '2024-07-07'),
    (8, 3, 10, 12000, '2024-07-08'),
    (9, 2, 10, 7000, '2024-07-09'),
    (10, 3, 8, 13000, '2024-07-10');

select * from SPELLS;


-----------
create table seoul_foods (
                             개방자치단체코드  clob,
                             관리번호      clob,
                             인허가일자     clob,
                             인허가취소일자   clob,
                             영업상태코드    clob,
                             영업상태명     clob,
                             상세영업상태코드  clob,
                             상세영업상태명   clob,
                             폐업일자      clob,
                             휴업시작일자    clob,
                             휴업종료일자    clob,
                             재개업일자     clob,
                             전화번호      clob,
                             소재지면적     clob,
                             소재지우편번호   clob,
                             지번주소      clob,
                             도로명주소     clob,
                             도로명우편번호   clob,
                             사업장명      clob,
                             최종수정일자    clob,
                             데이터갱신구분   clob,
                             데이터갱신일자   clob,
                             업태구분명     clob,
                             "좌표정보(X)" clob,
                             "좌표정보(Y)" clob,
                             위생업태명     clob,
                             남성종사자수    clob,
                             여성종사자수    clob,
                             영업장주변구분명  clob,
                             등급구분명     clob,
                             급수시설구분명   clob,
                             총인원       clob,
                             본사종업원수    clob,
                             공장사무직종업원수 clob,
                             공장판매직종업원수 clob,
                             공장생산직종업원수 clob,
                             건물소유구분명   clob,
                             보증액       clob,
                             월세액       clob,
                             다중이용업소여부  clob,
                             시설총규모     clob,
                             전통업소지정번호  clob,
                             전통업소주된음식  clob,
                             홈페이지      clob
);

select * from seoul_foods;

------------

create table summermedals (
      Year int,
      City varchar(255),
      Sport varchar(255),
      Discipline varchar(255),
      Athlete varchar(255),
      Country varchar(255),
      Gender varchar(255),
      Event varchar(255),
      Medal varchar(255)
);

--------

create table accidents (
       발생년  int,
       발생년월일시   int,
       발생분  int,
       주야   varchar(12),
       요일 varchar(3),
       사망자수 int,
       사상자수 int,
       중상자수 int,
       경상자수 int,
       부상신고자수   int,
       발생지시도    varchar(9),
       발생지시군구   varchar(12),
       사고유형_대분류 varchar(51),
       사고유형_중분류 varchar(51),
       사고유형 varchar(51),
       법규위반_대분류 varchar(51),
       법규위반 varchar(51),
       도로형태_대분류 varchar(51),
       도로형태 varchar(51),
       당사자종별_1당_대분류 varchar(51),
       당사자종별_1당 varchar(51),
       당사자종별_2당_대분류 varchar(51),
       당사자종별_2당 varchar(51),
       발생위치X_UTMK   int,
       발생위치Y_UTMK   int,
       경도   decimal(3,8),
       위도   decimal(3,8)
);

drop table accidents;

create table accidents (
                           발생년  varchar(255),
                           발생년월일시   varchar(255),
                           발생분  varchar(255),
                           주야   varchar(255),
                           요일 varchar(255),
                           사망자수 varchar(255),
                           사상자수 varchar(255),
                           중상자수 varchar(255),
                           경상자수 varchar(255),
                           부상신고자수   varchar(255),
                           발생지시도    varchar(255),
                           발생지시군구   varchar(255),
                           사고유형_대분류 varchar(255),
                           사고유형_중분류 varchar(255),
                           사고유형 varchar(255),
                           법규위반_대분류 varchar(255),
                           법규위반 varchar(255),
                           도로형태_대분류 varchar(255),
                           도로형태 varchar(255),
                           당사자종별_1당_대분류 varchar(255),
                           당사자종별_1당 varchar(255),
                           당사자종별_2당_대분류 varchar(255),
                           당사자종별_2당 varchar(255),
                           발생위치X_UTMK   varchar(255),
                           발생위치Y_UTMK   varchar(255),
                           경도   varchar(255),
                           위도   varchar(255)
);


select * from accidents;

drop table seoul_foods;

delete from accidents;
delete from summermedals;

select * from RECYCLEBIN;
purge recyclebin;

delete from CLOUDS2.COUNTRIES;

delete from COUNTRIES;
select * from COUNTRIES;
delete from DEPARTMENTS;
delete from EMPLOYEES;
delete from JOB_HISTORY;
delete from JOBS;
delete from LOCATIONS;
delete from REGIONS;

