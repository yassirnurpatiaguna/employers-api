const express = require("express");
const router = express.Router();
const employeeController = require('../controllers/employeeController');


router.get('/', employeeController.getEmployee);
router.post('/detail', employeeController.getDetailEmployee);
router.post('/create', employeeController.createEmployee);
router.post('/update', employeeController.updateEmployee); 
router.post('/delete', employeeController.deleteEmployee); 
router.get('/report', employeeController.getEmployeeReport); 

module.exports = router;
