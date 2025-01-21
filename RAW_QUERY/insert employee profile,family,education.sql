
INSERT INTO employee_profile (employee_id, place_of_birth,date_of_birth, gender, is_married, prof_pict, created_by, updated_by, created_at, updated_at) 
VALUES 
    (1, 'Medan','1985-05-20', 'Laki-laki', TRUE, 'jeka_pic.jpg', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (2, 'Magetan','1982-02-10', 'Laki-laki', TRUE, 'suwardi_pic.jpg', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (3, 'Saint Dennis','1815-02-25', 'Laki-laki', TRUE, 'Arthur_pic.jpg', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (4, 'Dagestan','1988-08-12', 'Laki-laki', TRUE, 'Khabib_pic.jpg', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE);

INSERT INTO employee_family (employee_id, name, identifier, job, place_of_birth, date_of_birth, religion, is_life, is_divorced, relation_status, created_by, updated_by, created_at, updated_at) 
VALUES 
    (1, 'Siti Ropeah', '54321', 'Guru', 'Jakarta', '1985-05-20', 'Katolik', TRUE, FALSE, 'Istri', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (2, 'Laura', '98765', 'PNS', 'Bali', '1990-03-15', 'Katolik', TRUE, FALSE, 'Istri', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (3, 'Luna Maya', '11234', 'PNS', 'Bogor', '1992-07-25', 'Buddha', TRUE, FALSE, 'Istri', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (4, 'Rayanthi', '33456', 'Artist', 'Jakarta', '1988-11-30', 'Protestan', TRUE, FALSE, 'Istri', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (4, 'Suryanti', '44567', 'Pilot', 'Dagestan', '1998-08-12', 'Protestan', TRUE, FALSE, 'Anak', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE);

INSERT INTO education (employee_id, name, level, description, created_by, updated_by, created_at, updated_at) 
VALUES 
    (1, 'Universitas Negeri Jakarta', 'Strata 1', 'Sarjana', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (2, 'Universitas Gunadarma', 'Strata 2', 'Sarjana', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (3, 'Universitas Udayana', 'Doktor', 'Doktor', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE),
    (4, 'SMA Negeri 2 Rusia', 'SMA', 'Sekolah Menengah Atas', 'admin', 'admin', CURRENT_DATE, CURRENT_DATE);
