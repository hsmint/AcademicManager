create table COURSE
(
    id   int auto_increment
        primary key,
    name varchar(10) not null,
    type varchar(20) not null
);

create table TEACHER
(
    id    int auto_increment
        primary key,
    name  varchar(5)  not null,
    phone varchar(11) not null
);

create table TIME_SLOT
(
    id           int auto_increment
        primary key,
    start_date   date                                    not null,
    end_date     date                                    not null,
    section_date set ('월', '화', '수', '목', '금', '토', '일') not null
);

create table SECTION
(
    course_id   int           not null
        primary key,
    course_name varchar(10)   not null,
    price       int default 0 not null,
    book_price  int default 0 not null,
    teacher_id  int           not null,
    timeslot_id int           null,
    constraint SECTION_COURSE_id_fk
        foreign key (course_id) references COURSE (id)
            on update cascade on delete cascade,
    constraint SECTION_TEACHER_id_fk
        foreign key (teacher_id) references TEACHER (id)
            on update cascade on delete cascade,
    constraint SECTION_TIME_SLOT_id_fk
        foreign key (timeslot_id) references TIME_SLOT (id)
);

create table PAYMENT
(
    id        int auto_increment
        primary key,
    type      varchar(20) null,
    course_id int         not null,
    constraint PAYMENT_SECTION_course_id_fk
        foreign key (id) references SECTION (course_id)
            on update cascade on delete cascade
);

create table STUDENT
(
    id         int auto_increment
        primary key,
    name       varchar(5)  not null,
    address    varchar(50) not null,
    phone      varchar(11) null,
    home_phone varchar(11) null,
    payment_id int         not null,
    constraint STUDENT_PAYMENT_id_fk
        foreign key (payment_id) references PAYMENT (id)
            on update cascade
);

create table ATTEND
(
    std_id    int      not null,
    course_id int      not null,
    date      datetime null,
    primary key (course_id, std_id),
    constraint ATTEND_SECTION_course_id_fk
        foreign key (course_id) references SECTION (course_id)
            on update cascade on delete cascade,
    constraint ATTEND_STUDENT_id_fk
        foreign key (std_id) references STUDENT (id)
            on update cascade on delete cascade
);

create table GUARDIAN
(
    std_id int         not null
        primary key,
    name   varchar(5)  not null,
    phone  varchar(11) not null,
    constraint GUARDIAN_STUDENT_id_fk
        foreign key (std_id) references STUDENT (id)
            on update cascade on delete cascade
);