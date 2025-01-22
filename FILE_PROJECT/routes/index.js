const express = require('express');
const router = express.Router();
const educationsRoutes = require('./educationRoutes');
const employeeRoutes = require('./employeeRoutes'); 

router.use('/educations', educationsRoutes);
router.use('/employees', employeeRoutes);

router.get('/', (req, res) => {
    res.send('Welcome to the API!');
});

module.exports = router;
