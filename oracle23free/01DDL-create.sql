-- 고객 테이블
create table Customers (
    cid     char(18),
    name    char(10)  not null,
    age     int     not null,
    grade   varchar(6)  default 'silver',
    job     varchar(20)  not null,
    mileage int     default 0,
    primary key (cid)
);

-- 제품 테이블
create table Products (
    pid     char(3),
    pname   char(18),
    stock   int,
    price   int,
    maker   varchar(10),
    primary key (pid)
);

--주문 테이블
create table Orders (
    oid     char(3),
    cid     char(18),
    pid     char(3),
    qty     int,
    addr    varchar(20),
    odate   date,
    primary key(oid)
);

-- 한글 1byte는 영문 2byte
-- 오라클은 3byte
select length('abc123'), lengthb('abc123') from dual;

--테이블 삭제 : drop table
drop table Customers;
drop table Products;
drop table Orders;

-- 고객 테이블
create table Customers (
       cid     varchar(3),
       name    varchar(15)  not null,
       age     int     not null,
       grade   varchar(6)  default 'silver',
       job     varchar(20)  not null,
       mileage int     default 0,
       primary key (cid)
);

-- 제품 테이블
create table Products (
      pid     varchar(3),
      pname   varchar(15),
      stock   int,
      price   int,
      maker   varchar(12),
      primary key (pid)
);

-- 주문 테이블
create table Orders (
    oid     varchar(3),
    cid     varchar(3),
    pid     varchar(3),
    qty     int,
    addr    varchar(25),
    odate   date,
    primary key(oid),
    foreign key (cid) references Customers(cid),
    foreign key (pid) references Products(pid)
);

drop table Customers;

create table Customers (
       cid     varchar(18),
       name    varchar(15)  not null,
       age     int     not null,
       grade   varchar(6)  default 'silver',
       job     varchar(20)  not null,
       mileage int     default 0,
       primary key (cid)
);

---

create table Books (
    bookid      varchar(3),
    bookname    varchar(25) not null,
    publisher   varchar(15) not null,
    price       int,
    primary key (bookid)
);

create table clients (
    cid     varchar(3),
    name    varchar(15)    not null,
    addr    varchar(25) not null,
    phone   varchar(13),
    primary key (cid)
);

create table spells (
    oid         varchar(3),
    cid         varchar(3),
    bookid      varchar(3),
    saleprice   int,
    orderdate   date,
    primary key (oid),
    foreign key (cid) references clients(cid),
    foreign key (bookid) references Books(bookid)
);

-------

create table Students (
    hakbun      int,
    name        char(15)    not null,
    addr        varchar(25) not null,
    birth       char(10)    not null,
    deptname    char(15)    not null,
    prof        char(3)     not null,
    primary key (hakbun)
);

create table depts (
    deptname    char(15),
    phone       char(15)    not null,
    deptpos     varchar(10) not null,
    chief       char(3)     not null,
    primary key (deptname)
);

create table Subjects (
    sid         char(4),
    subjname    char(20)        not null,
    subjdesc    varchar(35)     not null,
    prof        char(3)         not null,
    primary key (sid)
);

create table Professors (
    pid     char(3),
    name    char(10)    not null,
    field   varchar(15) not null,
    primary key (pid)
);

------------------------
select * from Products;
select * from CUSTOMERS;
