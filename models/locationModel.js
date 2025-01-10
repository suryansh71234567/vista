const mongoose = require('mongoose');

// Define the schema for location details
const locationSchema = new mongoose.Schema({
    location: { type: String, required: true },
    specification: { type: String, required: true },
    images: [{ type: String }], // Array of image URLs
}, {
    timestamps: true // Automatically adds createdAt and updatedAt fields
});

// Create the model using the schema
const Location = mongoose.model('Location', locationSchema);

// Export the model for use in other parts of the project
module.exports = Location;
