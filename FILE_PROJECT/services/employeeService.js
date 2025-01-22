const { sequelize, Employee, EmployeeProfile, Education, EmployeeFamily } = require('../models/index');

exports.getAllEmployee = async () => {
  try {
    const employees = await Employee.findAll();
    if (!employees.length) {
      return { status: 'error', message: 'No employees found' };
    }
    return { status: 'success', data: employees };
  } catch (error) {
    console.error('Error fetching all employees:', error);
    return { status: 'error', message: 'Failed to fetch all employees' };
  }
};

exports.getDetailEmployee = async (employeeId) => {
  try {
    const employee = await Employee.findOne({
      where: { id: employeeId },
      include: [
        { model: EmployeeProfile, as: 'profile' },
        { model: Education, as: 'educations' },
        { model: EmployeeFamily, as: 'families' }
      ]
    });

    if (!employee) {
      return { status: 'error', message: 'Employee not found' };
    }

    return { status: 'success', data: employee };
  } catch (error) {
    console.error(`Error fetching details for employee ${employeeId}:`, error);
    return { status: 'error', message: 'Failed to fetch employee details' };
  }
};

exports.createEmployee = async (employeeData, profileData, educationData, familyData) => {
  const t = await sequelize.transaction();
  try {
    const { created_by, updated_by } = employeeData;
    const employee = await Employee.create(employeeData, { transaction: t });

    await EmployeeProfile.create({ ...profileData, employee_id: employee.id }, { transaction: t });
    await Education.bulkCreate(
      educationData.map((education) => ({
        ...education,
        created_by,
        updated_by,
        employee_id: employee.id
      })),
      { transaction: t }
    );
    await EmployeeFamily.bulkCreate(
      familyData.map((family) => ({
        ...family,
        created_by,
        updated_by,
        employee_id: employee.id
      })),
      { transaction: t }
    );

    await t.commit();
    return { status: 'success', message: 'Employee created successfully', data: employee };
  } catch (error) {
    await t.rollback();
    console.error('Error creating employee and related data:', error);
    return { status: 'error', message: 'Failed to create employee' };
  }
};

exports.updateEmployee = async (employeeId, employeeData, profileData, educationData = [], familyData = []) => {
  const t = await sequelize.transaction();
  try {
    const { updated_by } = employeeData;

    const employee = await Employee.findByPk(employeeId, { transaction: t });
    if (!employee) {
      return { status: 'error', message: `Employee with ID ${employeeId} not found` };
    }

    await employee.update(employeeData, { transaction: t });

    const profile = await EmployeeProfile.findOne({ where: { employee_id: employeeId }, transaction: t });
    if (profile) {
      await profile.update(profileData, { transaction: t });
    } else {
      await EmployeeProfile.create({ ...profileData, employee_id: employeeId }, { transaction: t });
    }

    if (educationData.length) {
      await Education.destroy({ where: { employee_id: employeeId }, transaction: t });
      await Education.bulkCreate(
        educationData.map((education) => ({
          ...education,
          updated_by,
          employee_id: employeeId
        })),
        { transaction: t }
      );
    }

    if (familyData.length) {
      await EmployeeFamily.destroy({ where: { employee_id: employeeId }, transaction: t });
      await EmployeeFamily.bulkCreate(
        familyData.map((family) => ({
          ...family,
          updated_by,
          employee_id: employeeId
        })),
        { transaction: t }
      );
    }

    await t.commit();
    return { status: 'success', message: 'Employee updated successfully', data: employee };
  } catch (error) {
    await t.rollback();
    console.error(`Error updating employee ${employeeId} and related data:`, error);
    return { status: 'error', message: 'Failed to update employee' };
  }
};

exports.deleteEmployee = async (employeeId) => {
  const t = await sequelize.transaction();
  try {
    const employee = await Employee.findByPk(employeeId, { transaction: t });
    if (!employee) {
      return { status: 'error', message: `Employee with ID ${employeeId} not found` };
    }

    await EmployeeFamily.destroy({ where: { employee_id: employeeId }, transaction: t });
    await Education.destroy({ where: { employee_id: employeeId }, transaction: t });
    await EmployeeProfile.destroy({ where: { employee_id: employeeId }, transaction: t });
    await employee.destroy({ transaction: t });

    await t.commit();
    return { status: 'success', message: 'Employee deleted successfully' };
  } catch (error) {
    await t.rollback();
    console.error(`Error deleting employee ${employeeId} and related data:`, error);
    return { status: 'error', message: 'Failed to delete employee' };
  }
};

exports.generateEmployeeReport = async () => {
  try {
    const query = `
      SELECT 
        e.id AS employee_id,
        e.nik,
        e.name,
        e.is_active,
        ep.gender,
        CONCAT(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM ep.date_of_birth), ' Years Old') AS age,
        ed.name AS school_name,
        ed.level,
        COALESCE(
          CONCAT(
            COUNT(CASE WHEN ef.relation_status = 'Istri' THEN 1 END), ' Istri', 
            CASE 
              WHEN COUNT(CASE WHEN ef.relation_status = 'Anak' THEN 1 END) > 0 
              THEN ' & ' 
              ELSE '' 
            END,
            COUNT(CASE WHEN ef.relation_status = 'Anak' THEN 1 END), ' Anak'
          ), '-'
        ) AS family_data
      FROM employee e
      LEFT JOIN employee_profile ep ON e.id = ep.employee_id
      LEFT JOIN education ed ON e.id = ed.employee_id
      LEFT JOIN employee_family ef ON e.id = ef.employee_id
      GROUP BY e.id, e.is_active, ep.gender, ep.date_of_birth, ed.name, ed.level
      ORDER BY e.id ASC;
    `;
    
    const [results] = await sequelize.query(query);
    if (!results.length) {
      return { status: 'error', message: 'No employee data found for the report' };
    }

    return { status: 'success', data: results };
  } catch (error) {
    console.error('Error generating employee report:', error);
    return { status: 'error', message: 'Failed to generate employee report' };
  }
};
