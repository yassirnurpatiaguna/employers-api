CREATE TABLE education (
    id SERIAL PRIMARY KEY,                       
    employee_id INT NOT NULL,                     
    name VARCHAR(255),                          
    level VARCHAR(50) CHECK (level IN ('TK', 'SD', 'SMP', 'SMA', 'Strata 1', 'Strata 2', 'Doktor', 'Profesor')), 
    description VARCHAR(255) NOT NULL,            
    created_by VARCHAR(225) NOT NULL,            
    updated_by VARCHAR(225) NOT NULL,            
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_employee_edu FOREIGN KEY (employee_id) REFERENCES employee (id)
);