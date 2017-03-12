DROP TABLE procedure_er;

CREATE TABLE procedure_er AS 
SELECT
provider_id,
measure_id,
CASE score
	WHEN 'Very High (60,000+ patients annually)' THEN 4
	WHEN 'High (40,000 - 59,999 patients annually)' THEN 3
	WHEN 'Medium (20,000 - 39,999 patients annually)' THEN 2
	WHEN 'Low (0 - 19,999 patients annually)' THEN 1
	ELSE CAST(score AS float)
END AS score
FROM
effective_care
WHERE
score != "Not Available"
;


-- not going to put in the readmission data for now 
-- need to figure out how to 

-- INSERT INTO procedure_er
-- SELECT 
-- provider_id,
-- measure_id,
-- CAST(score AS float)
-- FROM 
-- readmission
-- WHERE
-- score != "Not Available"
-- ;
