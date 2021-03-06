create table tbl_artist_201905(
    artist_id char(4) not null,
    artist_name varchar2(20),
    artist_birth char(8),
    artist_gender char(1),
    talent char(1),
    agency varchar(30),
    constraint pk_artist primary key(artist_id)
);

create table tbl_mento_201905(
    mento_id char(4) not null,
    mento_name varchar2(20),
    constraint pk_mento primary key(mento_id)
);

create table tbl_point_201905(
    serial_no number(8) not null,
    artist_id char(4),
    mento_id char(4),
    point number(3),
    constraint pk_point primary key(serial_no)
);

INSERT INTO TBL_ARTIST_201905 VALUES('A001', '김스타', 19970101, 'F', 1 'A엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A002', '조스타', 19980201, 'M', 2 'B엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A003', '왕스타', 19900301, 'M', 3 'C엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A004', '정스타', 20000401, 'M', 1 'D엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A005', '홍스타', 20010501, 'F', 2 'E엔터테이먼트');

INSERT INTO TBL_MENTO_201905 VALUSE('J001', '함멘토');
INSERT INTO TBL_MENTO_201905 VALUSE('J002', '박멘토');
INSERT INTO TBL_MENTO_201905 VALUSE('J003', '장멘토');

INSERT INTO TBL_POINT_201905 VALUES(2019001, 'A001', 'J001', 78);
INSERT INTO TBL_POINT_201905 VALUES(2019002, 'A001', 'J002', 76);
INSERT INTO TBL_POINT_201905 VALUES(2019003, 'A001', 'J003', 70);
INSERT INTO TBL_POINT_201905 VALUES(2019004, 'A002', 'J001', 80);
INSERT INTO TBL_POINT_201905 VALUES(2019005, 'A002', 'J002', 72);
INSERT INTO TBL_POINT_201905 VALUES(2019006, 'A002', 'J003', 78);
INSERT INTO TBL_POINT_201905 VALUES(2019007, 'A003', 'J001', 90);
INSERT INTO TBL_POINT_201905 VALUES(2019008, 'A003', 'J002', 92);
INSERT INTO TBL_POINT_201905 VALUES(2019009, 'A003', 'J003', 88);
INSERT INTO TBL_POINT_201905 VALUES(2019010, 'A004', 'J001', 96);
INSERT INTO TBL_POINT_201905 VALUES(2019011, 'A004', 'J002', 90);
INSERT INTO TBL_POINT_201905 VALUES(2019012, 'A004', 'J003', 98);
INSERT INTO TBL_POINT_201905 VALUES(2019013, 'A005', 'J001', 88);
INSERT INTO TBL_POINT_201905 VALUES(2019014, 'A005', 'J002', 86);
INSERT INTO TBL_POINT_201905 VALUES(2019015, 'A005', 'J003', 86);

