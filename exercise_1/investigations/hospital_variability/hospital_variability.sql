-- first we standardize the scores across from procedures
-- standardize meaning: (x - min) / (max - min)

DROP TABLE measure_standardization_stats;
CREATE TABLE measure_standardization_stats AS 
SELECT
measure_id,
MIN(score) AS score_min,
MAX(score) AS score_max 
FROM
procedure_er
GROUP BY 
measure_id
;


DROP TABLE procedure_standardized;
CREATE TABLE procedure_standardized AS 
SELECT
a.measure_id AS measure_id,
(a.score - b.score_min) / (b.score_max - b.score_min) AS score_standardized
FROM 
procedure_er a 
JOIN
measure_standardization_stats b 
ON a.measure_id = b.measure_id
;


-- then we select the measures with the highest variance
SELECT
a.measure_id,
b.measure_name,
a.var 
FROM 
(SELECT 
measure_id, 
variance(score_standardized) AS var 
FROM procedure_standardized 
GROUP BY measure_id) a 
JOIN 
measures_er b
ON a.measure_id = b.measure_id
ORDER BY a.var desc
LIMIT 10
;

