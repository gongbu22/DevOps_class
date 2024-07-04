-- 서브쿼리
    -- 쿼리 속에 포함된 또 다른 쿼리를 의미
    -- (주쿼리 + 서브쿼리 : 중첩 select문)
    -- 복잡한 데이터 검색 및 조작 작업 수행시 주로 사용
    -- 서브쿼리 위치 : where(많이 사용), from(인라인뷰에서 많이 사용), select, having
    -- 서브쿼리 유형 : 스칼라(단일값), 행(단일행), 테이블(여러행/열)
    -- 상관쿼리 vs 비상관쿼리
    -- => 서브쿼리와 주쿼리가 서로 독립적인지(비상관) 종속적인지(상관) 구분
    -- => 각 쿼리가 한번씩 실행되는지(비상관), 주쿼리의 각 행마다 실행되는지(상관) 구분
    -- => 비상관쿼리가 상관쿼리보다 처리 속도가 빠른편임
    -- => 비상관쿼리가 상관쿼리보다 이해하기 쉬움 - 단순하기 때문
    -- 복잡한 쿼리를 더 작고 관리하기 쉬운 부분으로 나눠 실행 가능

   -- (CUSTOMERS, ORDERS, PRODUCTS)
-- 달콤비스켓을 제조한 업체가 만든 제품들의
-- 이름과 단가 조회
select maker from PRODUCTS
where PNAME = '달콤비스킷'; -- 한빛제과

select PNAME, PRICE from PRODUCTS
where MAKER = '한빛제과';

    -- 스칼라 서브쿼리 (단일값)
select PNAME, PRICE from PRODUCTS
where MAKER = (select maker from PRODUCTS where PNAME = '달콤비스킷');

-- 적립금이 가장 많은 고객의 이름과 적립금 조회
select max(MILEAGE) from CUSTOMERS;

select NAME 이름, MILEAGE 적립금 from CUSTOMERS
where MILEAGE = (select max(MILEAGE) from CUSTOMERS);

-- banana 고객이 주문한 제품의 제품명과 업체 조회
select PID from ORDERS WHERE CID = 'banana';

select PID 제품번호, PNAME 제품명, MAKER 업체 from PRODUCTS
where PID in (select PID from ORDERS WHERE CID = 'banana');

    -- join은 메모리가 많이 사용되기 때문에 서브쿼리를 사용하길 권장!
    -- 성능면에서 서브쿼리가 더 좋음
select PID, PNAME, MAKER from PRODUCTS
join ORDERS using (PID) where CID = 'banana';

-- banana 고객이 주문하지 않은 제품의 제품명과 업체 조회
select PID from ORDERS WHERE CID = 'banana';

select PID 제품번호, PNAME 제품명, MAKER 업체 from PRODUCTS
where PID NOT IN (select PID from ORDERS WHERE CID = 'banana');

    -- 위 쿼리랑 의미가 좀 다름
select distinct PID, CID, PNAME 제품명, MAKER 업체 from ORDERS o join PRODUCTS p
using (PID) where CID <> 'banana';

-- 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의
-- 제품명과 업체 조회
select PRICE from PRODUCTS where MAKER = '대한식품';

select PNAME 제품명, MAKER 업체, PRICE 가격 from PRODUCTS
where PRICE > all (select PRICE from PRODUCTS where MAKER = '대한식품');

-- silver 등급인 회원들의 마일리지보다 많은 회원의 이름 조회
select MILEAGE from CUSTOMERS where GRADE = 'silver';

select NAME 회원명, MILEAGE 마일리지 from CUSTOMERS
where MILEAGE > all (select MILEAGE from CUSTOMERS where GRADE = 'silver');

-- 2022년 3월 15일에 제품을 주문한 고객의 이름 조회
select CID from ORDERS where ODATE = '2022-03-15';

select CID, NAME 고객명 from CUSTOMERS     -- 3)
where CID in (select CID from ORDERS    -- 1)
             where ODATE = '2022-03-15');   -- 2)

    -- 상관쿼리 : EXISTS
        -- 주 쿼리에 상관쿼리를 하나씩 다 비교하기 때문에
        -- 행이 많을 수록 성능이 낮음 - 권장 X
    select NAME from CUSTOMERS c  -- 1)
        where exists(select * from ORDERS o -- 3)
                     where ODATE = '2022-03-15'  -- 2-2)
                     and c.CID = o.CID);    -- 2-1)
    -- 0) ✨중요✨ - 실행순서는 주쿼리부터 시작!!
    -- 1) Customers 테이블의 각행에 대해
    -- 2) 해당 고객의 cid 와 주문일자가 일치하는 주문이
    -- Orders 테이블에 존재하는 지 확인
    -- 3) 주문이 존재하면 해당 고객의 이름을 결과에 포함
    -- 4) 단, 조건이 일치하는 경우 즉시 평가 중단!
    -- => 대량의 데이터를 다룰때 효율적일 수도 있음!
    -- (찾고자 하는 데이터가 맨 앞에 있으면 GOOD, 맨 뒤에 있으면 BAD)


-- 2013년 3월 15일에 제품을 주문하지 않은 고객의 이름 조회
select CID from ORDERS where ODATE = '2022-03-15';

select CID, NAME 고객명 from CUSTOMERS
where CID not in (select distinct CID from ORDERS
              where ODATE = '2022-03-15');

select NAME from CUSTOMERS c  -- 1)
where NOT exists(select * from ORDERS o -- 3)
             where ODATE = '2022-03-15'  -- 2-2)
               and c.CID = o.CID); -- 2-1)



-- 뷰
    -- 데이터베이스 객체 중 하나로 하나 이상의 테이블을 기반으로
    -- select문을 이용해서 파생된 가상 테이블
    -- 뷰는 실제 데이터를 저장하지 않고,
    -- 쿼리의 결과만 보여주는 역할만 수행
    -- 데이터 보안 증대 : 특정 컬럼만 보여주도록 설정 가능
    -- 쿼리 단순화 : 자주 사용하는 복잡한 쿼리를 뷰로 생성
    -- create view 뷰이름(컬럼들) as
    -- select문
    -- 뷰의 종류 : 변경가능 뷰 vs 변경불가 뷰
    -- 변경가능 뷰 : 뷰 생성시 제약조건과 관련된 컬럼을
    --              포함시켜 만든 뷰 (추가/수정/삭제 가능)

--  ( Customers, Orders, Products )
-- vip 고객의 아이디, 이름, 나이로 구성된 뷰 생성
-- 단,이름은 우수고객으로 작성
select CID, NAME, AGE from CUSTOMERS where GRADE = 'vip';

create view 우수고객 as
select CID, NAME, AGE from CUSTOMERS where GRADE = 'vip';

select * from 우수고객;

-- 제조업체별 제품수로 구성된 뷰 생성
-- 뷰이름은 업체별제품수로 지정
create view 업체별제품수 as
select MAKER 제조업체, count(PID) 제품수 from PRODUCTS group by MAKER;

select  * from 업체별제품수;

-- 우수고객 테이블에서 나이가 25세이상인 회원 조회
select NAME 회원명 , AGE 나이 from 우수고객 where AGE >= 25;

-- 제품번호, 재고량, 제조업체를 골라서
-- 제품1라는 뷰를 생성하고
-- 제품번호는 p08, 재고량은 1000,
-- 제조업체는 신선식품이라는 정보를 추가함
create view 제품1 as
select PID 제품번호, STOCK 재고량, MAKER 제조업체 from PRODUCTS;

select * from 제품1;

insert into 제품1 values ('p08', 1000, '신선식품');

-- 제품명, 재고량, 제조업체를 골라서
-- 제품2라는 뷰를 생성하고
-- 제품명은 '붕어빵', 재고량은 500,
-- 제조업체는 신선식품이라는 정보를 추가함

create view 제품2 as
select PNAME, STOCK, MAKER from PRODUCTS;

select * from 제품2;

-- 삽입 불가 : 기본키가 없어서
insert into 제품2 values ('붕어빵', 500, '신선식품');

-- 주문, 상품, 고객테이블을 조인하고
-- 판매데이터라는 뷰를 만드세요
-- 또한, banana 고객이 주문한 상품이름을 조회하세요

create view 판매데이터 as
select * from CUSTOMERS join ORDERS using (CID) join PRODUCTS using (PID);

SELECT PNAME, CID FROM 판매데이터 WHERE CID = 'banana';

-- 사원,부서,위치 테이블을 조인하고
-- empdeptloc라는 뷰를 만드세요
-- 또한, King이라는 사원이 근무하는
-- 사무실의 도시를 조회하세요

create view empdeptloc as
select employee_id, first_name, last_name, email,
       phone_number, hire_date, job_id, salary,
       commission_pct, e.manager_id EMANAGER_ID, department_id,
       department_name, d.manager_id DMANAGER_ID, location_id,
       street_address, postal_code, city, state_province, country_id
from EMPLOYEES e join DEPARTMENTS d using (DEPARTMENT_ID)
join LOCATIONS using (LOCATION_ID);

select * from empdeptloc;

select city from empdeptloc where last_name ='King';

-- 뷰 삭제 : drop view 뷰이름
drop view 업체별제품수;
drop view 우수고객;
drop view 제품1;
drop view 제품2;

-- EMPLOYEES 테이블에서 20번 부서의 세부 사항을 포함하는 EMP_20 VIEW를 생성 하라
    create view EMP_20 as
    select * from EMPLOYEES where DEPARTMENT_ID = 20;
--
--
-- EMPLOYEES 테이블에서 30번 부서만 EMPLOYEE_ID 를 emp_no 로
-- LAST_NAME을 name으로 SALARY를 sal로 바꾸어 EMP_30 VIEW를 생성하라
    create view EMP_30 as
    select employee_id emp_no, first_name, last_name name,
           email, phone_number, hire_date,
           job_id, salary sal, commission_pct,
           manager_id, department_id
    from EMPLOYEES where DEPARTMENT_ID = 30;
--
--
-- 부서별로 부서명,최소 급여,최대 급여,부서의 평균 급여를 포함하는 DEPT_SUM VIEW을 생성하여라
create view DEPT_SUM as
select DEPARTMENT_NAME,
           min(SALARY) "최소 급여",
           max(SALARY) "최대 급여",
           round(avg(SALARY)) "평균 급여"
    from EMPLOYEES e
    join DEPARTMENTS d using(DEPARTMENT_ID)
    group by DEPARTMENT_NAME;
--
create view DEPT_SUM as
select DEPARTMENT_NAME,
       min(SALARY) "최소 급여",
       max(SALARY) "최대 급여",
       round(avg(SALARY)) "평균 급여"
from empdeptloc group by DEPARTMENT_NAME;

create view DEPT_SUM as
    select DEPARTMENT_ID,
        min(SALARY) "최소 급여",
       max(SALARY) "최대 급여",
       round(avg(SALARY)) "평균 급여"
    from EMPLOYEES group by DEPARTMENT_ID;

select DEPARTMENT_NAME from DEPT_SUM join DEPARTMENTS using (DEPARTMENT_ID);

--
-- 앞에서 생성한 EMP_20,EMP_30 VIEW을 삭제하여라
drop view EMP_20;
drop view EMP_30;
drop view DEPT_SUM;

-- 인라인 뷰
-- SQL 쿼리의 FROM절 내에 직접 작성하는 서브쿼리
-- 쿼리가 실행하는 동안에만 존재하는 가상 테이블
-- 영구저장x, 해당 쿼리에서만 사용 가능, 대게 별칭 사용

-- 부서번호와 부서별 최대 급여, 부서명을 조회하세요.
select DEPARTMENT_ID, d.DEPARTMENT_NAME, e.maxsal
from (select DEPARTMENT_ID, max(SALARY) maxsal from EMPLOYEES group by DEPARTMENT_ID) e
join DEPARTMENTS d using (DEPARTMENT_ID);