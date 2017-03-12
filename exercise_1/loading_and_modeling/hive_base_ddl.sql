DROP TABLE hospital;
CREATE EXTERNAL TABLE hospital
(
	provider_id int,
	hospital_name string,
	address string,
	city string,
	state string, 
	zip int,
	county string,
	phone int,
	hospital_type string,
	hospital_ownership string,
	emergency_services string,
	meets_criteria string,
	overall_rating string,
	overall_rating_footnote string,
	mortality_national_comparison string,
	mortality_national_comparison_footnote string,
	safety_care_national_comparison string,
	safety_care_national_comparison_footnote string,
	readmission_national_comparison string,
	readmission_national_comparison_footnote string,
	patient_experience_national_comparison string,
	patient_experience_national_comparison_footnote string,
	effectiveness_care_national_comparison string,
	effectiveness_care_national_comparison_footnote string,
	timeliness_care_national_comparison string,
	timeliness_care_national_comparison_footnote string,
	efficient_medical_imaging_national_comparison string,
	efficient_medical_imaging_national_comparison_footnote string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   'separatorChar' = ",",
   'quoteChar'     = '"',
   'escapeChar'    = "\\"
)  
STORED AS TEXTFILE
LOCATION 'hdfs:///user/w205/hospital_compare/hospitals/';


DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care
(
	provider_id int,
	hospital_name string,
	address string,
	city string,
	state string, 
	zip int,
	county string,
	phone int,
	condition string,
	measure_id string,
	measure_name string,
	score string,
	sample string,
	footnote string,
	measure_start string,
	measure_end string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   'separatorChar' = ",",
   'quoteChar'     = '"',
   'escapeChar'    = "\\"
)  
STORED AS TEXTFILE
LOCATION 'hdfs:///user/w205/hospital_compare/effective_care/';


DROP TABLE readmission;
CREATE EXTERNAL TABLE readmission
(
	provider_id int,
	hospital_name string,
	address string,
	city string,
	state string, 
	zip int,
	county string,
	phone int,
	measure_name string,
	measure_id string,
	compared_to_national string, 
	denominator string,
	score string,
	lower_estimate string,
	higher_estimate string,
	footnote string,
	measure_start string,
	measure_end string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   'separatorChar' = ",",
   'quoteChar'     = '"',
   'escapeChar'    = "\\"
)  
STORED AS TEXTFILE
LOCATION 'hdfs:///user/w205/hospital_compare/readmission/';


DROP TABLE measures;
CREATE EXTERNAL TABLE measures
(
	measure_name string,
	measure_id string,
	measure_start_quarter string,
	measure_start_date string,
	measure_end_quarter string, 
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   'separatorChar' = ",",
   'quoteChar'     = '"',
   'escapeChar'    = "\\"
)  
STORED AS TEXTFILE
LOCATION 'hdfs:///user/w205/hospital_compare/Measures/';


DROP TABLE survey_responses;
CREATE EXTERNAL TABLE survey_responses
(
	provider_id int,
	hospital_name string,
	address string,
	city string,
	state string,
	zip int,
	county string,
	communication_nurses_floor string,
	communication_nurse_achievement_threshold string,
	communication_nurse_benchmark string,
	communication_nurse_baseline_rate string,
	communication_nurse_performance_rate string,
	communication_nurse_achievement_points string,
	communication_nurse_improvement_points string,
	communication_nurse_dimension_score string,
	communication_doctor_floor string,
	communication_doctor_achievement_threshold string,
	communication_doctor_benchmark string,
	communication_doctor_baseline_rate string,
	communication_doctor_performance_rate string,
	communication_doctor_achievement_points string,
	communication_doctor_improvement_points string,
	communication_doctor_dimension_score string,
	responsiveness_hospital_staff_floor string,
	responsiveness_hospital_staff_achievement_threshold string,
	responsiveness_hospital_staff_benchmark string,
	responsiveness_hospital_staff_baseline_rate string,
	responsiveness_hospital_staff_performance_rate string,
	responsiveness_hospital_staff_achievement_points string,
	responsiveness_hospital_staff_improvement_points string,
	responsiveness_hospital_staff_dimension_score string,
	pain_mgmt_floor string,
	pain_mgmt_achievement_threshold string,
	pain_mgmt_benchmark string,
	pain_mgmt_baseline_rate string,
	pain_mgmt_performance_rate string,
	pain_mgmt_achievement_points string,
	pain_mgmt_improvement_points string,
	pain_mgmt_dimension_score string,
	communication_comm_med_floor string,
	communication_comm_med_achievement_threshold string,
	communication_comm_med_benchmark string,
	communication_comm_med_baseline_rate string,
	communication_comm_med_performance_rate string,
	communication_comm_med_achievement_points string,
	communication_comm_med_improvement_points string,
	communication_comm_med_dimension_score string,
	clean_quiet_floor string,
	clean_quiet_achievement_threshold string,
	clean_quiet_benchmark string,
	clean_quiet_baseline_rate string,
	clean_quiet_performance_rate string,
	clean_quiet_achievement_points string,
	clean_quiet_improvement_points string,
	clean_quiet_dimension_score string,
	discharge_info_floor string,
	discharge_info_achievement_threshold string,
	discharge_info_benchmark string,
	discharge_info_baseline_rate string,
	discharge_info_performance_rate string,
	discharge_info_achievement_points string,
	discharge_info_improvement_points string,
	discharge_info_dimension_score string,
	overall_floor string,
	overall_achievement_threshold string,
	overall_benchmark string,
	overall_baseline_rate string,
	overall_performance_rate string,
	overall_achievement_points string,
	overall_improvement_points string,
	overall_dimension_score string,
	hcahps_base_score int,
	hcahps_consistency_score int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   'separatorChar' = ",",
   'quoteChar'     = '"',
   'escapeChar'    = "\\"
)  
STORED AS TEXTFILE
LOCATION 'hdfs:///user/w205/hospital_compare/survey_responses/';

