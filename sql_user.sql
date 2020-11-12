http://www.gurubee.net/oracle/sql
--system
CREATE USER SMC_USER IDENTIFIED BY SMC_USER;

--system
GRANT CREATE SESSION TO SMC_USER;
GRANT CREATE TABLE TO SMC_USER;

--SMC_USER
select 1 from dual;

--SMC_USER
CREATE TABLE A (A varchar2(10));
-- no privileges on tablespace 'SYSTEM'

--SMC_USER
CREATE TABLE A (A varchar2(10));
GRANT CREATE TABLE TO SMC_USER;
CREATE TABLESPACE smc
DATAFILE smc 
SIZE 2048M 
AUTOEXTEND ON 
NEXT 4M MAXSIZE UNLIMITED
LOGGING PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K 
SEGMENT SPACE MANAGEMENT MANUAL 
FLASHBACK ON;
--오류

--SMC_USER
CREATE TABLESPACE smc
DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\smc.DBF' 
SIZE 2048M 
AUTOEXTEND ON 
NEXT 4M MAXSIZE UNLIMITED
LOGGING PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K 
SEGMENT SPACE MANAGEMENT MANUAL 
FLASHBACK ON;
--오류

--system
ALTER USER SMC_USER
IDENTIFIED BY SMC_USER
DEFAULT TABLESPACE smc;

--SMC_USER
CREATE TABLE A (A varchar2(10));
--no privileges on tablespace 'SMC'

--system
ALTER USER SMC_USER
IDENTIFIED BY SMC_USER
DEFAULT TABLESPACE smc
quota unlimited on smc;

--SMC_USER
CREATE TABLE A (A varchar2(10));
--Table created.

INSERT INTO A(A) VALUES ('ABCTEST');

select * from A;
--table 검색

DROP TABLE A;
--table 삭제

--char : ABC******
--varchar : 가변형
--ABC + 1byte

--관계형 데이터베이스
--1 : 1
--1 : N
--N : N

--SMC_USER
select 1 from dual;
-- UAL이라는 테이블은 SYS 사용자가 소유하는 오라클의 표준 테이블로서 오직 한 행(row)에 한 컬럼만 담고 있는 dummy 테이블로서 
-- 일시적인 산술연산이나 날짜 연산을 위하여 주로 쓰인다.

--listener.ora 변경하면 localhost외에서도 접근할 수 있다.

--홈쇼핑 데이터베이스 구축
--Product table 생성
CREATE TABLE PRODUCT (
    id number NOT NULL,
    category_id number NOT NULL,
    name varchar2(200) NOT NULL,
    price number NOT NULL,
    stock number DEFAULT 0,
    description varchar2(1000),
    origin varchar2(200),
    CONSTRAINT PRODUCT_PK PRIMARY KEY (id)
);
 UNIQUE, -- NULL외의 값은 중복될 수 없음

 desc PRODUCT;

--Category table 생성
 CREATE TABLE CATEGORY (
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    CONSTRAINT CATEGORY_PK PRIMARY KEY (id)
 );

--Member table 생성
CREATE TABLE MEMBER (
    id number NOT NULL,
    password varchar2(100) NOT NULL,
    name varchar2(50) NOT NULL,
    email varchar2(100) NOT NULL,
    phone varchar2(40),
    address varchar2(200),
    age number(3),
    CONSTRAINT MEMBER_PK PRIMARY KEY (id)
);

--Payment table 생성
--status 컬럼
--PAYMENT_WAITING, PAYMENT_SUCCESS, SHIPPING, SHIPPED
--CHECK : 제약조건, 컬럼에 입력되는 데이터를 체크해 특정 조건에 맞는 데이터만 입력 받고 
--그렇지 않으면 오류를 뱉어 낸다.
CREATE TABLE PAYMENT_HISTORY (
    id number NOT NULL,
    order_date date NOT NULL,
    order_status varchar2(16) NOT NULL, 
    order_count number NOT NULL,
    order_price number NOT NULL,
    product_id number NOT NULL,
    member_id number NOT NULL,
    address varchar2(200) NOT NULL,
    CONSTRAINT PAYMENT_HISTORY_PK PRIMARY KEY (id),
    CONSTRAINT PAYMENT_HISTORY_CK CHECK (order_status IN('PAYMENT_WAITING', 'PAYMENT_SUCCESS', 'SHIPPING', 'SHIPPED'))
);

--컬럼에 주석추가
COMMENT ON COLUMN PAYMENT_HISTORY.ORDER_STATUS IS '주문 진행 단계, 4가지 단계만 들어갈 수 있도록 함';

--sqldeveloper
SELECT *
FROM ALL_COL_COMMENTS 
WHERE TABLE_NAME = 'PAYMENT_ORDER';

SELECT *
FROM ALL_COL_COMMENTS 
WHERE TABLE_NAME = 'PAYMENT_HISTORY';

--sqldeveloper
--product에 데이터 임포트
--dummyData_-_PRODUCT.csv, UTF-8
--dummyData_-_CATEGORY.csv, UTF-8
--dummyData_-_MEMBER.csv, UTF-8
--dummyData_-_PAYMENT.csv, UTF-8

SELECT * FROM PRODUCT;
SELECT * FROM CATEGORY;
SELECT * FROM MEMBER;
SELECT * FROM PAYMENT;

SELECT * FROM PRODUCT WHERE PRICE>=100000 AND STOCK<=10;

INSERT INTO PRODUCT(ID, CATEGORY_ID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN) 
VALUES(49, 1, '2021년식 macbook', 1690000, 10, '애플 그 이상', '캘리포니아');

--Catalogue table 생성
CREATE TABLE CATALOGUE (
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    price number NOT NULL,
    origin varchar2(200)
);

INSERT INTO CATALOGUE 
SELECT id, name, price, origin 
FROM PRODUCT
WHERE price >= 100000;

UPDATE INTO CATALOGUE 
SET STOCK = STOCK + 5
WHERE PRICE >=  100000;

DELETE FROM PRODUCT WHERE ID=49;