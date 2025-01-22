const employeeService = require('../services/employeeService');
const { query, validationResult } = require('express-validator');
const { sendResponse } = require('../utils/reponseUtils');
const { validateEmployeeId, validateEmployeeData, validateProfileData, validateEducationData, validateFamilyData } = require('../validators/employeeValidator');

exports.getEmployee = async (req, res) => {
  try {
    const employee = await employeeService.getAllEmployee(req.query);
    sendResponse(res, 200, 'Employees fetched successfully', employee);
  } catch (err) {
    sendResponse(res, 500, 'Internal server error', null, err.message);
  }
};

exports.getDetailEmployee = [
  validateEmployeeId,

  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return sendResponse(res, 400, 'Validation failed', null, errors.array());
      }

      const employeeId = req.body.employee_id;
      const employeeDetail = await employeeService.getDetailEmployee(employeeId);

      if (employeeDetail.status === 'error') {
        return sendResponse(res, 404, employeeDetail.message, null); 
      }

      return sendResponse(res, 200, 'Employee detail fetched successfully', employeeDetail.data); // Send data if successful

    } catch (err) {
      sendResponse(res, 500, 'Internal server error', null, err.message); // Handle internal server errors
    }
  }
];

exports.createEmployee = [
  ...validateEmployeeData,
  ...validateProfileData,
  ...validateEducationData,
  ...validateFamilyData,

  async (req, res) => {
    try {
      
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return sendResponse(res, 400, 'Validation failed', null, errors.array());
      }

      const { employeeData, profileData, educationData, familyData } = req.body;
      const newEmployee = await employeeService.createEmployee(employeeData, profileData, educationData, familyData);

      sendResponse(res, 201, 'Employee created successfully', newEmployee);
    } catch (err) {
      console.error('Error creating employee:', err);
      sendResponse(res, 500, 'Internal server error', null, err.message);
    }
  }
];

exports.updateEmployee = [
  validateEmployeeId, 
  ...validateEmployeeData,
  ...validateProfileData,
  ...validateEducationData,
  ...validateFamilyData,

  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return sendResponse(res, 400, 'Validation failed', null, errors.array());
      }

      const { employee_id } = req.body; 
      const updatedEmployeeData = req.body;
      const updatedEmployee = await employeeService.updateEmployee(employee_id, updatedEmployeeData);

      if (!updatedEmployee) {
        return sendResponse(res, 404, 'Employee not found', null);
      }

      sendResponse(res, 200, 'Employee updated successfully', updatedEmployee);
    } catch (err) {
      sendResponse(res, 500, 'Internal server error', null, err.message);
    }
  }
];


exports.deleteEmployee = [
  validateEmployeeId,  // Validate employee_id

  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return sendResponse(res, 400, 'Validation failed', null, errors.array());
      }

      const { employee_id } = req.body; // Get the employee_id from the request
      const result = await employeeService.deleteEmployee(employee_id);

      if (!result) {
        return sendResponse(res, 404, 'Employee not found', null);
      }

      sendResponse(res, 200, 'Employee deleted successfully', null);
    } catch (err) {
      sendResponse(res, 500, 'Internal server error', null, err.message);
    }
  }
];

exports.getEmployeeReport = [
  query('start_date').optional().isDate().withMessage('Invalid start date format'),
  query('end_date').optional().isDate().withMessage('Invalid end date format'),

  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }
      
      const { start_date, end_date } = req.query;
      const reportData = await employeeService.generateEmployeeReport(start_date, end_date);

      res.status(200).json({
        success: true,
        message: 'Employee report generated successfully',
        data: reportData
      });
    } catch (err) {
      console.error('Error generating employee report:', err);
      res.status(500).json({ error: err.message });
    }
  }
];
