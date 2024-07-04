-- (books, clients, spells)
--
-- 22. 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
select avg(SALEPRICE) from SPELLS;

select OID 주문번호, SALEPRICE 금액 from SPELLS
where SALEPRICE <= (select avg(SALEPRICE) from SPELLS);
--
-- 23. 각 고객의 평균 주문금액보다
-- 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오.
select avg(SALEPRICE) from SPELLS group by CID;

select OID 주문번호, CID 고객번호, SALEPRICE 금액 from SPELLS
where SALEPRICE > all (select avg(SALEPRICE) from SPELLS group by CID);

    -- 상관쿼리1 ( 큰지 여부 비교)
    select oid, cid, SALEPRICE from SPELLS o
    group by oid, cid, SALEPRICE     -- 1. 고객 별 주문내역 정리
    having SALEPRICE > (select avg(SALEPRICE) from SPELLS s     -- 2. 고객별 평균 주문 금액 계산해서 3. 실제 주문 금액과 큰지 비교
                        where s.cid = o.cid);

    -- 상관쿼리2 (상관쿼리 1의 간소화 - group by 생략)
    select oid, cid, SALEPRICE from SPELLS o
    where SALEPRICE > (select avg(SALEPRICE) from SPELLS s where o.cid = s.cid);
--
-- 24. 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.
select CID from CLIENTS where ADDR like '%대한민국%';

select sum(SALEPRICE) 총판매액 from SPELLS
where CID in (select CID from CLIENTS where ADDR like '%대한민국%');
--
-- 25. 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오.
select max(SALEPRICE) from SPELLS where CID = '3';

select OID 주문번호, SALEPRICE 금액 from SPELLS
where SALEPRICE > (select max(SALEPRICE) from SPELLS where CID = '3');
--
-- 26. EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
select sum(SALEPRICE) from SPELLS s
where exists (select CID from CLIENTS c where ADDR like '%대한민국%' and c.CID = s.CID);
--
--
-- HR 데이터베이스
--
-- 42. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및
-- 고용날짜를 조회한다. 단, Zlotkey 는 제외한다.
select DEPARTMENT_ID from EMPLOYEES where LAST_NAME = 'Zlotkey';

select EMPLOYEE_ID 사번, LAST_NAME 이름, HIRE_DATE 고용날짜 from EMPLOYEES
where DEPARTMENT_ID = (select DEPARTMENT_ID from EMPLOYEES where LAST_NAME = 'Zlotkey')
and LAST_NAME <> 'Zlotkey' order by LAST_NAME;
--
--
-- 43. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회한다.
select avg(SALARY) 평균연봉 from EMPLOYEES;

select EMPLOYEE_ID 사번, LAST_NAME 이름, round(SALARY) 연봉 from EMPLOYEES
where SALARY > (select avg(SALARY) 평균연봉 from EMPLOYEES)
order by SALARY;
--
--
-- 44. LAST_NAME 에 u가 포함되는 사원들과 동일 부서에 근무하는 사원들의
-- 사번 및 LAST_NAME 을 조회한다.
select distinct DEPARTMENT_ID from EMPLOYEES where LAST_NAME like '%u%';

select EMPLOYEE_ID 사번, LAST_NAME 이름, DEPARTMENT_ID 부서번호 from EMPLOYEES
where DEPARTMENT_ID
in (select distinct DEPARTMENT_ID from EMPLOYEES where LAST_NAME like '%u%')
order by DEPARTMENT_ID;
--
--
-- 45. King 을 매니저로 두고 있는 모든 사원들의 LAST_NAME 및 연봉을 조회한다.
-- 즉, King의 부하직원의 성과 연봉 조회하라
SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME = 'King';

select LAST_NAME 이름, round(SALARY) 연봉, MANAGER_ID 매니저번호 from EMPLOYEES
where MANAGER_ID in (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME = 'King');
--
--
-- 46. Executive 부서에 근무하는 모든 사원들의 부서 번호, LAST_NAME, JOB_ID를  조회한다.
select DEPARTMENT_ID from DEPARTMENTS where DEPARTMENT_NAME = 'Executive';

select DEPARTMENT_ID 부서번호, LAST_NAME 이름, JOB_ID 직업번호 from EMPLOYEES
where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENTS where DEPARTMENT_NAME = 'Executive');

select DEPARTMENT_ID 부서번호, LAST_NAME 이름, JOB_ID 직업번호 from EMPLOYEES
join DEPARTMENTS using (DEPARTMENT_ID) WHERE DEPARTMENT_NAME = 'Executive';
--
-- 47. 회사 전체 평균 연봉 보다 더 버는 사원들 중
-- LAST_NAME 에 u 가 있는 사원들이 근무하는 부서에서
-- 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.
select avg(SALARY) from EMPLOYEES;

select EMPLOYEE_ID from EMPLOYEES
where LAST_NAME like '%u%' and SALARY > (select avg(SALARY) from EMPLOYEES);

select EMPLOYEE_ID 사번, LAST_NAME 이름, SALARY 연봉 from EMPLOYEES
where DEPARTMENT_ID
in (select  distinct DEPARTMENT_ID from EMPLOYEES where LAST_NAME like '%u%')
  and SALARY > (select avg(SALARY) from EMPLOYEES);
--
--
-- 48. 직책이 SA_MAN 인 사원들이 받을 수 있는 최대 연봉 보다 많이 받는 사원들의
-- LAST_NAME, JOB_ID 및 연봉을 조회한다.
select MAX_SALARY from JOBS where JOB_ID = 'SA_MAN';

select LAST_NAME 이름, JOB_ID 직업번호, SALARY 연봉 from EMPLOYEES
where SALARY > (select MAX_SALARY from JOBS where JOB_ID = 'SA_MAN');
--
--
-- 49. 직책이 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의
--  LAST_NAME, JOB_ID 및 연봉을 조회한다.
select max(SALARY) from EMPLOYEES where JOB_ID = 'SA_MAN';

select LAST_NAME 이름, JOB_ID 직업번호, SALARY 연봉 from EMPLOYEES
where SALARY > (select max(SALARY) from EMPLOYEES where JOB_ID = 'SA_MAN');

-- 50. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회한다.
select LOCATION_ID from LOCATIONS where CITY like 'T%';

select DEPARTMENT_ID from DEPARTMENTS
where LOCATION_ID in (select LOCATION_ID from LOCATIONS where CITY like 'T%');

select EMPLOYEE_ID 사번, LAST_NAME 이름, DEPARTMENT_ID 부서번호 from EMPLOYEES
where DEPARTMENT_ID
in (select DEPARTMENT_ID from DEPARTMENTS where LOCATION_ID in
        (select LOCATION_ID from LOCATIONS where CITY like 'T%'));

select EMPLOYEE_ID 사번, LAST_NAME 이름, DEPARTMENT_ID 부서번호 from EMPLOYEES
join DEPARTMENTS using (DEPARTMENT_ID)
join LOCATIONS using (LOCATION_ID)
where CITY like 'T%';
--
-- 51. ST_CLERK 인 직업 ID 를 가진 사원이 없는 부서 ID 를 조회한다.
-- NULL 값은 제외한다. (NOT EXISTS 사용)
select DEPARTMENT_ID from EMPLOYEES where JOB_ID = 'ST_CLERK';

select distinct DEPARTMENT_ID 부서ID from EMPLOYEES e
where not exists (select EMPLOYEE_ID from EMPLOYEES emp
                        where JOB_ID = 'ST_CLERK'
                        and e.DEPARTMENT_ID = emp.DEPARTMENT_ID)
and DEPARTMENT_ID is not null
order by DEPARTMENT_ID;
--
-- 52. ST_CLERK 인 직업 ID 를 가진 사원이 있는 부서 ID 를 조회한다.
-- NULL 값은 제외한다. (NOT EXISTS 사용)
-- 문제 해결 포인트 : 부정 + 부정 = 긍정
-- select distinct EMPLOYEE_ID from EMPLOYEES e2
--        where JOB_ID <> 'ST_CLERK' 실행시 50번 부서 출력 => 다른 조건 사용
select distinct EMPLOYEE_ID from EMPLOYEES where JOB_ID <> 'ST_CLERK';

select distinct DEPARTMENT_ID from EMPLOYEES e where not exists(
    select distinct EMPLOYEE_ID from EMPLOYEES e2
       where JOB_ID <> 'ST_CLERK' and e.EMPLOYEE_ID = e2.EMPLOYEE_ID
)
and DEPARTMENT_ID is not null
order by DEPARTMENT_ID;
--
-- 53. 부서가 없는 국가 ID 및 국가 이름을 조회힌다.(NOT EXISTS 사용)
select DEPARTMENT_NAME, LOCATION_ID from DEPARTMENTS;
select COUNTRY_ID from LOCATIONS;
select COUNTRY_ID from COUNTRIES;

select DEPARTMENT_NAME, COUNTRY_ID, COUNTRY_NAME
from DEPARTMENTS inner join LOCATIONS
using (LOCATION_ID) inner join COUNTRIES
using (COUNTRY_ID)
where DEPARTMENT_NAME is null;

select distinct DEPARTMENT_NAME, COUNTRY_ID, COUNTRY_NAME
from DEPARTMENTS inner join LOCATIONS
using (LOCATION_ID) right join COUNTRIES
using (COUNTRY_ID)
where DEPARTMENT_NAME is null;

-- 부서가 존재하지 않는 국가 조회 ( not exists )
select COUNTRY_ID, COUNTRY_NAME from COUNTRIES c
where not exists(select LOCATION_ID from LOCATIONS l
                join DEPARTMENTS using (LOCATION_ID)
                where l.COUNTRY_ID = c.COUNTRY_ID);

-- 부서가 존재하지 않는 국가 조회 ( not exists 2 )
select COUNTRY_ID, COUNTRY_NAME from COUNTRIES c
where not exists(select LOCATION_ID from LOCATIONS l
                where l.LOCATION_ID in (select LOCATION_ID from DEPARTMENTS)
                  and l.COUNTRY_ID = c.COUNTRY_ID);
--

-- 54. 위치한 부서가 있는 국가 ID 및 국가 이름을 조회힌다.(NOT EXISTS 사용)
--
--
-- 55. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID를 조회한다.
select distinct EMPLOYEE_ID from JOB_HISTORY;

select EMPLOYEE_ID 사번, JOB_ID 직업ID from EMPLOYEES
where EMPLOYEE_ID not in (select distinct EMPLOYEE_ID from JOB_HISTORY)
order by EMPLOYEE_ID;

-- 직책 변경이력이 있는 사람들
select distinct EMPLOYEE_ID from EMPLOYEES e join JOB_HISTORY j
using (EMPLOYEE_ID);

-- 직책 변경이력이 있는 사람들
select * from EMPLOYEES e left join JOB_HISTORY j
using (EMPLOYEE_ID)
where j.JOB_ID is null;
--
-- 56. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.
select DEPARTMENT_ID, SALARY from EMPLOYEES where COMMISSION_PCT is not NULL;

    -- 서브쿼리 실행시 반환되는 컬럼이 2개 이상 존재 가능
    select LAST_NAME 이름, DEPARTMENT_ID 부서번호, SALARY 연봉 from EMPLOYEES
    where (DEPARTMENT_ID, SALARY) in (
                                    select distinct DEPARTMENT_ID, SALARY from EMPLOYEES
                                    where COMMISSION_PCT is not null);

select LAST_NAME 이름, DEPARTMENT_ID 부서번호, SALARY 연봉 from EMPLOYEES
where DEPARTMENT_ID in (select distinct DEPARTMENT_ID from EMPLOYEES
                            where COMMISSION_PCT is not NULL)
and SALARY in (select distinct SALARY from EMPLOYEES
                    where COMMISSION_PCT is not NULL);
--
-- 57. 위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME,
-- 부서 번호 및 연봉을 조회한다.
-- NVL(컬럼명, null일 때 대체값) : NULL을 적절한 값을 변환하는 함수
select DEPARTMENT_ID from DEPARTMENTS where LOCATION_ID = 1700;


select LAST_NAME 이름, DEPARTMENT_ID 부서번호, SALARY 연봉 from EMPLOYEES
where DEPARTMENT_ID in (select DEPARTMENT_ID from DEPARTMENTS where LOCATION_ID = 1700);

    -------------------------- 선생님 풀이 ---------------------
    select SALARY, NVL(COMMISSION_PCT, 0) from EMPLOYEES e join DEPARTMENTS d
    using (DEPARTMENT_ID) where LOCATION_ID = 1700 order by SALARY;

    select LAST_NAME 이름, SALARY 연봉, DEPARTMENT_ID 부서번호 from EMPLOYEES
    where (SALARY, NVL(COMMISSION_PCT, 0)) in
          (select SALARY, NVL(COMMISSION_PCT, 0) from EMPLOYEES e
            join DEPARTMENTS d using (DEPARTMENT_ID)
            where LOCATION_ID= 1700)
    and DEPARTMENT_ID not in (                 -- 위치 ID 가 1700 인 사원들 제외
            select DEPARTMENT_ID from DEPARTMENTS
            where LOCATION_ID = 1700)
    order by SALARY;
--


-- 58. LAST_NAME 이 'Kochhar' 인 사원과 동일한 연봉 및 커미션을 버는 사원들의
-- LAST_NAME, 부서 번호 및 연봉을 조회한다.
select LAST_NAME 이름, DEPARTMENT_ID 부서번호, SALARY 연봉 from EMPLOYEES
where SALARY = (select SALARY from EMPLOYEES where LAST_NAME = 'Kochhar')
and COMMISSION_PCT = (select COMMISSION_PCT from EMPLOYEES where LAST_NAME = 'Kochhar');

select LAST_NAME 이름, DEPARTMENT_ID 부서번호, SALARY 연봉 from EMPLOYEES
where (SALARY, NVL(COMMISSION_PCT,0))
in (select SALARY, NVL(COMMISSION_PCT,0) from EMPLOYEES where LAST_NAME = 'Kochhar')
and LAST_NAME <> 'Kochhar';
