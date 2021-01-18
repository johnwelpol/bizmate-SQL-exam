select teacher.id as 'ID', 
    teacher.nickname AS  'Nickname', 
    sum(case evaluation.result when 1 then 1 else 0 end) as "Open",
    sum(case evaluation.result when 3 then 1 else 0 end) as "Reserved",
    sum(case evaluation.result when 1 then 1 else 0 end) as "Taught",
    sum(case evaluation.result when 2 then 1 else 0 end) as "No Show"
FROM trn_teacher as teacher
LEFT JOIN trn_teacher_role as 'role' 
ON teacher.id = role.teacher_id; 
LEFT JOIN trn_time_table as 'time' 
ON teacher.id = time.teacher_id; 
LEFT JOIN trn_evaluation as 'evaluation' 
ON teacher.id = evaluation.teacher_id
GROUP BY teacher.id; 