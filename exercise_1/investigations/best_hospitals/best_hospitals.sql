-- we first need to standardize all procedure scores (convert to z-score)

DROP TABLE measure_normalization_stats;
CREATE TABLE measure_normalization_stats AS 
SELECT
measure_id,
AVG(score) AS score_mean,
VARIANCE(score) AS score_var
FROM
procedure_er
GROUP BY 
measure_id
;


DROP TABLE procedure_normalized;
CREATE TABLE procedure_normalized AS 
SELECT
a.provider_id AS provider_id,
(a.score - b.score_mean) / b.score_var AS score_normalized
FROM 
procedure_er a 
JOIN
measure_normalization_stats b 
ON a.measure_id = b.measure_id
;


-- now we calculate the mean normalized score of a hospital across procedures
DROP TABLE hospital_procedure_score;
CREATE TABLE hospital_procedure_score AS 
SELECT 
provider_id,
AVG(score_normalized) AS mean_normalized_score
FROM 
procedure_normalized
GROUP BY
provider_id
ORDER BY 
mean_normalized_score DESC;


-- grab the top 10 hospitals
SELECT 
a.provider_id,
b.hospital_name,
a.mean_normalized_score
FROM 
hospital_procedure_score a 
JOIN 
hospital_er b 
ON a.provider_id = b.provider_id
ORDER BY a.mean_normalized_score DESC
LIMIT 10
;
