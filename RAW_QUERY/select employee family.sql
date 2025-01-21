Select 
	ef.*
	from employee_family ef 
	join employee em on ef.employee_id = em.id
	where ef.employee_id = 4;