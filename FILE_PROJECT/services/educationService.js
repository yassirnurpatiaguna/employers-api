const Education = require('../models/education');



exports.getAllEducation = async () => {
  try {
    return await Education.findAll();
  } catch (error) {
    console.error('Error fetching all education records:', error);
    throw error;
  }
};

exports.addEducationEmployee = async (educationData) => {
  try {
    const { error, value } = EducationSchema.validate(educationData, { abortEarly: false });
    if (error) {
      const errorMessages = error.details.map((detail) => detail.message).join(', ');
      throw new Error(errorMessages);
    }

    return await Education.create(value);
  } catch (error) {
    console.error('Error adding education record:', error);
    throw error;
  }
};
