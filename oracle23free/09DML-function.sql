-- 14 함수
-- 데이터베이스에서 데이터를 처리하고 조작하는데 사용되는
-- 미리 정의/작성된 특수한 명령어를 의미
-- 즉, 특정 값이나 열들을 입력하면 그것을 계산/처리하고
-- 결과를 출력하는 특수한 명령어 ex) sum(), avg()
-- 쿼리의 효율성과 유연성, 편의성을 높여줌
-- 내장함수(벤더에서 제공), 사용자 정의 함수(개발자가 직접 만듦)
-- 단일행 함수(각 행에 개별적으로 작동 - 결과는 하나로 출력)
-- 다중행 함수(여러 행을 입력받음 - 결과는 하나로 출력)

--문자열 함수
-- LOWER(), UPPER(): 문자열을 소문자 또는 대문자로 변환
-- LENGTH(): 문자열의 길이를 반환
-- SUBSTR(): 문자열의 일부를 추출
-- CONCAT(): 두 문자열을 연결
-- TRIM(): 문자열의 앞뒤 공백을 제거
-- REPLACE(): 문자열에서 틀정 문자열을 다른 문자열로 대체
-- INSTR(): 문자열에서 틀정 문자열이 처음올 나타나는 위치를 나타냄
-- ASCII(): 문자의 ASCII 코드값을 반환
-- CHR() : ASCII 코드에 해당하는 문자 반환
-- INITCAP() : 문자열의 첫 글자를 대문자로 변환

-- 단일행 함수 : 한 컬럼의 값 => 하나의 값
-- 다중행 함수 : 여러 컬럼의 값 => 하나의 값

-- 사원 이름을 소문자로 출력
select FIRST_NAME, lower(FIRST_NAME) 소문자
from EMPLOYEES;

-- 사원 이름을 대문자로 출력
select FIRST_NAME, upper(FIRST_NAME) 소문자
from EMPLOYEES;

-- 사원 이름의 문자길이 출력
select FIRST_NAME, length(FIRST_NAME) 문자길이
from EMPLOYEES;

-- 주민번호에서 생일만 추출해서 출력
-- ex) 123456-1234567
-- substr(대상, 시작위치, 길이)
-- 시작위치는 1부터 시작!

select '123456-1234567',
       substr('123456-1234567', 0, 6) 생년월일
from dual;

-- 주민번호에서 성별코드만 추출해서 출력
select '123456-1234567',
       substr('123456-1234567', 8, 1) 성별코드
from dual;

-- 사원의 이름과 성을 붙여서 출력
-- concat(합칠문자1, 합칠문자2)
-- '합칠문자1 || 합칠문자2' 로도 사용 가능

select FIRST_NAME,
       LAST_NAME,
       concat(FIRST_NAME, ' ', LAST_NAME) 사원이름 -- 중간에 ' ' 공백 넣는거 원래는 안됨
from EMPLOYEES;

select FIRST_NAME || ' ' || LAST_NAME 사원이름 -- 중간에 ' ' 공백 넣는거 원래는 안됨
from EMPLOYEES;

-- ' abc123 ' 라는 문자열의 공백을 제거하고 출력
-- trim(문자열), ltrim(문자열), rtrim(문자열)
select ' abc123 ',
       trim(' abc123 '),
       ltrim(' abc123 '),
       rtrim(' abc123 ')
from dual;

-- hello, world!! 문자열에서
-- world라는 문자열을 oracle로 변경 후 출력
-- replace(대상, 찾을문자, 바꿀문자)
select 'hello, world!!',
       replace('hello, world!!', 'world!!', 'oracle :)'),
       replace('hello, world!!', 'world!!')  -- world 글자가 지워짐
from dual;

-- 'CORPORATE FLOOR' 라는 문자열에서
-- 3번째에서 시작해서 2번째 OR이 나타나는
-- 자리수(위치)를 출력
-- instr(대상, 찾을문자열, 찾을위치, 빈도위치)
-- 찾을 위치를 -n으로 지정하면 문자열 끝을 기준으로 찾음
-- 문자열 위치는 1부터 시작!!
select 'CORPORATE FLOOR',
        instr('CORPORATE FLOOR', 'OR'), -- 왼쪽 두번째부터 OR이 시작됨
        instr('CORPORATE FLOOR', 'OR', -1),      -- 오른쪽부터 OR이 시작되는 위치
       instr('CORPORATE FLOOR', 'OR', 3),
       instr('CORPORATE FLOOR', 'OR', 3, 2)     -- 왼쪽에서 3번째부터 2번째 OR을 찾고싶다
from dual;

-- 문자/코드 변환함수
-- 문자를 아스키코드로 변환하거나
-- 아스키코드를 문자로 변환
-- ASCII : 컴퓨터와 통신장비간 텍스트를 표현하기 위해 사용하는 코드
--         미국 문자 인코딩 표준체계
--         제어문자와 출력가능한 문자(숫자,영소대문자)로 구성
-- 기타 문자 인코딩 체계
-- 완성형/조합형/확장완성형KSC5601/EUC-KR/유니코드
select chr(65), chr(97) from dual;

select ascii('A'), ascii('a') from dual;

-- 날짜/시간 함수
-- 변환함수
-- 입력하려는 데이터의 자료형과
-- 저장될 컬럼의 자료형이 일치하지 않는 경우
-- 형변환을 통해 제대로 입력할 수 있음

-- 숫자 -> 문자 : 성공! ()
-- 문자 -> 숫자 : 실패!
-- 문자 -> 날짜 : 장담못함! (지역적 특성 고려)

-- 문자변환 (to_char)
-- 날짜형 데이터를 문자로 변환
select
    to_char(sysdate, 'YYYY-MM-DD') 오늘날짜,
    to_char(sysdate, 'HH:MI:SS AM') 오늘시간1,
    to_char(sysdate, 'HH24:MI:SS') 오늘시간2,
    to_char(sysdate, 'MM/DD/YYYY') "미국식날짜(월일년)"
from dual;

-- 숫자형 데이터를 문자로 변환
-- 숫자가 문자형함수의 매개변수로 사용되면
-- 자동으로 문자로 형변환됨!
select 1234,
       to_char(1234) 명시적형변환,
       substr(123456, 4, 1) 암시적형변환
from dual;

-- 당연히 숫자는 문자로 변환
select 1234 || 5678
from dual;

-- 문자는 산술연산자나 숫자형 함수와 결합되면
-- 자동으로 숫자로 변환됨
select 1234 + 5678,
       '1234' + '5678',
        sqrt('9')       -- 제곱근 : 3
from dual;

--숫자를 문자로 변환시 형식format문자를 사용할 수 있음
-- 9 : 숫자 하나 의미, 공백일시 빈칸으로 채움
-- 0 : 숫자 하나 의미, 공백일시 0으로 채움
-- L : 통화기호를 로케일 설정에 따름
select 123456789.1234,
       to_char(123456789.1234, '999'),  -- 자리수가 모자를 경우 : #####
       to_char(123456789.1234, '999999999'),
       to_char(123456789.1234, '999999999.99'),
       to_char(123456789.1234, '$999999999'),
       to_char(123456789.1234, 'L999999999'),  -- L을 쓰면 나라에 맞는 통화기호가 나옴
        to_char(12345, '999999999'),
       to_char(12345, '000000000'),
       to_char(12345, '00.000')
from dual;

-- 날짜 변환
-- 문자를 날짜로 바꾸려면 to_date함수 사용
-- 단, 날짜 형식으로 변환시 NLS date format에 정의된 형식 참고

select * from NLS_DATABASE_PARAMETERS
where PARAMETER = 'NLS_DATE_FORMAT';

select userenv('NLS_DATE_FORMAT') from dual;  -- 에러남

select
    to_date('2024-07-04'),
    to_date('2027-07-04 04:05:35', 'YYYY-MM-DD HH:MI:SS'),
    to_date('04:05:35', 'HH:MI:SS')
from dual;

-- 세션 접속시 NLS_DATE_FORMAT 변경방법 (일시적)
alter session
set NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

-- 기타 날짜함수
-- add_month(기준일, 개월수)
-- last_day
-- months_between(날짜1, 날짜2)
-- next_day(날짜, 찾을요일)

select sysdate,
       add_months(sysdate, 6) "6개월 후",
       last_day(sysdate) 이번달의마지막날
from dual;

select months_between('2024-11-15', '2024-5-20') 교육기간,
        ceil(months_between('2024-11-15', '2024-5-20'))
from dual;

select sysdate 오늘,
--        next_day(sysdate, 'THU')다음주목요일,
       next_day(sysdate, '목')다음주목요일,
       next_day(sysdate, '목요일')다음주목요일,
        next_day(sysdate-8, '목') 저번주목요일
from dual;

-- 오라클 기본 테이블 : dual 테이블
-- 사용자가 함수의 실행결과를 확인할때
-- 지정하는 테이블
-- 주로 함수의 사용법을 익힐때 사용함

select round(123.456, 1) from BOOKS;

-- 함수는 대부분 단일행 함수임
-- 따라서 함수를 실행하면 결과는 단 하나만 출력
-- 그런데, from 절 다음에 임의의 테이블을 지정하면
-- 테이블의 행수 만큼 결과가 반복출력

-- 따라서, 오라클에서는 이러한 이유로
-- 산술연산만을 위한 테이블을 기본적으로 제공함
-- => dual 테이블 (dummy 컬럼만 존재)
-- => dummy 컬럼은 varchar2(1) 형식으로 정의
-- => 실제값은 X라는 문자하나만 저장

select * from dual;
select round(123.456, 1) from dual;