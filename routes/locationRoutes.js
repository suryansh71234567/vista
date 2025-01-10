const express = require('express');
const Location = require('../models/locationModel'); // Import the Location model

const router = express.Router();

// POST Route: Save a new location
router.post('/save', async (req, res) => {
    try {
        const { location, specification, images } = req.body;

        // Validate required fields
        if (!location || !specification) {
            return res.status(400).json({ message: 'Location and Specification are required!' });
        }

        // Create a new Location document
        const newLocation = new Location({
            location,
            specification,
            images: images || [] // Default to an empty array if images are not provided
        });

        // Save the document to the database
        const savedLocation = await newLocation.save();
        res.status(201).json({
            message: 'Location saved successfully!',
            data: savedLocation
        });
    } catch (error) {
        console.error('Error saving location:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// GET Route: Retrieve all locations
router.get('/all', async (req, res) => {
    try {
        // Fetch all documents from the Location collection
        const locations = await Location.find();
        res.status(200).json(locations);
    } catch (error) {
        console.error('Error retrieving locations:', error);
        res.status(500).json({ message: 'Internal server error' });
    }
});

// Export the router
module.exports = router;
