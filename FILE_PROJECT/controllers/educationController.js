const educationService = require('../services/educationService');

exports.getEducation = async (req, res) => {
  try {
    const education = await educationService.getAllEducation(req.query);
    res.json(education);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

