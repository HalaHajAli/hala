const mongoose = require('mongoose');
const PlannerModel = require('./Planner');

// Define the Package schema
const imagePageSchema = new mongoose.Schema({
  images: [String], // Array of image URLs
});

const detailsPageSchema = new mongoose.Schema({
  details: String, // Details about the package
});

const mainPageSchema = new mongoose.Schema({
  plannerName: String,
  eventName: String,
  location: String,
});

const packageSchema = new mongoose.Schema({
  name: String,
  price: String,
  planner: {
    type: mongoose.Schema.Types.ObjectId, // Change the type to ObjectId
    ref: 'Planner', // Reference to the Planner model
  },
  mainPage: mainPageSchema,
  imagePage: imagePageSchema,
  detailsPage: detailsPageSchema,
});

const PackageModel = mongoose.model('Package', packageSchema);

// Function to create a package for a specific planner
// async function createPackageForPlanner(username) {
//   try {
//     const planner = await PlannerModel.findOne({ username }); // Search by username

//     if (!planner) {
//       console.error('Planner not found');
//       return;
//     }

//     const newPackage = new PackageModel({
//       planner: planner._id, // Use the _id of the found planner
//       mainPage: {
//         plannerName: planner.username,
//         // Other main page details
//       },
//       // Other package details
//     });

//     const savedPackage = await newPackage.save();
//     console.log('Package created:', savedPackage);
//   } catch (error) {
//     console.error('Error creating Package:', error);
//   }
// }

module.exports = PackageModel;
//module.exports.createPackageForPlanner = createPackageForPlanner;
