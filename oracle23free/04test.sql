-- 회원
CREATE TABLE  Members2 (
    mid         varchar(50)     constraint mid_nn not null,
    mpassword   varchar(50)     constraint mpw_nn not null,
    mname       varchar(10)     constraint mname_nn not null,
    mage        int,
    mjob        varchar(20),
    mgrade      varchar(10),
    mmoney      int
);

-- 제조업체
create table Companies2 (
    cname   varchar(50)     constraint cname_nn not null,
    cphone  varchar(15),
    clocation   varchar(50),
    cmanager    varchar(15)
);

-- 상품
create table Products2 (
    pnumber     varchar(50)     constraint pnum_nn not null,
    pname       varchar(50)     constraint pname_nn not null,
    pquantity   int,
    pprice      int,
    cname       varchar(50)     constraint p_cname_nn not null,
    psupplydate date            constraint psupplydate_nn not null,
    psupplies   varchar(50)
);

-- 게시글
create table Boards2 (
    bnumber     varchar(50)     constraint bnum_nn not null,
    btitle      varchar(50)     constraint btitle_nn not null,
    bcontent    varchar(100),
    bdate       date,
    mid         varchar(50)     constraint b_mid_nn not null
);

-- 주문
create table Orders2 (
    mid         varchar(50)     constraint o_mid_nn not null,
    pnumber     varchar(50)     constraint o_pnum_nn not null,
    onumber     varchar(50)     constraint onum_nn not null,
    oquantity   int,
    olocation   varchar(50),
    odate       date
);

-- 기본키 제약조건
alter table MEMBERS2 add constraint mem_pk primary key (mid);
alter table PRODUCTS2 add constraint pro_pk primary key (pnumber);
alter table COMPANIES2 add constraint com_pk primary key(cname);
alter table Boards2 add constraint brd_pk primary key(bnumber);
alter table Orders2 add constraint ord_pk primary key(mid, pnumber);

-- 외래키 제약조건
alter table PRODUCTS2 add constraint pro_fk foreign key(cname) references COMPANIES2(cname);
alter table Boards2 add constraint brd_fk foreign key(mid) references MEMBERS2(mid);
alter table Orders2 add constraint ord_mid_fk foreign key(mid) references MEMBERS2(mid);
alter table Orders2 add constraint ord_pnum_fk foreign key(pnumber) references PRODUCTS2(pnumber);

-- default 값
alter table MEMBERS2 modify (mgrade default 'sliver');
alter table MEMBERS2 modify (mmoney default 0);

select constraint_name, constraint_type, search_condition from ALL_CONSTRAINTS where table_name='ORDERS2';

