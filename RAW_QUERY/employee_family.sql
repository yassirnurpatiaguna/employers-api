CREATE TABLE employee_family (
    id SERIAL PRIMARY KEY,                       
    employee_id INT NOT NULL,                   
    name VARCHAR(225),                            
    identifier VARCHAR(225),                     
    job VARCHAR(255),                            
    place_of_birth VARCHAR,                          
    date_of_birth DATE,                         
    religion VARCHAR(20) CHECK (religion IN ('Islam', 'Katolik', 'Buddha', 'Protestan', 'Konghucu')), 
    is_life BOOLEAN,                             
    is_divorced BOOLEAN,                         
    relation_status VARCHAR(50) CHECK (relation_status IN ('Suami', 'Istri', 'Anak', 'Anak Sambung')), 
    created_by VARCHAR(225),                    
    updated_by VARCHAR(255),                   
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_employee_family FOREIGN KEY (employee_id) REFERENCES employee (id)
);