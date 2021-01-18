select CONCAT('T', LPAD(teacher.id,10, 0)) AS ID, 
    teacher.nickname AS  'Nickname', 
    CASE teacher.status
        WHEN 0 THEN 'discontinued'
        WHEN 1 THEN 'active'
        WHEN 2 THEN 'deactive'
    END AS 'Status',
    CASE teacher.role 
        WHEN 1 THEN 'trainer'
        WHEN 2 THEN 'assessor'
        WHEN 3 THEN 'staff'
        ELSE 'N/A'
    END AS 'Roles'
FROM trn_teacher as teacher
LEFT JOIN trn_teacher_role as 'role' 
ON teacher.id = role.teacher_id; 