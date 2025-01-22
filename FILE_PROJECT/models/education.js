const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize'); 

const Education = sequelize.define('Education', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  employee_id: {
    type: DataTypes.INTEGER,
    references: {
      model: 'Employee',  
      key: 'id',
    },
    allowNull: false,
  },
  name: {
    type: DataTypes.STRING(255),
    allowNull: true,
  },
  level: {
    type: DataTypes.ENUM('TK', 'SD', 'SMP', 'SMA', 'Strata 1', 'Strata 2', 'Doktor', 'Profesor'),
  },
  description: {
    type: DataTypes.STRING(255),
    allowNull: false,
  },
  created_by: {
    type: DataTypes.STRING(225),
    allowNull: false,
  },
  updated_by: {
    type: DataTypes.STRING(225),
    allowNull: false,
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
  tableName: 'education',
  timestamps: false,
});


module.exports = Education;
