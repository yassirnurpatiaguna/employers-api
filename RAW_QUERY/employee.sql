CREATE TABLE employee (
    id SERIAL PRIMARY KEY,                       
    nik VARCHAR(255),                           
    name VARCHAR(255),                          
    is_active BOOLEAN,                           
    start_date DATE NOT NULL,                    
    end_date DATE NOT NULL,                      
    created_by VARCHAR(255),                     
    updated_by VARCHAR(255),                      
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE 
);