const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');  // Import the shared sequelize instance


const Employee = require('./employee');
const EmployeeProfile = require('./employeeProfile');
const Education = require('./education');
const EmployeeFamily = require('./employeeFamily');


Employee.hasOne(EmployeeProfile, { foreignKey: 'employee_id', as: 'profile' });
Employee.hasMany(Education, { foreignKey: 'employee_id', as: 'educations' });
Employee.hasMany(EmployeeFamily, { foreignKey: 'employee_id', as: 'families' });


EmployeeProfile.belongsTo(Employee, { foreignKey: 'employee_id', as: 'profile' });
Education.belongsTo(Employee, { foreignKey: 'employee_id', as: 'employee' });
EmployeeFamily.belongsTo(Employee, { foreignKey: 'employee_id', as: 'employee' });


module.exports = { sequelize, Employee, EmployeeProfile, Education, EmployeeFamily };
