create table bank.bank_account
(
    a_o         varchar(11) not null
        primary key,
    a_item_dist varchar(2)  not null,
    a_item_name varchar(20) not null,
    a_c_no      varchar(14) not null,
    a_balance   int         not null,
    a_ipen_date date        not null
);

create table userdb.bank_account
(
    a_o         varchar(11) not null
        primary key,
    a_item_dist varchar(2)  not null,
    a_item_name varchar(20) not null,
    a_c_no      varchar(14) not null,
    a_balance   int         not null,
    a_ipen_date date        not null
);

create table bank.bank_customer
(
    c_no    varchar(14)  not null
        primary key,
    c_name  varchar(20)  not null,
    c_dist  int          not null,
    c_phone varchar(20)  not null,
    c_addr  varchar(100) null,
    constraint c_phone
        unique (c_phone)
);

create table userdb.bank_customer
(
    c_no    varchar(14)  not null
        primary key,
    c_name  varchar(20)  not null,
    c_dist  int          not null,
    c_phone varchar(20)  not null,
    c_addr  varchar(100) null,
    constraint c_phone
        unique (c_phone)
);

create table bank.bank_transaction
(
    t_no       int auto_increment
        primary key,
    t_a_no     varchar(11)   not null,
    t_dist     int           not null,
    t_amount   int default 0 not null,
    t_datetime datetime      not null
);

create table userdb.bank_transaction
(
    t_no       int auto_increment
        primary key,
    t_a_no     varchar(11)   not null,
    t_dist     int           not null,
    t_amount   int default 0 not null,
    t_datetime datetime      not null
);

create table erd2.coustomer
(
    custId int auto_increment
        primary key,
    name   varchar(10) not null,
    addres varchar(20) not null,
    phone  varchar(13) null
);

create table finance.customer
(
    cust_jumin varchar(20)  not null
        primary key,
    cust_name  varchar(20)  not null,
    cust_addr  varchar(100) not null,
    cust_birth date         null,
    cust_email varchar(50)  null,
    cust_phnum varchar(25)  not null,
    cust_job   varchar(30)  not null,
    constraint cust_email
        unique (cust_email)
);

create table finance.account
(
    acc_id            varchar(14) not null
        primary key,
    cust_jumin        varchar(20) not null,
    acc_type          varchar(20) not null,
    acc_balance       int         not null,
    acc_card          char        not null,
    acc_register_date datetime    null,
    constraint account_customer_cust_jumin_fk
        foreign key (cust_jumin) references finance.customer (cust_jumin)
);

create table finance.card
(
    card_no            char(14)    null,
    cust_jumin         varchar(20) null,
    acc_id             varchar(14) null,
    card_register_date date        null,
    card_limit_money   int         null,
    card_approve_date  date        null,
    card_type          varchar(10) not null,
    constraint card_account_acc_id_fk
        foreign key (acc_id) references finance.account (acc_id),
    constraint card_customer_cust_jumin_fk
        foreign key (cust_jumin) references finance.customer (cust_jumin)
);

create table shop.customer
(
    custId varchar(10)  not null
        primary key,
    name   varchar(10)  not null,
    hp     char(13)     null,
    addr   varchar(100) null,
    rdate  date         not null,
    constraint hp
        unique (hp)
);

create table erd1.department
(
    depNo   int         not null
        primary key,
    depName varchar(20) not null,
    depTel  varchar(13) not null,
    constraint depTel_UNIQUE
        unique (depTel)
);

create table hospital.department
(
    dep_no      char(3)     not null
        primary key,
    dep_name    varchar(20) not null,
    dep_manager varchar(20) not null,
    dep_tel     varchar(20) not null
);

create table university.department
(
    depNo   int         not null
        primary key,
    depName varchar(20) not null,
    depTel  varchar(14) not null
);

create table userdb.department
(
    depNo int         not null
        primary key,
    name  varchar(10) not null,
    tel   varchar(12) not null,
    constraint tel
        unique (tel)
);

create table hospital.doctors
(
    doc_id    char(7)     not null
        primary key,
    doc_name  varchar(45) not null,
    doc_birth char(10)    not null,
    doc_gen   char        not null,
    dep_no    char(3)     not null,
    doc_pos   varchar(45) not null,
    doc_phone varchar(20) not null,
    doc_email varchar(45) not null,
    constraint doc_email_UNIQUE
        unique (doc_email),
    constraint doc_phone_UNIQUE
        unique (doc_phone),
    constraint fk_Doctors_Department
        foreign key (dep_no) references hospital.department (dep_no)
);

create index fk_Doctors_Department_idx
    on hospital.doctors (dep_no);

create table college.lecture
(
    lecNo     int          not null
        primary key,
    lecName   varchar(20)  not null,
    lecCredit int          not null,
    lecTime   int          not null,
    lecClass  varchar(100) null
);

create table userdb.member
(
    uid   varchar(10)              not null
        primary key,
    name  varchar(10)              not null,
    hp    varchar(13)              not null,
    pos   varchar(10) default '사원' null,
    dep   int                      null,
    rdata datetime                 not null
);

create table erd1.member
(
    uid   varchar(20) not null
        primary key,
    name  varchar(20) not null,
    hp    char(13)    not null,
    pos   varchar(20) null,
    dep   int         not null,
    rdate datetime    not null,
    constraint hp_UNIQUE
        unique (hp),
    constraint fk_Member_Department
        foreign key (dep) references erd1.department (depNo)
);

create index fk_Member_Department_idx
    on erd1.member (dep);

create table hospital.nurses
(
    nur_id     char(7)     not null
        primary key,
    nur_name   varchar(45) not null,
    nur_birth  varchar(45) not null,
    nur_gender char        not null,
    dep_no     char(3)     not null,
    nur_pos    varchar(45) not null,
    nur_phone  char(13)    not null,
    nur_email  varchar(45) null,
    constraint nur_email_UNIQUE
        unique (nur_email),
    constraint nur_phone_UNIQUE
        unique (nur_phone),
    constraint fk_Nurses_Department1
        foreign key (dep_no) references hospital.department (dep_no)
);

create index fk_Nurses_Department1_idx
    on hospital.nurses (dep_no);

create table shop.`order`
(
    orderNo      int auto_increment
        primary key,
    orderId      varchar(10) not null,
    orderProduct int         not null,
    orderCount   int         not null,
    orderDate    datetime    not null
);

create table userdb.parent
(
    pid  varchar(10) not null
        primary key,
    name varchar(10) null,
    hp   char(13)    null,
    constraint hp
        unique (hp)
);

create table userdb.child
(
    cid  varchar(10) not null
        primary key,
    name varchar(10) null,
    hp   char(13)    null,
    pid  varchar(10) null,
    constraint hp
        unique (hp),
    constraint child_ibfk_1
        foreign key (pid) references userdb.parent (pid)
);

create index pid
    on userdb.child (pid);

create table hospital.patients
(
    pat_id    char(7)      not null
        primary key,
    doc_id    char(7)      not null,
    nur_id    char(7)      not null,
    pat_name  varchar(45)  not null,
    pat_jumin char(14)     not null,
    pat_gen   char         not null,
    pat_addr  varchar(100) not null,
    pat_phone varchar(45)  not null,
    pat_email varchar(45)  null,
    pat_job   varchar(45)  null,
    constraint pat_email_UNIQUE
        unique (pat_email),
    constraint pat_jumin_UNIQUE
        unique (pat_jumin),
    constraint pat_phone_UNIQUE
        unique (pat_phone),
    constraint fk_patients_Doctors1
        foreign key (doc_id) references hospital.doctors (doc_id),
    constraint fk_patients_Nurses1
        foreign key (nur_id) references hospital.nurses (nur_id)
);

create index fk_patients_Doctors1_idx
    on hospital.patients (doc_id);

create index fk_patients_Nurses1_idx
    on hospital.patients (nur_id);

create table jboard.product
(
    pNo      int auto_increment
        primary key,
    type     int          null,
    pName    varchar(100) null,
    price    int          null,
    delivery int          null,
    stock    int          null,
    sold     int          null,
    thumb1   varchar(100) null,
    thumb2   varchar(100) null,
    thumb3   varchar(100) null,
    seller   varchar(100) null,
    etc      varchar(100) null,
    rDate    datetime     null
);

create table shop.product
(
    prodNo   int             not null
        primary key,
    prodName varchar(10)     not null,
    stock    int default (0) not null,
    price    int             null,
    company  varchar(20)     null
);

create table university.professors
(
    proNo    char(6)      not null
        primary key,
    depNo    int          not null,
    proName  varchar(20)  null,
    proJumin char(14)     null,
    proHp    char(13)     null,
    proEmail varchar(45)  null,
    ptrAddr  varchar(100) null,
    constraint fk_Professors_Department1
        foreign key (depNo) references university.department (depNo)
);

create table university.lectures
(
    lecNo     char(6)     not null,
    proNo     char(6)     not null,
    lecName   varchar(45) not null,
    lecCredit tinyint     not null,
    lecTime   tinyint     not null,
    lecClass  varchar(45) not null,
    primary key (lecNo, proNo),
    constraint fk_Lectures_Professors
        foreign key (proNo) references university.professors (proNo)
);

create index fk_Lectures_Professors_idx
    on university.lectures (proNo);

create index fk_Professors_Department1_idx
    on university.professors (depNo);

create table erd2.publisher
(
    pubName varchar(20) not null
        primary key,
    pubTel  varchar(13) null
)
    comment '
	
';

create table erd2.book
(
    bookId    int           not null
        primary key,
    bookName  varchar(20)   not null,
    publisher varchar(20)   not null,
    price     int default 0 null,
    constraint fk_Book_publisher1
        foreign key (publisher) references erd2.publisher (pubName)
);

create index fk_Book_publisher1_idx
    on erd2.book (publisher);

create table erd2.`order`
(
    orderId   int auto_increment,
    custId    int         not null,
    bookId    int         not null,
    salePrice int         not null,
    Ordercol  varchar(45) not null,
    primary key (orderId, custId, bookId),
    constraint fk_Order_Book1
        foreign key (bookId) references erd2.book (bookId),
    constraint fk_Order_Coustomer1
        foreign key (custId) references erd2.coustomer (custId)
);

create index fk_Order_Book1_idx
    on erd2.`order` (bookId);

create index fk_Order_Coustomer1_idx
    on erd2.`order` (custId);

create table college.register
(
    regStdNo      varchar(8) not null,
    regLecNo      int        not null,
    regMidScore   int        null,
    regFinalScore int        null,
    regTotalScore int        null,
    regGrade      char       null
);

create table userdb.sales
(
    seq   int auto_increment
        primary key,
    uid   varchar(10) not null,
    year  year        not null,
    month tinyint     not null,
    sale  int         not null
);

create table erd1.sales
(
    seq   int auto_increment,
    uid   varchar(20)   not null,
    year  year          not null,
    month tinyint       not null,
    price int default 0 null,
    primary key (seq, uid),
    constraint fk_sales_Member1
        foreign key (uid) references erd1.member (uid)
);

create index fk_sales_Member1_idx
    on erd1.sales (uid);

create table userdb.sales2
(
    seq   int auto_increment
        primary key,
    uid   varchar(10) not null,
    year  year        not null,
    month tinyint     not null,
    sale  int         not null
);

create table college.student
(
    stdNo      varchar(8)   not null
        primary key,
    stdName    varchar(20)  not null,
    stdHp      varchar(13)  not null,
    stdYear    int          not null,
    stdAddress varchar(100) null,
    constraint stdHp
        unique (stdHp)
);

create table university.students
(
    stdNo    char(8)      not null
        primary key,
    depNo    int          not null,
    proNo    char(6)      not null,
    stdName  varchar(20)  not null,
    stdJumin char(14)     not null,
    stdHp    char(13)     not null,
    stdEmail varchar(45)  null,
    stdAddr  varchar(100) not null,
    constraint stdEmail_UNIQUE
        unique (stdEmail),
    constraint stdHp_UNIQUE
        unique (stdHp),
    constraint stdJumin_UNIQUE
        unique (stdJumin)
)
    comment '			' engine = MyISAM;

create table university.register
(
    stdNo         char(8) not null,
    lecNo         char(6) not null,
    proNo         char(6) not null,
    regAttenScore tinyint null,
    regMidScore   tinyint null,
    regFinalScore tinyint null,
    regEtcScore   tinyint null,
    regTotal      tinyint null,
    regGrade      char    null,
    primary key (lecNo, proNo, stdNo),
    constraint fk_Register_Lectures1
        foreign key (lecNo, proNo) references university.lectures (lecNo, proNo),
    constraint fk_Register_Students1
        foreign key (stdNo) references university.students (stdNo)
);

create index fk_Register_Lectures1_idx
    on university.register (lecNo, proNo);

create index fk_Register_Students1_idx
    on university.register (stdNo);

create index fk_Students_Department1_idx
    on university.students (depNo);

create index fk_Students_Professors1_idx
    on university.students (proNo);

create table userdb.tblproduct
(
    prdCode     int         null,
    prdname     varchar(10) null,
    prdPrice    int         null,
    prdAmount   int         null,
    prdCompany  varchar(10) null,
    prdMakeDate date        null
);

create table userdb.tbluser
(
    userid   varchar(10) null,
    username varchar(10) null,
    userhp   char(13)    null,
    userage  tinyint     null,
    userAddr varchar(20) null
);

create table jboard.terms
(
    terms   text not null,
    privacy text not null
);

create table finance.transaction
(
    trans_id      int auto_increment
        primary key,
    trans_acc_id  varchar(14) null,
    trans_type    varchar(20) null,
    trans_message varchar(20) null,
    trans_money   int         null,
    trans_date    datetime    not null,
    constraint transaction_account_acc_id_fk
        foreign key (trans_acc_id) references finance.account (acc_id)
);

create table hospital.treatment
(
    treat_no       int          not null,
    doc_id         char(7)      not null,
    pat_id         char(7)      not null,
    treat_contents varchar(255) not null,
    treat_datetime datetime     not null,
    primary key (treat_no, doc_id, pat_id),
    constraint fk_Treatment_Doctors1
        foreign key (doc_id) references hospital.doctors (doc_id),
    constraint fk_Treatment_patients1
        foreign key (pat_id) references hospital.patients (pat_id)
);

create table hospital.charts
(
    chart_id       char(8)      not null,
    treat_no       int          not null,
    doc_id         char(7)      not null,
    pat_id         char(7)      not null,
    chart_contents varchar(255) not null,
    primary key (chart_id, treat_no, doc_id, pat_id),
    constraint fk_Charts_Treatment1
        foreign key (treat_no, doc_id, pat_id) references hospital.treatment (treat_no, doc_id, pat_id)
);

create index fk_Charts_Treatment1_idx
    on hospital.charts (treat_no, doc_id, pat_id);

create index fk_Treatment_Doctors1_idx
    on hospital.treatment (doc_id);

create index fk_Treatment_patients1_idx
    on hospital.treatment (pat_id);

create table jboard.user
(
    uid       varchar(20)                not null
        primary key,
    pass      varchar(255)               null,
    name      varchar(20)                null,
    nick      varchar(20)                null,
    email     varchar(100)               null,
    hp        char(13)                   null,
    role      varchar(20) default 'USER' null,
    zip       char(5)                    null,
    addr1     varchar(255)               null,
    addr2     varchar(255)               null,
    regIp     varchar(100)               null,
    regDate   datetime                   null,
    leaveDate datetime                   null,
    constraint email
        unique (email),
    constraint hp
        unique (hp),
    constraint nick
        unique (nick)
);

create table jboard.article
(
    no      int auto_increment
        primary key,
    parent  int         default 0      null,
    comment int         default 0      null,
    cate    varchar(20) default 'free' null,
    title   varchar(255)               null,
    content text                       not null,
    file    tinyint     default 0      null,
    hit     int         default 0      null,
    writer  varchar(20)                not null,
    regIp   varchar(100)               not null,
    rDate   datetime                   not null,
    constraint article_ibfk_1
        foreign key (writer) references jboard.user (uid)
);

create index writer
    on jboard.article (writer);

create table jboard.file
(
    fNo      int auto_increment
        primary key,
    aNo      int           not null,
    oriName  varchar(255)  not null,
    newName  varchar(255)  not null,
    download int default 0 null,
    rDate    datetime      null,
    constraint file_ibfk_1
        foreign key (aNo) references jboard.article (no)
);

create index aNo
    on jboard.file (aNo);

create table userdb.user1
(
    uid  varchar(10) null,
    name varchar(10) null,
    hp   char(13)    null,
    age  int         null
);

create table userdb.user2
(
    uid  varchar(10) not null
        primary key,
    name varchar(10) null,
    hp   char(13)    null,
    age  int         null
);

create table userdb.user3
(
    uid  varchar(10) not null
        primary key,
    name varchar(10) null,
    hp   char(13)    null,
    age  int         null,
    constraint hp
        unique (hp)
);

create table userdb.user4
(
    seq    int auto_increment
        primary key,
    name   varchar(10)  null,
    gender tinyint      null,
    age    int          null,
    addr   varchar(255) null
);

create table userdb.user5
(
    name    varchar(10)                   not null,
    birth   char(10) default '2000-00-00' null,
    age     tinyint                       null,
    address varchar(100)                  null,
    hp      char(13)                      null,
    uid     int                           not null
        primary key
);

create table userdb.user6
(
    uid  varchar(10) not null
        primary key,
    name varchar(10) null,
    hp   char(13)    null,
    age  int         null,
    constraint hp
        unique (hp)
);


SELECT * FROM jboard.product;
INSERT INTO jboard.product ( type, pName, price, delivery, stock, sold, thumb1, thumb2, thumb3, seller, etc, rDate)
select type, pName, price, delivery, stock, sold, thumb1, thumb2, thumb3, seller, etc, rDate from jboard.product;

# 게시물 개수 구하기
select count(pNo) from jboard.product;
select count(pNo) from jboard.product where type=?;

# 10개씩 나누기
select * from jboard.product order by jboard.product.pNo desc limit ?, 10 ;
select * from jboard.product where type=? order by jboard.product.pNo desc limit ?, 10 ;


create table `Order`
(
    orderNo       int auto_increment,
    orderProduct  int          null,
    orderCount    int          null,
    orderDelivery int          null,
    orderPrice    int          null,
    orderTotal    int          null,
    receiver      varchar(100) null,
    hp            varchar(100) null,
    zip           varchar(100) null,
    addr1         varchar(100) null,
    addr2         varchar(100) null,
    orderEtc      varchar(100) null,
    orderUser     varchar(100) null,
    orderDate     datetime     null,
    constraint Order_pk
        primary key (orderNo)
);

SELECT * from jboard.`product` where pNo = 1;
INSERT INTO jboard.`order` (orderProduct, orderCount, orderDelivery, orderPrice, orderTotal, receiver, hp, zip, addr1,
                            addr2, orderEtc, orderUser, orderDate)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW());

UPDATE jboard.product set stock=product.stock-1 where pNo= ?;

SELECT * FROM jboard.user order by regDate DESC limit 0,10;
SELECT * FROM jboard.`order` as a join jboard.product as b on a.orderProduct = b.pNo order by orderNo DESC limit 0,10;

Select a.uid ,sum(orderTotal) from jboard.user as a join jboard.`order` o on a.uid = o.orderUser where orderUser=? group by orderUser;