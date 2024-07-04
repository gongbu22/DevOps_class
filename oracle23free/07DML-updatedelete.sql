-- 12 수정
-- update문은 테이블의 레코드를 수정하는데 사용
-- where절을 생략하면 테이블의 모든 행이 수정됨 (주의!!)
-- where절을 사용해서 모든 행이 수정되는 것을 방지할 것을 당부!
-- 또한, 수동 commit 모드로 sql 쿼리를 실행할 것을 권장!
-- => 만일, 쿼리를 잘못 실행한 경우, 복구가 가능하기 때문
-- update 테이블명
-- set 속성명 = 수정할값, ...
-- where 조건절

-- 제품번호가 p03인 제품의 이름을 '통큰파이'로 변경
update PRODUCTS
set PNAME = '통큰파이'
where PID = 'p03';

select * from PRODUCTS
where pid='p03';

rollback;

-- 제품테이블의 모든 제품의 단가를 10% 인상하고 확인
select PNAME, PRICE, PRICE*1.1 from PRODUCTS;

update PRODUCTS set PRICE = PRICE*1.1;

-- 판매테이블에서 정소화 고객이 주문한 제품의 수량을 5개로 수정하고 확인
select * from CUSTOMERS;
select * from ORDERS;
select CID from CUSTOMERS where NAME = '정소화';

update ORDERS
set QTY =5
where CID = (
        select CID from CUSTOMERS
        where NAME = '정소화'
                          );

rollback;

-- 13 삭제
-- delete문은 테이블의 레코드를 삭제하는데 사용
-- where절을 생략하면 테이블의 모든 행이 삭제됨 (주의!!)
-- where절을 사용해서 모든 행이 삭제되는 것을 방지할 것을 당부!
-- 또한, 수동 commit 모드로 sql 쿼리를 실행할 것을 권장!
-- => 만일, 쿼리를 잘못 실행한 경우, 복구가 가능하기 때문
-- delete from 테이블명
-- where 조건절

-- 주문테이블에서 주문일자가 2022-05-22인 주문내역을 삭제하고 확인
select * from ORDERS;

delete from ORDERS where ODATE = '2022-05-22';

-- 주문테이블에서 정소화 고객이 주문한 내역을 삭제하고 확인
delete from ORDERS where CID = (select cid from CUSTOMERS
                                    where NAME = '정소화');

select * from ORDERS where CID = (select cid from CUSTOMERS
    where NAME = '정소화');

-- 주문테이블의 모든 주문내역을 삭제하고 확인
delete from ORDERS;

select * from ORDERS;

rollback;