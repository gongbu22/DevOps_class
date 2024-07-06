-- 함수

-- 사원 테이블에서 사원 이름을 소문자로 출력하세요
select FIRST_NAME, lower(FIRST_NAME)
from EMPLOYEES;

-- 사원 테이블에서 사원 이름의 첫글자만 대문자로 출력하세요.
select FIRST_NAME,
       concat(upper(substr(FIRST_NAME,0,1)),lower(substr(FIRST_NAME,1)))
from EMPLOYEES;

    --------선생님 풀이 ------------
    -- 첫글자만 대문자
    select initcap(FIRST_NAME) FIRST_NAME
    from EMPLOYEES;

-- 사원 테이블에서 사원 이름의 길이를 출력하세요.
select FIRST_NAME,
       length(FIRST_NAME) length,
       lengthb(FIRST_NAME) bytelength
from EMPLOYEES;
    ---바이트 길이도 보기 ----
    select NAME,
           length(NAME) length,
           lengthb(NAME) bytelength
    from CUSTOMERS;

-- 사원 테이블에서 사원이름과 이름에 A가 몇번째 있는지 출력하세요.
select FIRST_NAME,
       instr(FIRST_NAME, 'A'),
       instr(FIRST_NAME, 'a'),
       instr(upper(FIRST_NAME), 'A'),
       instr(lower(FIRST_NAME), 'a'),
       instr(lower(FIRST_NAME), lower('A'))
from EMPLOYEES
order by LAST_NAME;


-- 사원 테이블에서 사원이름의 세번째 자리가 R인 사원의 정보를
-- 출력하세요.
------------- 대문자로 다 바꿔서 하기 ---------------
select FIRST_NAME
from EMPLOYEES
where instr(upper(FIRST_NAME), 'R')=3;

select FIRST_NAME, instr(FIRST_NAME, 'R') from EMPLOYEES;

select FIRST_NAME
from EMPLOYEES
where upper(FIRST_NAME) like '__R%';


-- (Clients, Books, Spells)
-- 도서제목에 야구가 포함된 도서를
-- 농구로 변경한 후 도서 목록을 보이시오.
select BOOKNAME,
       replace(BOOKNAME, '야구', '농구')
from BOOKS
where instr(BOOKNAME, '야구') > 0;

-- 굿스포츠에서 출판한 도서의 제목과
-- 제목의 글자 수를 확인하시오.
select BOOKNAME 제목,
       length(BOOKNAME) 제목글자수,
       PUBLISHER 출판사
from BOOKS
where PUBLISHER = '굿스포츠';

-- 고객 중에서 같은 성(姓)을 가진 사람이
-- 몇 명이나 되는지 성별 인원수를 구하시오.
select substr(NAME,1, 1) 성,
       count(substr(NAME,1, 1)) 인원수
from CLIENTS
group by substr(NAME, 1,1);

select name from CLIENTS;

------------------------
-- 마당서점은 주문일로부터 10일 후 매출을
-- 확정한다. 각 주문의 확정일자를 구하시오
select
    ORDERDATE 주문일자,
    ORDERDATE + 10 확정일자
from SPELLS;

-- 입사한 사원은 3개월후에 정직원으로 채용된다
-- 사원 이름, 입사일, 정식채용일을 조회하세요

    -----------선생님 풀이------------
    select FIRST_NAME,
           HIRE_DATE 입사일,
           HIRE_DATE + 90 정식채용일
    from EMPLOYEES;

    -- 데이터타입이 DATE가 아닐때
    select FIRST_NAME,
           HIRE_DATE 입사일,
           to_date(HIRE_DATE, 'YYYY-MM-DD') + 90 정식채용일
    from EMPLOYEES;


-- 2024년 7월 7일에 주문받은 도서의
-- 주문번호, 주문일, 고객번호, 도서번호를
-- 모두 보이시오.
-- 단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 출력
select OID 주문번호,
       to_date(ORDERDATE, 'yyyy-mm-dd') 주문일,
       CID 고객번호,
       BOOKID 도서번호
from SPELLS where ORDERDATE = '2024-07-07';


-- DBMS 서버에 설정된 현재 시간과
-- 오늘 날짜를 확인하시오.
select sysdate from dual;

-- 오늘을 기준으로 주문 날짜 사이의
-- 일수, 개월수, 년수를 조회하세요
select ORDERDATE,
       floor(sysdate - ORDERDATE) 일수,
       floor(months_between(sysdate, ORDERDATE)) 개월수,
        to_date(sysdate, 'YYYY')
from SPELLS;

-- 마당서점은 주문일로부터 3개월 후 결제를
-- 확정한다. 각 주문의 결제일자를 구하시오
select ORDERDATE,
       add_months(ORDERDATE, 3)
from SPELLS;

-- 마당서점은 주문일로부터 일주일 후 재고보충을
-- 확정한다. 각 주문의 재고보충일자를 구하시오
select ORDERDATE,
       ORDERDATE +7
from SPELLS;

-- 현재일의 요일을 기준으로 다음주 요일은
-- 몇일 인가 조회하세요
select next_day(sysdate, '목') from dual;

-- 마당서점은 각 주문일기준 월말에 재고보충을
-- 확정한다. 각 주문의 재고보충일자를 구하시오
select ORDERDATE, last_day(ORDERDATE)
from SPELLS;

----

-- 함수

-- (hr)

-- 사원 테이블에서 이름의 끝자리가
-- N으로 끝나는 사원의 정보를 출력하세요.
select FIRST_NAME
from EMPLOYEES
where instr(upper(FIRST_NAME), 'N', -1) = length(FIRST_NAME);

-- 사원들의 급여가 평균보다 큰 경우
-- '평균급여이상'이라 출력하고
-- 아닌 경우 '평균급여이하' 라고 출력하세요


-- 사원의 급여에 대해 평균을 계산하고
-- 정수로 변환해서 출력하세요
select round(avg(SALARY)) 평균
from EMPLOYEES;

-- 사원들을 입사일자가 빠른 순으로
-- 정렬한 뒤 본인보다 입사일자가 빠른
-- 사원의 급여를 본인의 급여와 함께
-- 출력하세요


-- AND나 BETWEEN을 사용하지 않고
-- 2002 년도에 입사한 직원의 이름과
-- 월급을 출력하세요.
select FIRST_NAME, SALARY, HIRE_DATE from EMPLOYEES
where extract(year from HIRE_DATE) = '2002'


-- 사원 테이블에서 사원의 이름이
-- 5글자인 사원의 이름을
-- 첫글자만 대문자로 출력하세요.
select initcap(FIRST_NAME) from EMPLOYEES
where length(FIRST_NAME) = 5;


-- 사원 테이블에서 이름과 입사일자
-- 그리고 현재날까지의 경과일을 산출하세요
-- (소숫점을 빼버리고 해당이름을 경과일로 바꾸세요)
select FIRST_NAME,
       HIRE_DATE,
       round(sysdate-HIRE_DATE) 경과일
from EMPLOYEES;


-- 이전문제에서 경과일을 개월수로 바꿔서
-- 산출하세요. 소숫점을 빼버리고
-- 해당이름을 경과개월수로 바꾸세요
select FIRST_NAME,
       HIRE_DATE,
       ceil(months_between(sysdate, HIRE_DATE)) 경과개월수
from EMPLOYEES
order by HIRE_DATE;


-- 사원 테이블에서 입사후 6개월이
-- 지난날짜 바로 다음 일요일을 구하세요.
select HIRE_DATE,
       add_months(HIRE_DATE, 6),
       next_day(add_months(HIRE_DATE, 6), '일')
from EMPLOYEES
order by HIRE_DATE desc;

-- 교육시작일이 2020-11-02인 경우,
-- 5개월(18주)이 지난후 돌아오는 첫번째 금요일이
-- 언제인지 조회하세요 (5개월(18주) : 2021-03-08)


-- 교육시작일이 2020-11-02인 경우,
-- 131일이 지난후 돌아오는 첫번째 금요일이
-- 언제인지 조회하세요 (131일후 : 2021-03-11)


-- 사원 테이블에서 입사후
-- 첫 휴일(일요일)은 언제일지 구하세요
select HIRE_DATE,
       next_day(HIRE_DATE, '일')
from EMPLOYEES
order by HIRE_DATE desc;


-- steven 사원의 입사일 기준 다음 첫 휴일
-- steven 사원의 입사일이 같은 사원들 역시 동일시 식 적용
-- 그외 다른 사원들은 동일식 적용시 잘못된 결과 출력
select next_day(HIRE_DATE, '토')
from EMPLOYEES
where lower(FIRST_NAME) = 'steven';

select next_day(HIRE_DATE, '토'), FIRST_NAME
from EMPLOYEES
where HIRE_DATE in (select HIRE_DATE
from EMPLOYEES
where lower(FIRST_NAME) = 'steven');


-- 오늘날짜를 "xx년 xx월 xx일"
-- 형식으로 출력하세요
select sysdate,
       concat(substr(to_char(sysdate, 'YYYY-MM-DD'), 3, 2),'년',' ',
              substr(to_char(sysdate, 'YYYY-MM-DD'), 6, 2),'월',' ',
              substr(to_char(sysdate, 'YYYY-MM-DD'), 9, 2),'일') 날짜
from dual;

select concat(substr(extract(year from sysdate), 3,2),'년',' ',
              extract(month from sysdate),'월',' ',
              extract(day from sysdate),'일') 날짜
from dual;


-- 지금 현재 '몇시 몇분'인지 출력하세요.
select sysdate,
        concat(substr(to_char(sysdate, 'HH24:MI:SS'), 1, 2),'시',' ',
               substr(to_char(sysdate, 'HH24:MI:SS'), 4, 2),'분') 시간
from dual;

-- 이번 년도 12월 31일까지 몇일이
-- 남았는지 출력하세요.


-- 사원들의 입사일에서
-- 입사 년도와 입사 달을 조회하세요
select HIRE_DATE,
    extract(year from HIRE_DATE) 입사년도,
    extract(month from HIRE_DATE) 입사달
from EMPLOYEES;

select HIRE_DATE,
       substr(to_char(HIRE_DATE, 'YYYY-MM-DD'), 1, 4) 입사년도,
       substr(to_char(HIRE_DATE, 'YYYY-MM-DD'), 6, 2) 입사달
from EMPLOYEES;



-- 9월에 입사한 사원을 조회하세요
select EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
from EMPLOYEES
where substr(to_char(HIRE_DATE, 'YYYY-MM-DD'), 6,2) =09;

select EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
from EMPLOYEES
where extract(month from HIRE_DATE) = 09;

-- 사원들의 입사일을 출력하되,
-- 요일까지 함께 조회하세요


-- 사원들의 급여를 통화 기호를 앞에 붙이고
-- 천 단위마다 콤마를 붙여서 조회하세요
-- format(값, 반올림자릿수) : 숫자에 컴마를 붙여 출력
select to_char(SALARY, 'L99,999')
from EMPLOYEES;


-- 사원들의 급여를 10자리로 출력하되
-- 자릿수가 남는 경우 빈칸으로
-- 채워서 조회하세요
select SALARY, to_char(SALARY, '9999999999')
from EMPLOYEES;


-- 각 사원들의 근무한 개월 수를 현재를
-- 기준으로 구하세요


-- 각 사원들의 입사일에서
-- 4개월을 추가한 날짜를 조회하세요
select HIRE_DATE, add_months(HIRE_DATE, 4)
from EMPLOYEES
order by HIRE_DATE desc;


-- 각 사원들의 입사한 달의 마지막 날을
-- 조회하세요
select HIRE_DATE,
       last_day(HIRE_DATE)
from EMPLOYEES
order by HIRE_DATE desc;
