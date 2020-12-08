create table product(
    product_id number(10) not null,
    name varchar2(40),
    price number(10),
    category_id number(10) not null,
    constraint PK_PRODUCT primary key(product_id)
);

create table category(
    category_id number(10) not null,
    name varchar2(20)
);

create table sale(
    sale_id number(10) not null,
    product_id number(10) not null,
    purchase_date date,
    sale_price number(10) not null,
    amount number(5) not null,
    constraint PK_SALE primary key(sale_id)
);

INSERT INTO PRODUCT VALUES(1,'컴퓨터',1000000,1);
INSERT INTO PRODUCT VALUES(2,'태블릿 PC',800000, 1);
INSERT INTO PRODUCT VALUES(3,'핸드폰', 1200000, 1);
INSERT INTO PRODUCT VALUES(4,'헤드셋', 80000, 1);
INSERT INTO PRODUCT VALUES(5,' 무선 이어폰', 210000, 1);
INSERT INTO PRODUCT VALUES(6,'책상', 160000, 2);
INSERT INTO PRODUCT VALUES(7,'의자', 90000, 2);
INSERT INTO PRODUCT VALUES(8,'소고기', 12000, 3);
INSERT INTO PRODUCT VALUES(9,'티셔츠', 58000, 4);


INSERT INTO SALE VALUES(1, 1, '20200101', 1000000, 1);
INSERT INTO SALE VALUES(2, 2, '20200101', 1600000, 2);
INSERT INTO SALE VALUES(3, 1, '20200101', 2000000, 2);
INSERT INTO SALE VALUES(4, 4, '20200102', 240000, 3);
INSERT INTO SALE VALUES(5, 5, '20200104', 210000, 1);
INSERT INTO SALE VALUES(6, 6, '20200106', 320000, 2);
INSERT INTO SALE VALUES(7, 7, '20200111', 360000, 4);
INSERT INTO SALE VALUES(8, 8, '20200115', 60000, 5);
INSERT INTO SALE VALUES(9, 9, '20200117', 58000, 1);
INSERT INTO SALE VALUES(10, 9,' 20200120', 580000, 10);
INSERT INTO SALE VALUES(11, 2,' 20200121', 1600000, 2);
INSERT INTO SALE VALUES(12, 1,' 20200122', 1000000, 1);
INSERT INTO SALE VALUES(13, 4,' 20200124', 80000, 1);
INSERT INTO SALE VALUES(14, 5,' 20200126', 210000, 1);
INSERT INTO SALE VALUES(15, 6,' 20200129', 160000, 1);


INSERT INTO category VALUES(1, '전자제품');
INSERT INTO category VALUES(2, '가구');
INSERT INTO category VALUES(3, '식품');
INSERT INTO category VALUES(4, '의류');















