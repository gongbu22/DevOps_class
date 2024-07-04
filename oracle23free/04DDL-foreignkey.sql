-- 생성순서 : regions - countries - locations - departments
--          jobs - employees - job_history

create table Regions (
     region_id   varchar(50),
     region_name varchar(50) constraint rgname_nn not null
);

delete from REGIONS;

create table Countries (
       country_id      varchar(50),
       country_name    varchar(50) constraint ctrname_nn not null,
       region_id       varchar(50)
);

create table Locations (
       location_id     varchar(50)          constraint lid_nn not null,
       street_address  varchar(50) constraint laddr_nn not null,
       postal_code     varchar(50),
       city            varchar(50) constraint lcity_nn not null,
       state_province  varchar(50),
       country_id      varchar(50)
);

delete from LOCATIONS;

create table Departments (
     department_id       varchar(50),
     department_name     varchar(50) constraint departname_nn not null,
     manager_id          varchar(50),
     location_id         varchar(50)
);

create table Jobs (
      job_id      varchar(50),
      job_title   varchar(50) constraint jtitle_nn not null,
      min_salary  decimal(6,2),
      max_salary  decimal(6,2)
);

create table Employees (
       employee_id     varchar(50)      constraint eid_nn  not null,
       first_name      varchar(50) constraint fname_nn  not null,
       last_name       varchar(50) constraint lname_nn not null,
       email           varchar(50) constraint email_nn not null,
       phone_number    char(20)  constraint phone_nn  not null,
       hire_date       date,
       job_id          varchar(50) constraint jid_nn not null,
       salary          decimal(6,2) default 0,
       commission_pct  decimal(4,2),
       manager_id      varchar(50),
       department_id   varchar(50)
);

create table Job_history (
     employee_id     varchar(50)  constraint jh_eid_nn not null,
     start_date      date,
     end_date        date,
     job_id          varchar(50) constraint jh_jid_nn not null,
     department_id   varchar(50)
);

--------기본키 제약조건 추가
alter table REGIONS
    add constraint rgn_pk primary key (region_id);

alter table COUNTRIES
    add constraint cnty_pk primary key (country_id);

alter table Locations
    add constraint loc_pk primary key (location_id);

alter table Departments
    add constraint dept_pk primary key (department_id);

alter table Employees
    add constraint emp_pk primary key (employee_id);

alter table Jobs
    add constraint jb_pk primary key (job_id);

alter table Job_history
    add constraint jbh_pk primary key (employee_id, start_date);

------- 외래키 제약조건 추가
alter table COUNTRIES
    add constraint cnty_fk
    foreign key (region_id) references regions (region_id);

alter table Locations
    add constraint loc_fk
        foreign key (country_id) references Countries (country_id);

alter table Departments
    add constraint dept_fk
        foreign key (location_id) references Locations (location_id);

alter table Employees
    add constraint emp_manager_fk
        foreign key (manager_id) references Employees (employee_id);

alter table Employees
    add constraint emp_dept_fk
        foreign key (department_id) references Departments (department_id);

alter table Employees
    add constraint emp_jb_fk
        foreign key (job_id) references Jobs (job_id);

alter table Job_history
    add constraint jbh_jb_fk
        foreign key (job_id) references Jobs (job_id);

alter table Job_history
    add constraint jbh_dept_fk
        foreign key (department_id) references Departments (department_id);

------- 제약조건 조회
select * from ALL_CONSTRAINTS
where table_name = 'EMPLOYEES';

SELECT constraint_name, constraint_type, search_condition
from ALL_CONSTRAINTS
where table_name = 'DEPARTMENTS';

SELECT constraint_name, constraint_type, search_condition
from ALL_CONSTRAINTS
where table_name = 'COUNTRIES';

SELECT constraint_name, constraint_type, search_condition
from ALL_CONSTRAINTS
where table_name = 'LOCATIONS';

----제약조건 삭제
alter table Locations drop constraint loc_fk;

------삭제 --- 테이블생성 역순으로
drop table JOB_HISTORY;
drop table EMPLOYEES;
drop table JOBS;
drop table DEPARTMENTS;
drop table LOCATIONS;
drop table COUNTRIES;
drop table REGIONS;


---------
create table a (
    a int
);

alter table a add (b char(5));
alter table a modify (b varchar(10) not null);
alter table a rename column b to c;
alter table a drop column c;

select * from a;

-----------------------
drop table A;



