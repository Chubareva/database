-- 1) Создать запрос для создания view представляющие собой копию структуры для 2NF основываясь на вставленных данных для 1NF из первого задания.														
CREATE VIEW 2NF_View AS
SELECT 
US_Realease_Dateilm, 
    Director ,
    Screenwritter ,
    Producer,
    Budget,
    Rotten_Tomatoes ,
    Metacritic
FROM 1NF;

CREATE VIEW 2NF_id_film_View AS
SELECT DISTINCT Film
FROM 1NF;

CREATE VIEW 2NF_Box_office_gross_View AS
SELECT DISTINCT Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide
FROM 1NF;

CREATE VIEW 2NF_All_time_Ranking_View AS
SELECT All_time_Ranking_US_and_Canada,All_time_Ranking_Worwide
FROM 1NF;



-- 2) Создать запросы вставки данных в существующие таблицы из 1NF во 2NF.							
INSERT INTO 2NF (US_Realease_Dateilm, Director , Screenwritter , Producer, Budget, Rotten_Tomatoes , Metacritic)
SELECT US_Realease_Dateilm, Director , Screenwritter , Producer, Budget, Rotten_Tomatoes , Metacritic 
FROM 1NF;
 
INSERT INTO 2NF_id_film ( Film)
SELECT DISTINCT Film
FROM 1NF;


INSERT INTO 2NF_Box_office_gross( Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide)
SELECT DISTINCT  Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide
FROM 1NF;

INSERT INTO 2NF_All_time_Ranking (All_time_Ranking_US_and_Canada,All_time_Ranking_Worwide)
SELECT DISTINCT All_time_Ranking_US_and_Canada,All_time_Ranking_Worwide
FROM 1NF;

 -- 3) Написать запрос проверки вставленных данных (Необходимо сравнить вставленные данные в таблицы и данные из созданных view (команда MINUS для Oracle )). 															
SELECT US_Realease_Dateilm, Director , Screenwritter , Producer, Budget, Rotten_Tomatoes , Metacritic 
FROM
(SELECT US_Realease_Dateilm, Director , Screenwritter , Producer, Budget, Rotten_Tomatoes , Metacritic 
FROM 2NF
UNION ALL  
SELECT US_Realease_Dateilm, Director , Screenwritter , Producer, Budget, Rotten_Tomatoes , Metacritic  
FROM 2NF_View
) data
GROUP BY US_Realease_Dateilm, Director , Screenwritter , Producer, Budget, Rotten_Tomatoes , Metacritic  
HAVING count(*)!=2;

SELECT Film
FROM
(SELECT Filn FROM 2NF_id_film
UNION ALL  
SELECT Film FROM 2NF_id_film_View) data
GROUP BY Film
HAVING count(*)!=2;
    

SELECT Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide
FROM
(SELECT Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide FROM 2NF_Box_office_gross
UNION ALL  
SELECT Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide FROM 2NF_Box_office_gross_View) data
GROUP BY Box_office_gross_US_and_Canada,Box_office_gross_Other_territories,Box_office_gross_Wordwide
HAVING count(*)!=2;
    
SELECT All_time_Ranking_US_and_Canada,All_time_Ranking_Worwide
FROM
(SELECT All_time_Ranking_US_and_Canada,All_time_Ranking_Worwide FROM 2NF_All_time_Ranking
UNION ALL  
SELECT All_time_Ranking_US_and_Canada,All_time_Ranking_Worwide FROM 2NF_All_time_Ranking_View) data
GROUP BY All_time_Ranking_US_and_Canada,All_time_Ranking_Worwidev
HAVING count(*)!=2;

-- 4) Создать запросы вставки данных в существующие таблицы из 2NF во 3NF.							
INSERT INTO 3NF_ID_F(Film)
SELECT DISTINCT Film
FROM 2NF_id_film;

INSERT INTO 3NF_ID_D(Director)
SELECT DISTINCT Director
FROM 2NF;

INSERT INTO 3NF_ID_P(Producer)
SELECT DISTINCT Producer
FROM 2NF;

INSERT INTO 3NF_ID_S(Screenwriter)
SELECT DISTINCT Screenwriter
FROM 2NF;

INSERT INTO 3NF_ALL_TIME_RANKING (ID_F,US_Canada,Worlwide)
SELECT DISTINCT ID_F,US_and_Canada,Worlwide
FROM 2NF_All_time_Ranking
JOIN 2NF_id_film;
 
INSERT INTO 3NF (ID_f, US_Release_dateilm, id_d,id_s,id_p,Budget,Rotten_Tomatoes,Metacritic)
SELECT DISTINCT ID_f, US_Release_dateilm, id_d,id_s,id_p,Budget,Rotten_Tomatoes,Metacritic
FROM 2NF_id_film
JOIN 2NF
JOIN 3NF_ID_D
JOIN 3NF_ID_S
JOIN 3NF_ID_P;




-- 7) Написать запрос удаления всех данных в таблицах для 2NF и 3NF.						
DELETE FROM 2NF;

DELETE FROM 2NF_id_film;

DELETE FROM 2NF_Box_office_gross;

DELETE FROM 2NF_All_time_Ranking;

DELETE FROM 3NF_ID_F;

DELETE FROM 3NF_ID_D;

DELETE FROM 3NF_ID_P;

DELETE FROM 3NF_ID_S;

DELETE FROM 3NF;

DELETE FROM 3NF_ALL_TIME_RANKING;


-- 8) Написать один запрос для проверки успешного выполнения пн.7 (см. Пн. 3)


SELECT * FROM 2NF, 2NF_id_film, 2NF_Box_office_gross,2NF_All_time_Ranking,3NF_ID_F,3NF_ID_D,3NF_ID_P,3NF_ID_S,3NF,3NF_ALL_TIME_RANKING;
				













