DROP TABLE survey_er;

CREATE TABLE survey_er AS 
SELECT
provider_id,
CAST(SUBSTR(communication_nurse_achievement_points,0,1) AS int) AS communication_nurse_achievement_points,
CAST(SUBSTR(communication_doctor_achievement_points,0,1) AS int) AS communication_doctor_achievement_points,
CAST(SUBSTR(responsiveness_hospital_staff_achievement_points,0,1) AS int) AS responsiveness_hospital_staff_achievement_points,
CAST(SUBSTR(pain_mgmt_achievement_points,0,1) AS int) AS pain_mgmt_achievement_points,
CAST(SUBSTR(communication_comm_med_achievement_points,0,1) AS int) AS communication_comm_med_achievement_points,
CAST(SUBSTR(clean_quiet_achievement_points,0,1) AS int) AS clean_quiet_achievement_points,
CAST(SUBSTR(discharge_info_achievement_points,0,1) AS int) AS discharge_info_achievement_points,
CAST(SUBSTR(overall_achievement_points,0,1) AS int) AS overall_achievement_points
FROM
survey_responses
WHERE
communication_nurse_achievement_points != "Not Available"
AND communication_doctor_achievement_points != "Not Available"
AND responsiveness_hospital_staff_achievement_points != "Not Available"
AND pain_mgmt_achievement_points != "Not Available"
AND communication_comm_med_achievement_points != "Not Available"
AND clean_quiet_achievement_points != "Not Available"
AND discharge_info_achievement_points != "Not Available"
AND overall_achievement_points != "Not Available"
;
