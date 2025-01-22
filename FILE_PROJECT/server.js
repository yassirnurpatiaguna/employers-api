const app = require("./app");
const sequelize = require("./config/sequelize");

const PORT = process.env.PORT || 3000;

// Sync database and start server
sequelize.sync({ force: false }) // Set to true to reset DB
  .then(() => {
    console.log("Database synced!");
    app.listen(PORT, () => {
      console.log(`Server is running on http://localhost:${PORT}`);
    });
  })
  .catch((err) => console.error("Unable to connect to the database:", err));
