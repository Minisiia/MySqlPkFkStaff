/*
Спроектируйте базу данных для системы отдела кадров
*/

CREATE DATABASE HumanResourcesDepartment;
USE HumanResourcesDepartment;
CREATE TABLE departments(
	id INT AUTO_INCREMENT NOT NULL,
   	name VARCHAR(50),
    	head VARCHAR(50),
    	phone VARCHAR(15),
	PRIMARY KEY(id)
    );
INSERT INTO departments
(name, head, phone)
VALUES ('Продажа','Полякова Анна Семеновна','12-68-12'),
('Охрана','Петров Антон Сергеевич','45-45-89'),
('Транспортный','Иванов Петр Михайлович','89083457896'),
('Грузчики','Сидоров Михаил Васильевич',null),
('Техническое обслуживание','Королев Александр Александрович','87-95-37');
    
CREATE TABLE positions (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO positions
(name)
VALUE ('Директор'),('Охранник'),('Шофер'),('Грузчик'),('Продавец'),('Электрик');

create table serviceInformation(
    id int auto_increment not null,
    last_name  VARCHAR(20),
    first_name VARCHAR(50),
    department_id INT,
    position_id INT,
    phone VARCHAR(15),
    email VARCHAR(50),
    education VARCHAR(50),
    date_of_hiring DATE,
    date_of_dismissal DATE,
    FOREIGN KEY(department_id) REFERENCES departments(id),
    FOREIGN KEY(position_id) REFERENCES positions(id),
    PRIMARY KEY(id)    
    );
INSERT INTO serviceInformation
(last_name, first_name , department_id , position_id , phone, email, education, date_of_hiring, date_of_dismissal)
VALUES ('Старков', 'Андрей Владимирович',1 , 1,'+380952020121','mi_lkj@gmail.com', 'Высшее', '2020-02-02',null),
('Иванов', 'Петр Михайлович',3 , 3,'+380952010121','dsdfj@gmail.com', 'Средне специальное', '2010-10-02',null),
('Сидоров', 'Михаил Васильевич', 2 , 2,'+380441220121','slfkj@gmail.com', 'Среднее', '2020-02-02',null),
('Полякова', 'Анна Семеновна',1 , 5,'+380506666021','sdfa@gmail.com', 'Средне специальное', '2000-02-10',null),
('Воробьева', 'Ольга Андреевна', 1 , 5,'+380952020521','333@gmail.com', 'Средне специальное', '2020-02-02',null),
('Петров', 'Антон Сергеевич', 2 , 2,'+380952156152','55ssss@gmail.com', 'Среднее', '2020-02-02',null),
('Абрамов', 'Сергей Абрамович', 4 , 4,'+380952154442','55444ss@gmail.com', 'Среднее (неполное)', '200-01-02',null),
('Королев', 'Александр Александрович', 5 , 6,'+380500066005','2fffff@gmail.com', 'Средне специальное', '2020-02-02',null);

CREATE TABLE personalInformation(
	id INT AUTO_INCREMENT NOT NULL,
	birth_date DATE,
    city VARCHAR(50),
    passport VARCHAR(50),
    inn VARCHAR(50),
    adress VARCHAR(100),
    maritalstatus VARCHAR(10),
    children INT, 
    serviceinfo_id INT,
    FOREIGN KEY(serviceinfo_id) REFERENCES serviceInformation(id),
    PRIMARY KEY(id)    
    );
    
INSERT INTO personalInformation
(birth_date, city, passport, inn, adress, maritalstatus, children, serviceinfo_id)
VALUES('1987-12-12','Харьков', 'ИИ 654358', '1235466431256', 'ул. Шевченко, 34, кв. 32', 'женат', 2, 1),
('1990-11-10','Киев', 'ММ 654358', '54647547546', 'ул. Свободы, 265, кв. 87', 'женат', 1, 2),
('1991-12-12','Одесса', 'КА 5464564', '356756376565', 'ул. Метрополита, 55, кв. 32', 'не женат', 0, 3),
('2000-07-12','Житомир', 'ИП 332342', '356766735', 'ул. Духновича, 4, кв. 32', 'замужем', 0, 4),
('1999-08-05','Лозовая', 'КП 3453453', '35675367575', 'ул. Мира, 546, кв. 234', 'не замужем', 0, 5),
('2000-09-22','Красноград', 'ИВ 34345346', '35775637656', 'ул. Счастья, 4, кв. 32', 'женат', 2, 6),
('2001-10-08','Киев', 'ИВ 345354', '356767537', 'ул. Радости, 34, кв. 234', 'не женат', 0, 7),
('1997-12-11','Харьков', 'РВ 5675675', '3567375676', 'ул. Научная, 2, кв. 342', 'женат', 1, 8);
    
-- Проверка каждой таблицы
SELECT * FROM personalInformation;
SELECT * FROM serviceInformation;
SELECT * FROM positions;
SELECT * FROM departments;

-- Проверка связей таблицы. Вывести по одному столбцу с каждой таблицы: фамилия, город, должность, отдел.
SELECT 
    serviceInformation.last_name AS last_name,
    personalInformation.city AS city,
    positions.name AS position,
    departments.name AS department
FROM serviceInformation
LEFT JOIN personalInformation
ON serviceInformation.id = personalInformation.serviceinfo_id
LEFT JOIN positions 
ON serviceInformation.position_id = positions.id
LEFT JOIN departments 
ON serviceInformation.department_id = departments.id
ORDER BY serviceInformation.last_name;
        
        


    
