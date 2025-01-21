CREATE TABLE employee_profile (
    id SERIAL PRIMARY KEY,                       
    employee_id INT NOT NULL,                   
    place_of_birth VARCHAR(255), 
    date_of_birth DATE NULL,                
    gender VARCHAR(20) CHECK (gender IN ('Laki-laki', 'Perempuan')), 
    is_married BOOLEAN,                         
    prof_pict VARCHAR(225),                      
    created_by VARCHAR(225),                     
    updated_by VARCHAR(225),                     
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee (id)
);