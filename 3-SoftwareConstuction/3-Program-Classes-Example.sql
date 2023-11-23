CREATE OR REPLACE TYPE Sportsmen_ AS OBJECT (
    id INT,        
    Name VARCHAR(10),       
    age INT,
    address VARCHAR(10),
    NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/
CREATE TYPE SportsmenInfo IS TABLE OF Sportsmen_;
/
CREATE OR REPLACE TYPE Trainingprogramnotifications UNDER Sportsmen_ (
    ID INT, 
    date_of_training DATE,
    status VARCHAR(10),
    Sportsmen VARCHAR(100),       
    OVERRIDING MEMBER PROCEDURE display
); 
/
CREATE OR REPLACE TYPE Choosingtrainingprogram_ AS OBJECT (
    ID INT,
    date_of_training DATE,
    duration INT,
    sportsmen VARCHAR(10),
    MEMBER PROCEDURE display_info
);
/
CREATE OR REPLACE TYPE Expert AS OBJECT (
    ID INT,
    name VARCHAR(100),
    MEMBER PROCEDURE display
); 
/
CREATE OR REPLACE TYPE Answertoonlinemessage AS OBJECT (
    ID INT,
    date_online_message DATE,
    text VARCHAR(100),
    MEMBER PROCEDURE display
); 
