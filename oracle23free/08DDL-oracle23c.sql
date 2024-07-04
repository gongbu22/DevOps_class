-- DDL : 테이블 생성 및 제약조건
-- 테이블 생성시 일반적으로 일련번호가 부여된 컬럼을 기본키 컬럼으로 설정
-- 일련번호 컬럼 지정 : 오라클 11g 이하 - sequence 객체 이용
--                   오라클 12c 이상 - identity 객체 이용
-- 또한, 레코드 생성일자를 저장하는 컬럼도 주기적으로 생성

select sysdate from dual;

-- 학생 테이블 생성
create table students (
                          stdno   int generated always as identity primary key,
                          hakbun  varchar(9)      not null,
                          name    varchar(10)     not null,
                          addr    varchar(100)    not null,
                          birth   date            not null,
                          dept    int             not null,
                          prof    int             not null,
                          regdate date            default sysdate
);

insert into students (hakbun, name, addr, birth, dept, prof)
values ('201350050', '김태희', '경기도 고양시', '1985-03-22', 1, 4);

--DBeaver에서 실행하기
insert into students (hakbun, name, addr, birth, dept, prof)
    ('201250006', '송혜교', '서울 영등포구', '1988-09-17', 1, 1),
('201252110', '전지현', '경기도 의정부시', '1986-04-30', 2, 2),
('201351010', '수지', '서울 성북구','1988-07-13', 3, 3),
('201353011', '아이유', '경기도 천안시', '1987-02-25', 4, 4);

select * from STUDENTS;

-- 학과 테이블 생성
create table depts (
                       deptno      int generated always as identity primary key,
                       dname       varchar(20)     not null,
                       phone       char(15)        not null,
                       dest        varchar(20)     not null,
                       chief       int,
                       regdate     date    default sysdate
);

insert all
    into depts (dname, phone, dest, chief) values ('컴퓨터공학', '123-4567-8901', 'E동 2층', 4)
into depts (dname, phone, dest, chief) values ('의상디자인', '234-5678-9012', 'A동 1층', 1)
into depts (dname, phone, dest, chief) values ('컴퓨터공학', '345-6789-0123', 'F동 8층', 3)
into depts (dname, phone, dest, chief) values ('컴퓨터공학', '456-7890-1234', 'Z동 25층', 4)
select 1 from dual;

select * from depts;
drop table depts;

create table subjects (
                          sjid        int generated always as identity primary key,
                          sjno        varchar(4)     not null,
                          sjname      varchar(20)     not null,
                          sjdesc      varchar(50)     not null,
                          prof        int,
                          regdate     date    default sysdate
);

drop table subjects;

insert into subjects (sjno, sjname, sjdesc, prof)
select '0205', '프로그래밍', '자바 프로그래밍', 1 from dual
union all select '0211', '드레스 코드', '옷 입기의 기초', 2 from dual
union all select '0529', '생활의 참견', '음식의 영양', 3 from dual
union all select '4111', '악마의 사도', '자바 프로그래밍', 4 from dual;

-- 교수 테이블 생성
create table professors (
                            profid  int generated always as identity primary key,
                            profno  varchar(3)  not null,
                            name    varchar(10) not null,
                            fields  varchar(20) not null,
                            regdate date        default sysdate
);

drop table professors;


-- 이 방식은 하나씩 넣어야함
insert all
    into professors (profno, name, fields) values('504', '이성계', '철학')
select * from dual;

into professors (profno, name, fields) values('301', '이순신', '프로그래밍')
into professors (profno, name, fields) values('445', '정약용', '의상디자인')
into professors (profno, name, fields) values('556', '김유신', '식품영양')
into professors (profno, name, fields) values('504', '이성계', '철학')

delete from professors;
select * from professors;


-- identity/sequence 객체 다루기
select  ISEQ$$_77955.currval 현재일련번호,
        ISEQ$$_77955.nextval 다음일련번호
from dual;



-- DML : 페이징 처리
-- 대량의 데이터를 효율적으로 조회하고 표시하기 위해 사용하는 기술
-- 오라클 11g 이하 - rownum, row_number() 객체 이용, 쿼리 복잡 - 권장
-- 오라클 12c 이상 - offset-fetch 절 사용, 쿼리 단순, 성능은 별로
-- offset n row fetch next m rows only
-- n : 시작 행 위치, m : 가져올 행 수

-- 사원들 중 많은 연봉을 받는 사원 10명 조회
select FIRST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
order by SALARY desc, FIRST_NAME;

select FIRST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
order by SALARY desc, FIRST_NAME
offset 0 rows fetch next 10 rows only;
-- => 0부터 시작하고 10개 가져와

-- 사원들 중 많은 연봉을 받는 사원 11위 ~ 20위를 조회
select FIRST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
order by SALARY desc, FIRST_NAME
offset 10 rows fetch next 10 rows only;

-- 사원들 중 많은 연봉을 받는 사원 21위 ~ 30위를 조회
select FIRST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
order by SALARY desc, FIRST_NAME
offset 20 rows fetch next 10 rows only;




