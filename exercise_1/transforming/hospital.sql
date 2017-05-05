DROP TABLE hospital_er;

CREATE TABLE hospital_er AS 
SELECT
provider_id,
hospital_name,
state
FROM
hospital;
