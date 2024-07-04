-- A1 (Clients, Book, Spells)

-- 1) 모든 도서의 이름과 가격을 조회하세요
select BOOKNAME 이름, PRICE 가격 from BOOKS;

-- 1b) 모든 도서의 가격, 이름을 조회하세요
select price 가격, BOOKNAME 이름 from BOOKS;

-- 2) 모든 도서의 번호,이름, 출판사,가격을 조회하세요
select BOOKID "도서의 번호", BOOKNAME 이름, PUBLISHER 출판사, PRICE 가격 from BOOKS;

-- 2b) 모든 도서의 정보를 조회하세요
select * from BOOKS;

-- 3) 모든 도서의 출판사를 조회하세요
select all PUBLISHER 출판사 from BOOKS;

-- 3b) 모든 도서의 출판사를 조회하세요 (중복제거)
select distinct PUBLISHER 출판사 from BOOKS;

-- 4) 고객의 이름, 주민번호 조회하세요
-- 단, 출력결과의 필드명을 '이름, 주민번호'로 바꿔 출력
alter table CLIENTS add jumin varchar2(18);

select name 이름, jumin 주민번호 from CLIENTS;

-- 5) 고객의 이름과 핸드폰번호를 조회하세요
select name 이름, PHONE 핸드폰번호 from CLIENTS;

-- 6) 가격이 20000미만인 도서를 조회하세요
select * from BOOKS where PRICE < 20000;

-- 7) 가격이 15000이상 ~ 25000이하인 도서의 제목을 조회하세요
select BOOKNAME "도서의 제목" from BOOKS where PRICE between 15000 and 25000;

-- 8) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select PUBLISHER 출판사 from BOOKS where BOOKNAME = '축구의 역사' or BOOKNAME = '피겨 교본';
select PUBLISHER 출판사 from BOOKS where BOOKNAME IN ('축구의 역사', '피겨 교본');

-- 9) '축구'로 시작하는 도서 이름을 조회하세요
select BOOKNAME "도서 이름" from BOOKS where BOOKNAME like '축구%';

-- 9b) '축구'로 끝나는 도서 이름을 조회하세요
select BOOKNAME "도서 이름" from BOOKS where BOOKNAME like '%축구';

-- 9c) '축구'를 포함하는 도서 이름을 조회하세요
select BOOKNAME "도서 이름" from BOOKS where BOOKNAME like '%축구%';

-- 9d) 도서이름 중에 '의'를 포함하는 책은?
select BOOKNAME 책 from BOOKS where BOOKNAME like '%의%';

-- 10) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요
select BOOKNAME "도서 이름" from BOOKS where BOOKNAME like '%골프%' and PRICE >= 35000;

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고
-- 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select NAME, ADDR from CLIENTS order by NAME, ADDR desc;


-- B1 (HR)
-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
select FIRST_NAME, LAST_NAME from EMPLOYEES;

-- 2. 모든 사원의 모든 정보를 조회하라.
select employee_id, first_name, last_name, email,
phone_number, hire_date, job_id, salary, commission_pct,
manager_id, department_id from EMPLOYEES;

select * from EMPLOYEES;

-- 3. 모든 도시 명을 조회하라.
select CITY "도시명" from LOCATIONS;

-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
select * from EMPLOYEES where FIRST_NAME like 'M%';

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
select FIRST_NAME 이름, SALARY 연봉 from EMPLOYEES where FIRST_NAME like '_a%';

-- 6. 도시 명을 오름차순 정렬하라.
select CITY from LOCATIONS order by CITY;

-- 7. 부서 명을 내림차순 정렬하라.
select DEPARTMENT_NAME from DEPARTMENTS order by DEPARTMENT_NAME desc;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
select * from EMPLOYEES where SALARY >= 7000 order by SALARY;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
select * from EMPLOYEES where COMMISSION_PCT is null;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
select * from EMPLOYEES where COMMISSION_PCT is not null;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.
select EMPLOYEE_ID 사원번호, FIRST_NAME "first 이름", LAST_NAME "last 이름", DEPARTMENT_ID 부서번호 from EMPLOYEES where HIRE_DATE ='2007-06-21';

-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
select EMPLOYEE_ID 사원번호, HIRE_DATE 입사일 from EMPLOYEES
where HIRE_DATE >= '2006-01-01' and HIRE_DATE <= '2006-12-31';

select EMPLOYEE_ID 사원번호, HIRE_DATE 입사일 from EMPLOYEES
where HIRE_DATE between '2006-01-01' and '2006-12-31';

select EMPLOYEE_ID 사원번호, HIRE_DATE 입사일 from EMPLOYEES
where to_char(HIRE_DATE, 'YYYY') like '2006%';

-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.
select * from EMPLOYEES where FIRST_NAME like '_____%';

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회한다.
select LAST_NAME 이름, SALARY 연봉 from EMPLOYEES where SALARY < 5000 or SALARY > 12000;

select LAST_NAME 이름, SALARY 연봉 from EMPLOYEES
where SALARY NOT between 5000 and 12000;

-- 15. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
select LAST_NAME 이름, DEPARTMENT_ID "부서 번호" from EMPLOYEES where EMPLOYEE_ID = 176;

-- 16. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
select LAST_NAME 이름, SALARY 연봉 from EMPLOYEES where SALARY >=12000;

-- 17. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
select LAST_NAME 이름, HIRE_DATE 고용일 from EMPLOYEES where to_char(HIRE_DATE, 'YYYY') like '1994%';

-- 18. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
select LAST_NAME 이름, JOB_ID 직업번호 from EMPLOYEES where MANAGER_ID is NULL;

-- 19. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.
select LAST_NAME 이름, SALARY 연봉, COMMISSION_PCT 커미션 from EMPLOYEES
where COMMISSION_PCT is not null order by  SALARY desc, COMMISSION_PCT desc;

-- 20. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
select LAST_NAME "LAST 이름", FIRST_NAME "FIRST 이름" from EMPLOYEES where LAST_NAME like '___a%';

-- 21. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
select LAST_NAME 이름 from EMPLOYEES where LAST_NAME like '%a%' or LAST_NAME like '%e%';

-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT * FROM EMPLOYEES WHERE SALARY NOT IN (2500, 3500, 7000) AND JOB_ID IN ('SA_REP', 'ST_CLERK');

-----------------------------------------

-- 7 정렬
    -- 쿼리 결과를 정렬할 때 사용
    -- 정렬 시 쿼리 성능에 영향이 있으므로,
    -- 대량의 데이터를 정렬할 때는 인덱스를 사용하는 것을 추천

    -- NULL 값은 오름차순에서는 맨 마지막에 출력되고,
    -- 내림차순에서는 맨 먼저 출력됨

-- 고객 테이블에서 고객이름,등급,나이를 조회
-- 단, 나이를 기준으로 내림차순으로 정렬함
select name 이름, grade 등급, age 나이 from CUSTOMERS order by age;

select name 이름, grade 등급, age 나이 from CUSTOMERS order by age desc;

-- 주문테이블에서 주문 수량이 10개이상인 고객의
-- 이름, 주문제품, 수량, 주문일자를 조회
-- 단, 주문제품 순으로 정렬하되
-- 동일 주문제품은 수량을 기준으로 내림차순 정렬함
select CID, PID, QTY, ODATE from ORDERS where QTY >= 10
order by PID, QTY desc;

-- 8 집계
    -- 여러 행의 데이터를 그룹화해서 "하나의 결과 (단일값)"로 반환하는 함수
    -- 데이터 분석 및 요약summary에 매우 유용
    -- count : 행의 수 계산
    -- sum : 숫자 열의 합계 계산
    -- avg : 숫자 열의 평균 계산
    -- min : 숫자 열의 최소값 계산
    -- max : 숫자 열의 최대값 계산
    -- median : 숫자 열의 중앙값 계산
    -- stddev : 숫자 열의 표준편차 계산
    -- varaince : 숫자 열의 분산 계산

    -- NULL인 속성 값은 제외하고 계산함

-- 제품 테이블에서 모든 제품의 평균 단가 조회
-- round(값, 반올림자릿수) : 반올림
-- ceil(값) : 무조건 올림 함수
-- floor(값) : 무조건 내림 함수
select avg(price) "평균 단가" from PRODUCTS;  -- 2764.2
select round(avg(price)) "평균 단가" from PRODUCTS;  -- 2764
select ceil(avg(price)) "평균 단가" from PRODUCTS;  -- 2765
select floor(avg(price)) "평균 단가" from PRODUCTS;  -- 2764

-- 제품 테이블에서 한빛제과가 제조한
-- 제품들의 재고량 합계를 조회
select sum(STOCK) "재고량 합계" from PRODUCTS where MAKER='한빛제과';

-- 고객테이블에서 고객이 몇명인지 조회
-- count함수 사용 시 '*' 는 사용금지! - null값까지 개수 포함
select count(*) from CUSTOMERS;
select count(CID) "회원 수" from CUSTOMERS;  -- 권장

-- 제품테이블에서 제조업체수 조회
select count(distinct MAKER) from PRODUCTS;  -- 중복 제거

-- 9 그룹별 조회
    -- 데이터를 그룹화하고 집계함수를 적용하는데 사용
    -- 즉, 데이터를 특정 열을 기준으로 묶고,
    -- 각 그룹에 대한 요약정보를 얻을 때 사용
    -- group by 절은 where 절 뒤, order 절 앞에 위치함
    -- having 절을 이용하면 group by의 결과를 필터링할 수 있음
    -- 대용량 데이터에 group by 사용시 성능 저하 발생

-- 주문테이블에서 주문제품별 수량합계 조회
select PID 주문제품, count(PID) 주문수량, sum(QTY) 주문수량합계
from ORDERS
group by PID;

-- 제품테이블에서 제조업체별로 제조한 제품수와
-- 제품 중 가장 비싼 단가를 조회
-- 단, 컬럼명은 제품수와 최고가라는 이름 사용
select MAKER 제조업체, count(PID) 제품수, max(PRICE) 최고가
from PRODUCTS
group by MAKER ;

-- 제품테이블에서 3개 이상의 제품을 제조한 제조업체별로
-- 제품수와 제품 중 가장 비싼 단가를 조회

select MAKER 제조업체, count(PNAME) 제품수, max(PRICE) 최고가
from PRODUCTS
group by MAKER
having count(PNAME) >= 3;

select MAKER 제조업체, count(PNAME) 제품수, max(PRICE) 최고가
from PRODUCTS
group by MAKER
having count(PNAME) >= 3;

-- 고객 테이블에서 등급별 평균 적립금이
-- 1000원 이상인 등급에 대해
-- 등급별 고객수와 평균 적립금을 조회
select GRADE 등급, count(CID) 고객수, round(avg(MILEAGE)) "평균 적립금"
from CUSTOMERS
group by GRADE
having avg(MILEAGE) >= 1000;

select GRADE 등급, count(CID) 고객수, round(avg(MILEAGE)) "평균 적립금"
from CUSTOMERS
group by GRADE
having "평균 적립금" >= 1000;

-- 주문테이블에서 주문제품별로
-- 각 주문고객이 주문한 제품의 총 주문수량 조회
select PID 주문제품,
       cid 고객,
       count(distinct CID) 주문고객수,
       sum(QTY) "총 주문수량"
from ORDERS
group by PID, cid
order by PID;


-------------------------------------------------------------
-- 연습문제 C

-- HR
-- 15. 급여가 12000 이상되는 직원들의 LAST_NAME 및 급여를 조회한다.
select LAST_NAME 이름, SALARY 급여 from EMPLOYEES where SALARY >=12000;

-- 16. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
select LAST_NAME 이름, DEPARTMENT_ID  부서번호 from EMPLOYEES where EMPLOYEE_ID=176;

-- 17. 급여가 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 급여를 조회한다.
select LAST_NAME 이름, SALARY 급여 from EMPLOYEES where SALARY not between  5000 and 12000;

-- 18. 20 번 또는 50 번 부서에 근무하며, 급여가 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 급여을 조회한다.
select LAST_NAME 이름, SALARY 급여, DEPARTMENT_ID from EMPLOYEES where DEPARTMENT_ID in (20, 50) and SALARY between 5000 and 12000;

-- 19. LAST_NAME 의 네번째 글자가 a인 사원들의 LAST_NAME 을 조회한다.
select LAST_NAME 이름 from EMPLOYEES where LAST_NAME like '___a%';

-- 20. LAST_NAME 에 a 및/또는 e 글자가 있는 사원들의 LAST_NAME 을 조회힌다.
select LAST_NAME 이름 from EMPLOYEES where LAST_NAME like '%a%' or LAST_NAME like '%e%';

-- 21. 급여가 2500, 3500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
select * from EMPLOYEES where SALARY not in (2500, 3500, 7000) and JOB_ID in ('SA_REP', 'ST_CLERK');

-- 22. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)
select DEPARTMENT_ID 부서, count(EMPLOYEE_ID) 사원수
from EMPLOYEES
group by DEPARTMENT_ID
order by DEPARTMENT_ID;

-- 23. 직무 아이디별 평균 급여를 조회하라. (직무 아이디 내림차순 정렬)
select JOB_ID "직무 아이디", avg(SALARY) "평균 급여"
from EMPLOYEES
group by JOB_ID
order by JOB_ID desc;

-- 24. 상사가 있는 사원들의 모든 정보를 조회하라.
select * from EMPLOYEES where MANAGER_ID is not null;

-- 25. 상사가 없는 사원들의 모든 정보를 조회하라.
select * from EMPLOYEES where MANAGER_ID is null;

-- 26. IT 부서의 급여 총합을 조회하라.
select sum(SALARY) "IT_PROG의 급여 총합" from EMPLOYEES where JOB_ID = 'IT_PROG';

-- 27. 부서와 직무별 최대급여, 최소급여, 사원수를 조회하라.
select DEPARTMENT_ID 부서, JOB_ID 직무, to_char(max(SALARY), '9,999') 최대급여, min(SALARY) 최소급여, count(EMPLOYEE_ID) 사원수
from EMPLOYEES
group by DEPARTMENT_ID, JOB_ID;

-- 28. 회사 전체의 최대 급여, 최소급여, 급여 총합 및 평균 급여를 조회하세요
-- 1000 단위마다 컴마를 출력하려면 to_char 함수 이용
-- to_char(대상, '형식')   대상을 '형식'에 맞게 변환한다.
-- 숫자는 오른쪽 정렬, 문자는 왼쪽 정렬
select to_char(max(SALARY), '9,999') "최대 급여",
       min(SALARY) "최소 급여",
       to_char(sum(SALARY), '999,999') "급여 총합",
       to_char(round(avg(SALARY)), '999,999') "평균 급여"
from EMPLOYEES;

-- 29. 각 직책별, 최대 급여, 최소 급여, 급여 총합 및 평균 급여를 정수로 포맷하여 조회하세요
select JOB_ID 직책,
       count(EMPLOYEE_ID) 사원수,
       max(SALARY) "최대 급여",
       min(SALARY) "최소 급여",
       sum(SALARY) "급여 총합",
       round(avg(SALARY)) "평균 급여"
from EMPLOYEES
group by JOB_ID
order by JOB_ID;

-- 30. 직책별 사원 총 수를 조회하세요
select JOB_ID 직책, count(JOB_ID) 사원수
from EMPLOYEES
group by JOB_ID
order by JOB_ID;

-- 31. 매니저로 근무하는 사원들의 총 수를 조회하세요
select count(distinct MANAGER_ID) from EMPLOYEES;

-- 32. 사내의 최대 급여 및 최소 급여의 차이를 조회하세요
select max(SALARY) "최대 연봉",
       min(SALARY) "최소 연봉",
       max(SALARY)-min(SALARY) "최대/최소 연봉의 차"
from EMPLOYEES where SALARY <> 0;


-- books (Clients, Book, Spells)
-- 11) 고객이름을 가나다순으로 오름차순 정렬하고 이름이 같으면 주소로 내림차순 정렬해서 조회하세요
select * from CLIENTS order by name, addr desc;

-- 11b) 도서의 가격을 내림차순으로, 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요
select BOOKNAME, PRICE, PUBLISHER from BOOKS order by PRICE desc, PUBLISHER;

-- 12) 고객이 주문한 도서의 총, 평균, 최고, 최저 판매액을 조회하세요
select count(SALEPRICE) 총판매액,
       avg(SALEPRICE) "평균 판매액",
       max(SALEPRICE) "최고 판매액",
       min(SALEPRICE) "최저 판매액" from SPELLS;

-- 13b) 출판사별 도서의 총 수량 조회하세요
select PUBLISHER 출판사, count(BOOKID) "도서의 총 수량"
from BOOKS
group by PUBLISHER;

-- 14) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요
select PUBLISHER 출판사, count(BOOKID) "도서의 총 수량"
from BOOKS
group by PUBLISHER
having count(BOOKID) >=2;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
select CID 고객, count(BOOKID) "주문 도서 총 수량"
from SPELLS
where SALEPRICE >= 8000
group by CID
order by CID;

-- 14b) 가격이 8000이상인 도서를 구매한 고객별 주문 도서의 총 수량을 구하세요
-- 단, 고객별 2권이상 주문한 고객을 대상으로 한다
select CID 고객, count(BOOKID) "주문 도서 총 수량"
from SPELLS
where SALEPRICE >= 8000
group by CID
having count(CID) >=2
order by CID;

------------------

-- -1. 지역 이름을 출력하라
select distinct REGION "지역 이름" from NATIONS;
--
-- -2. 인구가 2억명 이상인 국가의 이름을 검색하라
select  NKNAME 국가이름, NENAME 영문, POP 인구수 from NATIONS where pop >= 200000000;
--
-- -3. 인구가 2억 이상인 국가의 이름과 1인당 GDP를 검색하라
select NKNAME 국가, round(GDP/POP) GDP from NATIONS where pop >= 200000000;
--
-- -4. '중동' 지역에 위치하고 있는 국가의 이름과
-- 백만명당 인구를 검색하되, 결과 값이 정수가 아니면 반올림하라.
select NENAME 국가명, round(POP/1000000) from NATIONS where REGION ='중동';
--
-- -5. '프랑스', '독일', '이탈리아'의 국가 이름과 인구 검색
select NKNAME 국가명, POP 인구 from NATIONS where NKNAME in ('프랑스', '독일', '이탈리아');
--
-- -6. 'United'라는 영문이 포함된 국가의 한글명과 영문명 검색
select NKNAME 한글명, NENAME 영문명 from NATIONS where NENAME like '%United%';
--
-- -7. 테이블에 저장된 국가들의 인구 합게를 검색하라
select to_char(sum(POP), '999,999,999,999') 인구합계 from NATIONS;
--
-- -8. 각 지역에 속한 국가수를 지역과 함께 검색
select count(NKNAME) 국가수, REGION 지역 from NATIONS group by REGION;
--
-- -9. 천만명 이상 인구를 가진 지역별 국가수를 검색하라
select REGION 지역, count(NKNAME) 국가수, to_char(sum(POP), '999,999,999,999') from NATIONS
group by REGION having sum(POP) >= 10000000;

select REGION 지역, count(NKNAME) 국가수, to_char(sum(POP), '999,999,999,999') from NATIONS
where pop >= 100000000 group by REGION;
--
-- -10. 전체 인구가 1억 이상인 지역을 검색하라
select REGION 지역, to_char(sum(POP), '999,999,999,999') 인구수 from NATIONS
group by REGION having sum(POP) >= 100000000;
-- ---
--
-- -11. 인구가 러시아 보다 많은 국가의 이름을 검색
--
-- -12. 그리스와 러시아가 속한 지역에 속하는 국가의 모든 열을 검색
--
-- -13. 1인당 gdp가 united kingdom 보다 많은 유럽 국가의 이름을 검색
--
-- -14. 인구가 사우디아라비아보다 많고 캐나바보다는 적은 국가의 이름을 검색

------------------
-- 10 조인 검색
    -- 조인은 2개 이상의 테이블을 연결해서 데이터를 조회하는 기능
    -- 정규화된 데이터베이스 구조에서 필요한 정보를 효율적으로 조회 가능
    -- => 정규화 목적 - 관련 데이터를 여러 테이블에 분산 저장 - 저장공간 절약, 일관성 유지
    -- 조인 시 적절한 조건을 사용해서 원하는 결과를 얻도록 해야함
    -- 대용량 데이터에서는 조인 연산이 성능에 영향을 줄 수 있음 - 최적화 필요!
    -- 복잡한 쿼리의 경우, 서브 쿼리나 임시 테이블을 활용할 수도 있음
    -- 단, 너무 많은 테이블 조인 시 이해와 쿼리 작성의 어려움 발생

-- join의 종류
    -- 두 테이블에서 조건이 일치하는 행만 반환
    -- 세타 조인 : 두 테이블 조인시 where절에 조인 조건과 등호연산자 사용  --옛날방식
    -- inner join : inner join과 on이라는 키워드로 조인 수행
    --              또한, using 구문을 사용하면 join 문을 간단히 작성가능

    -- 두 테이블에서 조건이 일치하지 않는 행들도 반환
    -- (full) outer join : 조건이 일치하는 행들과 더불어 일치하지 않는 행들도 반환
    -- left outer join : 조건이 일치하는 행들과
    --                   왼쪽 테이블의 일치하지 않는 나머지 행들도 반환
    -- right outer join : 조건이 일치하는 행들과
    --                   오른쪽 테이블의 일치하지 않는 나머지 행들도 반환

    -- 단일 테이블을 이용한 조인, 즉, 테이블을 자기 자신과 조인하는 기법
    -- 단, 테이블에 별칭을 사용해서 서로 다른 테이블처럼 취급
    -- self join

-- 23) 주문테이블에서 banana 고객에 주문한
-- 상품의 이름을 조회하세요
select PNAME from ORDERS, PRODUCTS
where ORDERS.PID = PRODUCTS.PID and cid = 'banana'; --세타조인

select PNAME from ORDERS inner join PRODUCTS
on ORDERS.PID = PRODUCTS.PID
where CID = 'banana';       -- inner 조인  : 컬럼명이 다를 때 권장 O

select PNAME from ORDERS inner join PRODUCTS
using (PID)
where CID = 'banana';     -- 세련된 inner 조인 : 컬럼명이 같을 때 권장 O

-- 24) 주문 테이블에서 나이가 30세 이상인
-- 고객이 주문한 제품의 제품번호와 주문일자를 조회하세요

select c.CID 고객번호, PID 제품번호, ODATE 주문일자
from ORDERS o inner join CUSTOMERS c
on o.CID = c.CID
where AGE >= 30;

select CID, PID 제품번호, ODATE 주문일자
from ORDERS inner join CUSTOMERS
using (CID)
where AGE >= 30;        -- 별칭 안붙여도됨 : 권장 O


-- 25) 주문 테이블에서 고명성 고객이
-- 주문한 제품의 이름을 조회하세요
select name 이름, p.PNAME 제품명
from ORDERS o inner join CUSTOMERS c
on o.CID = c.CID
inner join PRODUCTS p
on o.PID = p.PID
where c.NAME = '고명성';

-- 26) 주문테이블에서 주문한 고객의 아이디, 이름을 조회하세요.
select distinct cid, name
from ORDERS join CUSTOMERS
using (CID);

-- 27) 주문테이블에서 주문한 고객과 주문하지 않은 고객의 아이디, 이름을 조회하세요.
select distinct cid, name
from ORDERS right join CUSTOMERS
using (CID);

-- 28) 주문테이블에서 주문하지 않은 고객의 아이디, 이름을 조회하세요.
select distinct cid, name
from ORDERS right join CUSTOMERS
using (CID)
WHERE OID IS NULL;

-- 29) 주문테이블에서 주문되지 않은 제품의 이름, 제조업체를 조회하세요.
select PNAME, MAKER
from ORDERS right join PRODUCTS
using (PID)
where OID is NULL;

select distinct PNAME, MAKER
from PRODUCTS p left join ORDERS o
using (PID)
where OID is NULL;


------------------------
-- ( Books, Spells, Clients )
-- 15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
-- 고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select c.CID 고객번호, c.NAME 고객이름, s.SALEPRICE 주문금액, c.ADDR 주소
from SPELLS s inner join CLIENTS c
on s.CID = c.CID;

-- 15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요
-- 고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select c.CID 번호, c.NAME 이름, s.SALEPRICE 주문금액, c.ADDR 주소, s.ORDERDATE 주문일자
from SPELLS s join CLIENTS c
on s.CID = c.CID
where NAME = '박지성';

-- using에 사용된 컬럼을 출력할때 앞에 별칭을 붙이면 출력 안됨. c.CID X, c.NAME O
select CID 번호, NAME 이름, SALEPRICE 주문금액, ADDR 주소, ORDERDATE 주문일자
from SPELLS join CLIENTS
using (CID)
where NAME = '박지성';

-- 16) 주문한 도서이름,주문금액,주문일자를 조회하세요
-- 도서테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select b.BOOKNAME 도서이름, s.SALEPRICE 주문금액, s.ORDERDATE 주문일자
from BOOKS b inner join SPELLS s
on b.BOOKID = s.BOOKID;

select BOOKNAME 도서이름, SALEPRICE 주문금액, ORDERDATE 주문일자
from BOOKS join SPELLS
using (BOOKID);

-- 19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요
-- 고객테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select c.NAME 고객명, s.SALEPRICE 가격
from CLIENTS c inner join SPELLS s
on c.CID = s.CID
where s.SALEPRICE = 20000;

select NAME 고객명, SALEPRICE 가격
from CLIENTS inner join SPELLS
using (CID)
where SALEPRICE = 20000;

-- 20) 주문한 고객이름, 도서이름, 주문일자 출력하세요
-- 도서/고객 테이블과 주문테이블을 결합해야 조회가능
-- 즉, 외래키 관계에 있는 컬럼을 대상으로 결합
select c.NAME 고객이름, b.BOOKNAME 도서이름, ORDERDATE 주문일자
from CLIENTS c inner join SPELLS s
using (CID)
inner join BOOKS b
using (BOOKID);


-- 추상화가 되었다. ( 더 간결해짐 ) : 권장
select NAME 고객이름, BOOKNAME 도서이름, ORDERDATE 주문일자
from CLIENTS
join SPELLS using (CID)
join BOOKS using (BOOKID);

-- 21) 도서를 구매하지 않은 고객을 포함하여
--    고객이름과 주문한 도서의 판매금액을 조회하세요
select NAME, sum(SALEPRICE)
from CLIENTS left join SPELLS
using (CID)
group by NAME;


-- 연습문제 B3 - HR 데이터베이스
-- 모든 사원들의 LAST_NAME, 부서 이름 및
-- 부서 번호을 조회하세요
select LAST_NAME 이름, DEPARTMENT_NAME 부서명, DEPARTMENT_ID 부서번호
from EMPLOYEES inner join DEPARTMENTS
using (DEPARTMENT_ID);

select DEPARTMENT_NAME 부서명, LAST_NAME 이름, DEPARTMENT_ID 부서번호
from EMPLOYEES join DEPARTMENTS
using (DEPARTMENT_ID)
order by DEPARTMENT_ID;

-- 부서번호 30의 모든 직업들과 부서명으로 조회하세요
-- 90 부서 또한 포함한다.
select e.EMPLOYEE_ID 사원번호,
       d.DEPARTMENT_ID 부서번호,
       d.DEPARTMENT_NAME 부서명,
       JOB_TITLE 직업
from EMPLOYEES e inner join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
inner join JOBS j
on e.JOB_ID = j.JOB_ID
where d.DEPARTMENT_ID in (30, 90);

select EMPLOYEE_ID 사원번호,
       DEPARTMENT_ID 부서번호,
       DEPARTMENT_NAME 부서명,
       JOB_TITLE 직업
from EMPLOYEES join DEPARTMENTS
using (DEPARTMENT_ID)
inner join JOBS
using (JOB_ID)
where DEPARTMENT_ID in (30, 90)
order by DEPARTMENT_ID;

-- 부서번호 30 이하의 모든 직업들과
-- 부서명으로 조회하세요
select EMPLOYEE_ID 사원번호,
       JOB_TITLE 직업명,
       DEPARTMENT_ID 부서번호,
       DEPARTMENT_NAME 부서명
from DEPARTMENTS inner join EMPLOYEES
using(DEPARTMENT_ID)
inner join JOBS
using(JOB_ID)
where DEPARTMENT_ID <=30
order by DEPARTMENT_ID, JOB_ID;

-- 커미션을 버는 모든 사람들의 LAST_NAME,
-- 부서명, 지역 ID 및 도시 명을 조회하세요
select LAST_NAME 이름, DEPARTMENT_NAME 부서명, CITY 도시명, REGION_ID 지역ID
from EMPLOYEES join DEPARTMENTS using (DEPARTMENT_ID)
join LOCATIONS using (LOCATION_ID)
join COUNTRIES using (COUNTRY_ID)
where COMMISSION_PCT is not NULL;

SELECT * FROM EMPLOYEES e inner join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID where e.COMMISSION_PCT IS not NULL;

SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

-- 시에틀에서 근무하는
-- 사람들의 LAST_NAME, 부서명, 지역 ID 및
-- 도시 명을 조회하세요 (옥스포드)
select LAST_NAME 이름, DEPARTMENT_NAME 부서명, CITY 도시명, REGION_ID 지역ID
from EMPLOYEES
join DEPARTMENTS using (DEPARTMENT_ID)
join LOCATIONS using (LOCATION_ID)
join COUNTRIES using (COUNTRY_ID)
where CITY = 'Seattle';

-- 자신의 매니저의 이름과 고용일을 조회하세요
select m.FIRST_NAME 매니저명, e.HIRE_DATE 고용일
from EMPLOYEES e inner join EMPLOYEES m
on e.MANAGER_ID = m.EMPLOYEE_ID;


-- 자신의 매니저보다 먼저 고용된 사원들의
-- LAST_NAME 및 고용일을 조회하세요.
select e.LAST_NAME 이름,
       e.HIRE_DATE "사원 입사일",
       e.MANAGER_ID "담당 상사 ID",
       m.EMPLOYEE_ID "상사의 사원ID",
       m.LAST_NAME "상사 이름",
       m.HIRE_DATE "상사 입사일"
from EMPLOYEES e inner join EMPLOYEES m
on e.MANAGER_ID = m.EMPLOYEE_ID
where e.HIRE_DATE < m.HIRE_DATE;

-- 부서별 사원수를 조회하세요
-- 단, 부서명도 함께 출력합니다
select DEPARTMENT_NAME 부서명, count(EMPLOYEE_ID) 사원수
from EMPLOYEES inner join DEPARTMENTS
using(DEPARTMENT_ID)
group by DEPARTMENT_NAME;

-- 부서별 사원수를 조회하세요
-- 단, 부서명도 함께 출력하고
-- 단, 사원수가 0이어도 부서명을 출력합니다
select DEPARTMENT_NAME, count(EMPLOYEE_ID) 사원수
from EMPLOYEES right join DEPARTMENTS
using(DEPARTMENT_ID)
group by DEPARTMENT_NAME;

-- ACCOUNTING 부서 소속 사원의 이름과 입사일 조회하세요
select FIRST_NAME 이름, HIRE_DATE 입사일, DEPARTMENT_NAME 부서명
from EMPLOYEES join DEPARTMENTS
using (DEPARTMENT_ID)
where DEPARTMENT_NAME ='Accounting'
order by DEPARTMENT_NAME;

-- 이름에 A가 들어가는 사원들의 이름과 부서이름을 조회하세요
select FIRST_NAME 이름, DEPARTMENT_NAME 부서명
from EMPLOYEES join DEPARTMENTS
using (DEPARTMENT_ID)
where FIRST_NAME like '%A%'
order by DEPARTMENT_NAME;

-- 연봉이 3000 이상인 사원의 이름과 부서명과 연봉을 조회하세요
select FIRST_NAME 이름, DEPARTMENT_NAME 부서명, SALARY 연봉
from EMPLOYEES join DEPARTMENTS
using (DEPARTMENT_ID)
where SALARY >= 3000
order by SALARY;

-- 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 조회하세요
select FIRST_NAME 이름, DEPARTMENT_NAME 부서명, SALARY 연봉
from EMPLOYEES join DEPARTMENTS
using (DEPARTMENT_ID)
where SALARY between 3000 and 5000
order by SALARY;

-- 급여가 3000이하인 사원의 이름과 급여, 근무지를 조회하세요
select FIRST_NAME 이름, round(SALARY) 급여, CITY 근무지
from EMPLOYEES
join DEPARTMENTS using (DEPARTMENT_ID)
join LOCATIONS using (LOCATION_ID)
where SALARY <= 3000
order by SALARY desc;

-- 사원이 없는 부서를 조회하세요
select DEPARTMENT_NAME 부서명, count(EMPLOYEE_ID) 사원수
from EMPLOYEES right join DEPARTMENTS
using (DEPARTMENT_ID)
where EMPLOYEE_ID is NULL
group by DEPARTMENT_NAME
order by DEPARTMENT_NAME;