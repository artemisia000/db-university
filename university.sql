
--1. Selezionare tutti gli studenti nati nel 1990 (160).

SELECT * 
FROM `students` 
WHERE YEAR (`date_of_birth`) = 1990;

--2. Selezionare tutti i corsi che valgono più di 10 crediti (479).

SELECT * 
FROM `courses` 
WHERE `cfu` > 10;

--3. Selezionare tutti gli studenti che hanno più di 30 anni. 

SELECT `date_of_birth` 
FROM `students` 
WHERE `date_of_birth` < DATE_SUB(CURRENT_DATE(), INTERVAL 30 YEAR);

--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286).

SELECT * 
FROM `courses` 
WHERE `year` = 1
AND `period` = '| semestre';


--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21).

SELECT * 
FROM `exams` 
WHERE `date`= '2020/06/20'
AND HOUR(`hour`) > 14;


--6. Selezionare tutti i corsi di laurea magistrale (38).

SELECT * 
FROM `degrees` 
WHERE `name` LIKE '%Magistrale%';


--7. Da quanti dipartimenti è composta l'università? (12).

SELECT COUNT(`id`) AS `TOT_DEPARTEMENTS`
FROM `departments` ;

--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50).

SELECT COUNT(`id`)AS `teachers_Not_Number`
FROM `teachers` 
WHERE `phone` IS NULL;

---------------------------------------------------------------------------------------


--1.Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`) AS `Iscritti`, YEAR(`enrolment_date`) AS `Iscrizione`
FROM `students` 
GROUP BY `Iscrizione`;


--2.Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(id),`office_address`
FROM `teachers` 
GROUP BY `office_address`;

--3.Calcolare la media dei voti di ogni appello d'esame

SELECT AVG (`vote`) AS `Media`
FROM `exam_student`;

--4.Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`degree_id`)
FROM `courses` 
INNER JOIN `degrees` ON `courses`.`degree_id`=`degrees`.`id`
INNER JOIN `departments` ON `degrees`.`id` = `departments`.`id`
WHERE `departments`.`id`;

-----------------------------------------------------------------------------------------------------------


--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT * 
FROM `students`
INNER JOIN `degrees` ON `students`.`degree_id`=`degrees`.`id`
WHERE `degrees`.`name` LIKE '%Economia%';


--2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT * 
FROM `degrees`
INNER JOIN `departments`ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` LIKE '%Neuroscienze%';


--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT *
FROM `teachers` 
INNER JOIN `courses` ON `teachers`.`id`=`courses`.`id`
WHERE `teachers`.`name` = 'Fulvio';

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento in ordine alfabetico per cognome e nome.

SELECT `students`.`name`,`students`.`surname`,`degrees`.`name`,`departments`.`name` 
FROM `students` 
INNER JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN`departments` ON `students`.`degree_id` = `departments`.`id`
ORDER BY `students`.`name`,`students`.`surname` ;
