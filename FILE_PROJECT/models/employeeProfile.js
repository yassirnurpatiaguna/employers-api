const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');  
const Employee = require('./employee'); 

const EmployeeProfile = sequelize.define('EmployeeProfile', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  employee_id: {
    type: DataTypes.INTEGER,
    references: {
      model: Employee, 
      key: 'id',
    },
    allowNull: false,
  },
  place_of_birth: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  date_of_birth: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  gender: {
    type: DataTypes.ENUM('Laki-laki', 'Perempuan'),
    allowNull: true,
  },
  is_married: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
  },
  prof_pict: {
    type: DataTypes.STRING(225),
    allowNull: true,
  },
  created_by: {
    type: DataTypes.STRING(225),
    allowNull: true,
  },
  updated_by: {
    type: DataTypes.STRING(225),
    allowNull: true,
  },
  created_at: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  },
  updated_at: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW,
  }
}, {
  tableName: 'employee_profile',
  timestamps: false,
});


module.exports = EmployeeProfile;
