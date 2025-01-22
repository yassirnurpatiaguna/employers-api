const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const rateLimiter = require('./middlewares/rateLimit');
const routes = require("./routes/");

const app = express();

// Middleware
app.use(helmet());
app.use(cors());
app.use(rateLimiter);
app.use(express.json())

// Routes
app.use("/api", routes);

module.exports = app;
