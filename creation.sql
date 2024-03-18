CREATE TABLE PERSON (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    BIO VARCHAR2(1000),
    PICTURE VARCHAR(255),
    CONSTRAINT PK_PERSON PRIMARY KEY (ID)
);

CREATE TABLE USER_ (
    ID INT,
    DESCRIPTION VARCHAR2(255),
    NAME VARCHAR2(255),
    CREATION_DATE DATE,
    CONSTRAINT FK_PERSON FOREIGN KEY (ID) REFERENCES PERSON(ID),
    CONSTRAINT PK_USER PRIMARY KEY (ID)
);

CREATE TABLE GENRE (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    GENRE VARCHAR2(255),
    CONSTRAINT PK_GENRE PRIMARY KEY (ID)
);

CREATE TABLE MOVIE (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    AVERAGE_GRADE NUMBER,
    GENRE NUMBER,
    NAME VARCHAR2(255),
    COVER BLOB,
    D_SYNOSPSIS VARCHAR2(1000),
    D_YEAR NUMBER,
    D_DURATION NUMBER,
    CONSTRAINT PK_MOVIE PRIMARY KEY (ID),
    CONSTRAINT FK_MOVIE_GENRE FOREIGN KEY (GENRE) REFERENCES GENRE(ID)
);

CREATE TABLE CRITICS_REVIEW (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TEXT VARCHAR2(1000),
    ID_MOVIE NUMBER,
    CONSTRAINT PK_CRITICS_REVIEW PRIMARY KEY (ID),
    CONSTRAINT FK_CRITICS_REVIEW_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE RE_VIEW (
    ID_USER NUMBER,
    ID_MOVIE NUMBER,
    WATCH_TIME_STAMP TIMESTAMP,
    RVW_TIMESTAMP TIMESTAMP,
    TEXT VARCHAR2(1000),
    DATE_WATCHED DATE,
    CONSTRAINT FK_REVIEW_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID),
    CONSTRAINT FK_REVIEW_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE CREW_MEMBER (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    NAME VARCHAR2(255),
    N_ACTED NUMBER,
    N_DIRECTED NUMBER,
    N_PRODUCED NUMBER,
    CONSTRAINT PK_CREW_MEMBER PRIMARY KEY (ID),
    CONSTRAINT FK_CREW_MEMBER_PERSON FOREIGN KEY (ID) REFERENCES PERSON(ID)
);

CREATE TABLE WATCHES_ (
    ID_MOVIE NUMBER,
    ID_USER NUMBER,
    TIME_STAMP TIMESTAMP,
    GRADE NUMBER,
    CONSTRAINT FK_WATCHES_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID),
    CONSTRAINT FK_WATCHES_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID)
);

CREATE TABLE CONTAINS (
    ID_LIST NUMBER,
    ID_MOVIE NUMBER,
    CONSTRAINT FK_CONTAINS_LIST FOREIGN KEY (ID_LIST) REFERENCES LIST(ID),
    CONSTRAINT FK_CONTAINS_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE PLAYED_BY (
    ID_MOVIE NUMBER,
    ID_CREW NUMBER,
    ROLE VARCHAR2(255),
    CONSTRAINT FK_PLAYED_BY_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID),
    CONSTRAINT FK_PLAYED_BY_CREW FOREIGN KEY (ID_CREW) REFERENCES CREW(ID)
);

CREATE TABLE DIRECTS (
    ID_MOVIE NUMBER,
    ID_CREW NUMBER,
    DIRECTORID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    CONSTRAINT FK_DIRECTS_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID),
    CONSTRAINT FK_DIRECTS_CREW FOREIGN KEY (ID_CREW) REFERENCES CREW(ID)
);

CREATE TABLE PROMOTES (
    ID_USER NUMBER,
    ID_CREW_MEMBER NUMBER,
    ID_MOVIE NUMBER,
    TEXT VARCHAR2(1000),
    CONSTRAINT FK_PROMOTES_USER FOREIGN KEY (ID_USER) REFERENCES USER(ID),
    CONSTRAINT FK_PROMOTES_CREW_MEMBER FOREIGN KEY (ID_CREW_MEMBER) REFERENCES CREW_MEMBER(ID),
    CONSTRAINT FK_PROMOTES_MOVIE FOREIGN KEY (ID_MOVIE) REFERENCES MOVIE(ID)
);

CREATE TABLE FOLLOWS (
    ID_FOLLOWS NUMBER,
    ID_IS_FOLLOWED NUMBER,
    CONSTRAINT FK_FOLLOWS_USER FOREIGN KEY (ID_FOLLOWS) REFERENCES USER(ID),
    CONSTRAINT FK_FOLLOWS_IS_FOLLOWED FOREIGN KEY (ID_IS_FOLLOWED) REFERENCES USER(ID)
);

CREATE TABLE FAVORITEMOVIES (
    ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    FAVORITE_MOVIES NUMBER,
    CONSTRAINT PK_FAVORITE_MOVIES PRIMARY KEY (ID),
    CONSTRAINT FK_FAVORITE_MOVIES_USER FOREIGN KEY (ID) REFERENCES USER(ID)
);