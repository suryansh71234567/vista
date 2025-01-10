const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config(); // For loading environment variables
const locationRoutes = require('./routes/locationRoutes'); // Import the routes

const app = express();
app.use(express.json()); // Middleware to parse JSON request bodies

const PORT = process.env.PORT || 3000;
const MONGO_URI = process.env.MONGO_URI || 'mongodb://localhost:27017/travel-expense-manager';


mongoose.connect('mongodb://127.0.0.1:27017/vista_aurora', {
    serverSelectionTimeoutMS: 10000
  }).then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('Error connecting to MongoDB:', err));

// Use the location routes
app.use('/api/location', locationRoutes);

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
