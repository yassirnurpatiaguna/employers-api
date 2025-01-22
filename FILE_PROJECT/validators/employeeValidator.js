
const { body } = require('express-validator');


const validateEmployeeId = body('employee_id')
  .isInt({ min: 1 }).withMessage('Employee ID must be a positive number')
  .notEmpty().withMessage('Employee ID is required');

const validateEmployeeData = [
  body('employeeData.nik').optional().isString().trim().escape().isInt({ min: 1 }).withMessage('NIK must be a positive number'),
  body('employeeData.name').optional().isString().trim().escape(),
  body('employeeData.is_active').isBoolean(),
  body('employeeData.start_date').notEmpty().withMessage('employeeData start_date is required').isISO8601().withMessage('Start Date must be in ISO 8601 format'),
  body('employeeData.end_date').notEmpty().withMessage('employeeData end_date is required').isISO8601().withMessage('End Date must be in ISO 8601 format')
];

const validateProfileData = [
  body('profileData.place_of_birth').optional().isString().trim().escape(),
  body('profileData.date_of_birth').optional().isISO8601(),
  body('profileData.gender').optional().isString().trim().escape().isIn(['Laki-laki', 'Perempuan']),
  body('profileData.is_married').optional().isBoolean()
];

const validateEducationData = [
  body('educationData').isArray().withMessage('Education Data must be an array'),
  body('educationData.*.name').optional().isString().trim().escape(),
  body('educationData.*.level').isString().trim().escape().isIn(['TK', 'SD', 'SMP', 'SMA', 'Strata 1', 'Strata 2', 'Doktor', 'Profesor']),
  body('educationData.*.description').notEmpty().withMessage('educationData description is required').isString().trim().escape()
];

const validateFamilyData = [
  body('familyData').isArray().withMessage('Family Data must be an array'),
  body('familyData.*.name').isString().trim().escape(),
  body('familyData.*.identifier').isString().trim().escape().isInt({ min: 1 }).withMessage('Family member identifier must be a positive number'),
  body('familyData.*.job').optional().isString().trim().escape(),
  body('familyData.*.place_of_birth').optional().isString().trim().escape(),
  body('familyData.*.date_of_birth').optional().isISO8601(),
  body('familyData.*.religion').optional().isString().trim().escape().isIn(['Islam', 'Katolik', 'Buddha', 'Protestan', 'Konghucu']),
  body('familyData.*.is_life').optional().isBoolean(),
  body('familyData.*.is_divorced').optional().isBoolean(),
  body('familyData.*.relation_status').optional().isString().trim().escape().isIn(['Suami', 'Istri', 'Anak', 'Anak Sambung'])
];

module.exports = {
  validateEmployeeId,
  validateEmployeeData,
  validateProfileData,
  validateEducationData,
  validateFamilyData
};
