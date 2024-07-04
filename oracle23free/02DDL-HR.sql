create table Employees (
    employee_id     int         not null,
    first_name      varchar(25)  not null,
    last_name       varchar(25)  not null,
    email           varchar(50) not null,
    phone_number    char(20)    not null,
    hire_date       date,
    job_id          varchar(15) not null,
    salary          decimal(6,2) default 0,
    commission_pct  decimal(4,2),
    manager_id      int         not null,
    department_id   int         not null,
    primary key (employee_id)
);

drop table Employees;

create table Departments (
    department_id       int,
    department_name     varchar(30)  not null,
    manager_id          int,
    location_id         int,
    primary key (department_id)
);

drop table Departments;

create table Job_history (
    employee_id     int ,
    start_date      date,
    end_date        date,
    job_id          varchar(15),
    department_id   int,
    primary key(employee_id, start_date)
);

drop table Job_history;

create table Jobs (
    job_id      varchar(15),
    job_title   varchar(30) not null,
    min_salary  decimal(6,2),
    max_salary  decimal(6,2),
    primary key(job_id)
);

drop table Jobs;

create table Locations (
    location_id     int         not null,
    street_address  varchar(50) not null,
    postal_code     varchar(12),
    city            varchar(25) not null,
    state_province  varchar(25),
    country_id      int,
    primary key (location_id)
);

drop table Locations;



create table Countries (
    country_id      int,
    country_name    varchar(60) not null,
    region_id       int,
    primary key (country_id)
);

drop table Countries;

create table Regions (
    region_id   int,
    region_name varchar(10) not null,
    primary key (region_id)
);

drop table Regions;

--------------

create table Customers2 (
    customer_id         int         not null,
    cust_first_name     varchar(6)  not null,
    cust_last_name      varchar(3)  not null,
    cust_address        varchar(20) not null,
    phone_numbers       char(15)    not null,
    nls_language        varchar(10),
    nls_lerritory       varchar(10),
    credit_limit        int         default 0,
    cust_email          varchar(30) not null,
    account_mgr_id      int         not null,
    cust_geo_location   varchar(10),
    date_of_birth       date,
    marital_status      varchar(1)  not null,
    gender              varchar(3)  not null,
    income_level        varchar(9)  not null,
    primary key(customer_id)
);

drop table Customers2;

create table Warehouses (
    warehouse_id    int         not null,
    warehouse_spec  varchar(20),
    warehouse_name  varchar(20) not null,
    location_id     int         not null,
    wh_geo_location varchar(10),
    primary key (warehouse_id)
);

drop table WAREHOUSES;

create table Orders2 (
    order_id        int         not null,
    order_date      date,
    order_mode      varchar(10),
    customer_id     int         not null,
    order_status    varchar(3)  not null,
    order_total     int         default 0,
    sales_rep_id    int         not null,
    promotion_id    int         not null,
    primary key (order_id)
);

drop table Orders2;

create table Product_descriptions (
    product_id              int         not null,
    language_id             int         not null,
    translated_name         varchar(20) not null,
    translated_description  varchar(20) not null
);

drop table Product_descriptions;

create table Inventories (
    product_id          int     not null,
    warehouse_id        int     not null,
    quantity_on_hand    varchar(10)
);

drop table Inventories;

create table Order_items (
    order_id        int     not null,
    line_item_id    int     not null,
    product_id      int     not null,
    unit_price      int     default 0,
    quantity        int     default 0
);

drop table Order_items;

create table Product_information (
    product_id          int             not null,
    product_name        varchar(10)     not null,
    product_description varchar(30)     not null,
    category_id         int             not null,
    weight_class        varchar(10)     not null,
    warranty_period     varchar(10)     not null,
    supplier_id         int             not null,
    product_status      varchar(10)     not null,
    list_price          int             default 0,
    min_price           int             default 0,
    catalog_url         varchar(30),
    primary key (product_id)
);

drop table PRODUCT_INFORMATION;