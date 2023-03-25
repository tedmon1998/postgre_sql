CREATE TABLE
    account(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        email VARCHAR(255),
        gender VARCHAR(15),
        birthday DATE DEFAULT NULL,
        status VARCHAR(11) DEFAULT "user"
    );

CREATE TABLE
    part(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255)
    );

CREATE TABLE
    result(
        id SERIAL PRIMARY KEY,
        name VARCHAR(11)
    );

CREATE TABLE
    occasion(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        description VARCHAR(1024),
        on_start BOOLEAN,
        on_task_publish BOOLEAN,
        date DATE,
        time TIME,
        desk JSON
    );

CREATE TABLE
    task(
        id SERIAL PRIMARY KEY,
        account INTEGER,
        FOREIGN KEY (account) REFERENCES account(id) ON UPDATE CASCADE,
        occasion INTEGER,
        FOREIGN KEY (occasion) REFERENCES occasion(id) ON UPDATE CASCADE,
        contact_tg VARCHAR(31),
        category VARCHAR(31),
        title VARCHAR(63),
        specification VARCHAR(2047),
        presentation VARCHAR(2047),
        prize VARCHAR(511),
        expected_result VARCHAR(1023),
        additional_material VARCHAR(2047)
    );

CREATE TABLE
    participant(
        id SERIAL PRIMARY KEY,
        occasion INTEGER,
        FOREIGN KEY (occasion) REFERENCES occasion(id) ON UPDATE CASCADE,
        result INTEGER,
        FOREIGN KEY (result) REFERENCES result(id) ON UPDATE CASCADE,
        account INTEGER,
        FOREIGN KEY (account) REFERENCES account(id) ON UPDATE CASCADE,
        part INTEGER,
        FOREIGN KEY (part) REFERENCES part(id) ON UPDATE CASCADE,
        status BOOLEAN DEFAULT FALSE
    );

CREATE TABLE
    mentor(
        id SERIAL PRIMARY KEY,
        account INTEGER,
        FOREIGN KEY (account) REFERENCES account(id) ON UPDATE CASCADE,
        occasion INTEGER,
        FOREIGN KEY (occasion) REFERENCES occasion(id) ON UPDATE CASCADE,
        status BOOLEAN DEFAULT FALSE
    );

CREATE TABLE
    jury(
        id SERIAL PRIMARY KEY,
        account INTEGER,
        FOREIGN KEY (account) REFERENCES account(id) ON UPDATE CASCADE,
        occasion INTEGER,
        FOREIGN KEY (occasion) REFERENCES occasion(id) ON UPDATE CASCADE,
        status BOOLEAN DEFAULT FALSE
    );


CREATE TABLE
    command(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        participant INTEGER,
        -- ARRY
        FOREIGN KEY (participant) REFERENCES participant(id) ON UPDATE CASCADE,
        table_number SMALLINT,
        repository VARCHAR (512)
    );

CREATE TABLE
    rating_jury(
        id SERIAL PRIMARY KEY,
        command INTEGER,
        FOREIGN KEY (command) REFERENCES command(id) ON UPDATE CASCADE,
        grade REAL,
        jury INTEGER,
        FOREIGN KEY (jury) REFERENCES jury(id) ON UPDATE CASCADE
    );

CREATE TABLE
    rating_mentor(
        id SERIAL PRIMARY KEY,
        command INTEGER,
        FOREIGN KEY (command) REFERENCES command(id) ON UPDATE CASCADE,
        grade REAL,
        mentor INTEGER,
        FOREIGN KEY (mentor) REFERENCES mentor(id) ON UPDATE CASCADE
    );

CREATE TABLE
    rating_sympathy(
        id SERIAL PRIMARY KEY,
        sympathy INTEGER,
        FOREIGN KEY (sympathy) REFERENCES command(id) ON UPDATE CASCADE
    );


    CREATE TABLE
    check_point(
        id SERIAL PRIMARY KEY,
        command INTEGER,
        FOREIGN KEY (command) REFERENCES command(id) ON UPDATE CASCADE,
        grade JSON,
        jury INTEGER,
        FOREIGN KEY (jury) REFERENCES jury(id) ON UPDATE CASCADE,
        occasion INTEGER,
        FOREIGN KEY (occasion) REFERENCES occasion(id) ON UPDATE CASCADE
    );      

    CREATE TABLE
    news(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        description VARCHAR(1024),
        news_link VARCHAR(2047),
        image VARCHAR(2047)
    );     