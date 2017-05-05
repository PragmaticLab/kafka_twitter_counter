wget https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
unzip 6c902f45-e28b-42f5-9f96-ae9d1e583472\?content_type\=application%2Fzip\;\ charset\=binary

tail -n +2 Hospital\ General\ Information.csv > hospitals.csv
tail -n +2 Timely\ and\ Effective\ Care\ -\ Hospital.csv > effective_care.csv
tail -n +2 Readmissions\ and\ Deaths\ -\ Hospital.csv > readmission.csv 
tail -n +2 Measure\ Dates.csv > Measures.csv
tail -n +2 hvbp_hcahps_11_10_2016.csv > survey_responses.csv

hadoop fs -mkdir /user/w205/hospital_compare
hadoop fs -mkdir /user/w205/hospital_compare/hospitals 
hadoop fs -mkdir /user/w205/hospital_compare/effective_care
hadoop fs -mkdir /user/w205/hospital_compare/readmission
hadoop fs -mkdir /user/w205/hospital_compare/Measures
hadoop fs -mkdir /user/w205/hospital_compare/survey_responses

hadoop fs -put hospitals.csv /user/w205/hospital_compare/hospitals 
hadoop fs -put effective_care.csv /user/w205/hospital_compare/effective_care
hadoop fs -put readmission.csv /user/w205/hospital_compare/readmission
hadoop fs -put Measures.csv /user/w205/hospital_compare/Measures
hadoop fs -put survey_responses.csv /user/w205/hospital_compare/survey_responses
