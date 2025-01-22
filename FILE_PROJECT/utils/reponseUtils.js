const sendResponse = (res, statusCode, message, data = null, error = null) => {
  return res.status(statusCode).json({
    success: statusCode === 200 || statusCode === 201,
    message,
    data,
    error
  });
};

module.exports = {
  sendResponse
};
