const { sequelize, Employee, EmployeeProfile, Education, EmployeeFamily } = require('./models/index');  


sequelize.sync({ force: false }) 
  .then(async () => {
    console.log('Models synced, starting test data creation...');
    
    // Create a new Employee record
    const newEmployee = await Employee.create({
      nik: '123456',
      name: 'John Doe',
      start_date: new Date(),
      end_date: new Date(),
      created_by: 'admin',
      updated_by: 'admin',
      created_at: new Date(),
      updated_at: new Date(),
    });

    console.log('Employee created:', newEmployee);

    // Create associated Employee Profile
    const profile = await EmployeeProfile.create({
      employee_id: newEmployee.id,
      place_of_birth: 'City A',
      date_of_birth: new Date('1990-01-01'),
      gender: 'Laki-laki',
      is_married: false,
      prof_pict: 'profile_picture.jpg',
      created_by: 'admin',
      updated_by: 'admin',
      created_at: new Date(),
      updated_at: new Date(),
    });

    console.log('Employee Profile created:', profile);

    // Create associated Education record
    const education = await Education.create({
      employee_id: newEmployee.id,
      name: 'University X',
      level: 'Strata 1',
      description: 'Bachelor in Computer Science',
      created_by: 'admin',
      updated_by: 'admin',
      created_at: new Date(),
      updated_at: new Date(),
    });

    console.log('Education record created:', education);

    // Create associated Family record
    const family = await EmployeeFamily.create({
      employee_id: newEmployee.id,
      name: 'Jane Doe',
      identifier: 'Family ID',
      job: 'Teacher',
      place_of_birth: 'City B',
      date_of_birth: new Date('1988-05-12'),
      religion: 'Islam',
      is_life: true,
      is_divorced: false,
      relation_status: 'Istri',
      created_by: 'admin',
      updated_by: 'admin',
      created_at: new Date(),
      updated_at: new Date(),
    });

    console.log('Family record created:', family);

    console.log('Test data created successfully!');
  })
  .catch((error) => {
    console.error('Error syncing models and creating test data:', error);
  });
