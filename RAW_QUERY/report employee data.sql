SELECT 
    e.id AS employee_id,
    e.nik,
    e.name,
    e.is_active,
    ep.gender,
    CONCAT(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM ep.date_of_birth), ' Years Old') AS age,
    ed.name AS school_name,
    ed.level,
    CASE
        WHEN COUNT(CASE WHEN ef.relation_status = 'Istri' THEN 1 END) > 0 
             OR COUNT(CASE WHEN ef.relation_status = 'Anak' THEN 1 END) > 0 THEN
            CONCAT(
                CASE 
                    WHEN COUNT(CASE WHEN ef.relation_status = 'Istri' THEN 1 END) > 0 
                    THEN CONCAT(COUNT(CASE WHEN ef.relation_status = 'Istri' THEN 1 END), ' Istri')
                    ELSE ''
                END,
                CASE 
                    WHEN COUNT(CASE WHEN ef.relation_status = 'Istri' THEN 1 END) > 0 
                         AND COUNT(CASE WHEN ef.relation_status = 'Anak' THEN 1 END) > 0 
                    THEN ' & '
                    ELSE ''
                END,
                CASE 
                    WHEN COUNT(CASE WHEN ef.relation_status = 'Anak' THEN 1 END) > 0 
                    THEN CONCAT(COUNT(CASE WHEN ef.relation_status = 'Anak' THEN 1 END), ' Anak')
                    ELSE ''
                END
            )
        ELSE '-'
    END AS family_data
FROM employee e
LEFT JOIN employee_profile ep ON e.id = ep.employee_id
LEFT JOIN education ed ON e.id = ed.employee_id
LEFT JOIN employee_family ef ON e.id = ef.employee_id
GROUP BY 
    e.id, e.is_active, ep.gender, ep.date_of_birth, ed.name, ed.level
order by
	e.id ASC;
