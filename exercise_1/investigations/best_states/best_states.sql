-- we will reuse procedure_normalized from question 1 on the best hospitals

SELECT 
b.state,
AVG(a.score_normalized) AS mean_normalized_score
FROM 
procedure_normalized a 
JOIN 
hospital_er b 
ON a.provider_id = b.provider_id
GROUP BY
b.state
ORDER BY 
a.mean_normalized_score DESC 
LIMIT 10
;
