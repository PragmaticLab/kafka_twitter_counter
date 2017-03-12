-- first we need to create an aggregate / mean score for a hospital's survey score

DROP TABLE survey_aggregate;
CREATE TABLE survey_aggregate AS 
SELECT
provider_id,
(communication_nurse_achievement_points + 
	communication_doctor_achievement_points + 
	responsiveness_hospital_staff_achievement_points + 
	pain_mgmt_achievement_points + 
	communication_comm_med_achievement_points + 
	clean_quiet_achievement_points + 
	discharge_info_achievement_points + 
	overall_achievement_points) / 8.0 AS aggregate_achievement
FROM 
survey_er
;

-- survey_aggregate tells us a hospital's survey score
-- hospital_procedure_score tells us a hospital's procedure score
-- now we can figure out the correlation between survey and their procedures
SELECT 
corr(a.mean_normalized_score, b.aggregate_achievement)
FROM 
hospital_procedure_score a 
JOIN 
survey_aggregate b 
ON a.provider_id = b.provider_id
;

