-- 데이터 조회 : select
-- select는 SQL에서 가장 중요하고 유용한 명령 중에 하나.
-- 데이터를 조회하고 검색하는데 사용
-- select 속성들, ...
-- from 테이블명
-- where 조건절
-- order by 정렬조건;

-- 1. 기본적인 테이블 컬럼 조회

-- 1) 고객테이블에서 아이디,이름,등급을 조회하세요
select CID, NAME, GRADE from CUSTOMERS;

-- 2) 고객테이블에서 모든 컬럼을 조회하세요
select cid, name, age, grade, job, mileage from CUSTOMERS;

select * from CUSTOMERS;

-- 3) 제품테이블에서 제조업체를 조회하세요
-- all : 중복을 허용해서 존재하는 모든 값을 조회 (기본)
-- distinct : 중복을 제거해서 한개의 값만 조회

select maker from PRODUCTS;  -- 업체가 중복 출력됨
select all maker from PRODUCTS;  -- 중복 출력

select distinct maker from PRODUCTS;    -- 중복 출력X

-- 3) 제품테이블에서 제조업체를 조회하세요
-- 단, 총 몇개의 업체가 있는지 알아봅니다
select count(maker) from PRODUCTS;

select count(distinct maker) from PRODUCTS;     -- 중복제거

-- 2. 테이블 컬럼 조회시 조회결과 컬럼명을 변경
-- select 속성이름 as 새속성이름 from 테이블명;
-- as는 생략 가능

-- 4) 제품테이블에서 제품명과 가격을 조회하되
-- 컬럼명을 한글로 바꿔 출력하세요
select PNAME as 제품명, PRICE as 가격 from PRODUCTS;
select PNAME 제품명, PRICE 가격 from PRODUCTS;
-- 컬럼명 띄어쓸때 작은따옴표, 큰따옴표 사용  - 오라클에선 큰다옴표만 가능
select pname 제품명, price "제품 단가" from PRODUCTS;

-- 3. 산술식을 이용한 검색
-- select 사용 시 산술연산자를 이용해서 조회 가능
-- select 산술식 from 테이블명

-- 5) 제품테이블에서 제품명과 가격을 조회하고
-- 가격에 500원을 더해 '2021년 단가'라는 별칭을 가진
-- 새로운 컬럼도 함께 출력하세요
select pname, price, price+500 "2021년 단가 (500원 인상)" from PRODUCTS;

-- 5) 모든 회원의 적립금을 1000씩 추가해주었을때의
-- 결과를 알아보려고 한다. 적절한 질의문을 작성하세요
select CID, MILEAGE "수정 전 적립금", MILEAGE+1000 "수정 후 적립금"
from CUSTOMERS;

-- 4. 조건식을 이용한 검색
-- 조건을 만족하는 데이터만 검색할 때 사용
-- where 라는 예약어를 사용하고
-- 비교연산자, 논리연산자 등으로 구성된 조건식 필요
-- select 속성명 from 테이블명 where 조건식;


-- 6) 제품테이블에서 한빛제과가 제조한 제품의
-- 제품명, 재고량, 단가를 조회하세요
select pname, stock, price from PRODUCTS;   -- 모두 조회
select pname, stock, price from PRODUCTS where maker = '한빛제과';

-- 7) 주문테이블에서 apple 이라는 고객이
-- 15개 이상 주문한 주문제품, 수량, 주문일자를 조회하세요
select pid, QTY, ODATE from ORDERS where CID = 'apple' and QTY >=15;


-- 7) 주문테이블에서 apple 이라는 고객이 주문했거나
-- 15개 이상 주문된 주문제품, 수량, 주문일자를 조회하세요
select pid, QTY, ODATE from ORDERS where CID = 'apple' or QTY >=15;

-- 8) 제품테이블에서 단가가 2000원이상이고
-- 3000원이하인 제품의 제품명, 단가, 제조업체를 조회하세요
select PNAME, PRICE, MAKER  from PRODUCTS
where PRICE >=2000 and PRICE <= 3000;
-- 2000 <= price <=3000

-- 권장
select PNAME, PRICE, MAKER  from PRODUCTS
where price between 2000 and 3000;

-- 5. Like 검색
-- 문자열 패턴 매칭을 위해 사용하는 기능
-- 즉, where 절에서 특정 패턴과 일치하는 데이터를 검색할 때 사용
-- 와일드 카드 문자
-- % : 0개 이상 임의의 문자를 나타냄
-- _ : 정확하게 한개의 임의의 문자를 나타냄
-- 주요 패턴 예
-- 'a%' : a 로 시작하는 문자열
-- '%a' : a 로 끝나는 문자열
-- '%a%' : a 를 포함하는 문자열
-- 'a___' : a 로 시작하는 4글자 문자열
-- '___a' : a 로 끝나는 4글자 문자열
-- '_a_' : a 가 가운데 있는 3글자 문자열
-- '_a%' : a 가 두번째 문자이고 시작하는 문자열
-- 'a_%' : a 가 첫번째 문자이고 2개 문자로 시작하는 문자열

-- 고객 테이블에서 성이 김씨인 고객의
-- 고객이름, 나이, 등급, 적립금을 검색하세요
select name, age, grade, MILEAGE from CUSTOMERS
where name like '김%';

select name, age, grade, MILEAGE from CUSTOMERS
where name like '김__';

-- 고객 테이블에서 고객아이디가 5자인
-- 고객의 고객아이디, 고객이름, 등급을 검색하세요.
select cid, name, grade from CUSTOMERS
where cid like '_____';

-- 6. NULL 검색
-- 데이터베이스에서 NULL은 '알 수 없는 값', '적용할 수 없는 값'을 의미
-- 따라서, 일반적인 연산자로는 처리할 수 없음

-- 9) 고객 테이블에서 나이가 입력되지 않은 고객을 조회하세요
select name, age from CUSTOMERS where age = null;   -- 실행 X
select name, age from CUSTOMERS where age is NULL;  -- NULL 은 되도록 대문자로 작성

-- 10) 고객 테이블에서 나이가 이미 입력된 고객을 조회하세요
select name, age from CUSTOMERS where age <> NULL;  -- 실행 X
select name, age from CUSTOMERS where age is not NULL;

