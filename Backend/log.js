const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const User = require('../DataBase/User'); 
const User1 = require('../DataBase/User'); 
const nodemailer = require('nodemailer');
const Plan = require('../DataBase/Planner'); 
const BookedOffer = require('../DataBase/bookedOffer'); 
const Book = require('../DataBase/bookedOffer'); 
const Rev = require('../DataBase/rev'); // Assuming the Package model is exported as 'Package'
const  requestt= require('../DataBase/request'); // Assuming the Package model is exported as 'Package'

const Planner= require('../DataBase/Planner');
const Package = require('../DataBase/package'); 
const cors = require("cors");

const app = express();
app.use(express.urlencoded({extended:true}));
app.use(express.json());
console.log("hello");
app.use(cors());
const { CLOSING } = require('ws');

// Existing code...

app.post('/login1', async (req, res) => {
  const { username, password } = req.body;
  try {
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    if (user.password !== password) {
      return res.status(401).json({ message: 'Incorrect password' });
    }


    res.status(200).json({ message: 'Login successful', user });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});


app.post('/login2', async (req, res) => {
  const { username, password } = req.body;
  try {
    const planner = await Plan.findOne({ username });
    if (!planner) {
      return res.status(404).json({ message: 'User not found' });
    }

    if (planner.password !== password) {
      return res.status(401).json({ message: 'Incorrect password' });
    }


    res.status(200).json({ message: 'Login successful', planner });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.post('/register', async (req, res) => {
  const { username, password, email, mobile } = req.body;
  try {
    const existingUser = await User.findOne({ username });
    if (existingUser) {
      return res.status(400).json({ message: 'Username already exists' });
    }

    const user = new User({
      username,
      password, // Storing the password as is (not recommended in production)
      email,
      mobile
    });
    await user.save();
    res.status(201).json({ message: 'Registration successful', user });
  } catch (error) {
    console.error('Registration error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.post('/regplanner', async (req, res) => {
  const { username, password, email, mobile } = req.body;
  try {
    const existingUser = await Planner.findOne({ username });
    if (existingUser) {
      return res.status(400).json({ message: 'Username already exists' });
    }
    const user = new Planner({
      username,
      password, // Storing the password as is (not recommended in production)
      email,
      mobile
    });
    await user.save();
    res.status(201).json({ message: 'Registration successful', user });
  } catch (error) {
    console.error('Registration error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});


app.post('/login2/package', async (req, res) => {
  const { username, name, price, mainPage, imagePage, detailsPage } = req.body;

  try {
    const planner = await Plan.findOne({ username });

    if (!planner) {
      return res.status(404).json({ message: 'Planner not found' });
    }
    const newPackage = new Package({
      planner: planner._id, 
      name,
      price,
      mainPage,
      imagePage,
      detailsPage,
    });

    const savedPackage = await newPackage.save();
    console.log('Package created:', savedPackage);
    res.status(201).json({ message: 'Package created', package: savedPackage });
  } catch (error) {
    console.error('Error creating package:', error.message);
    res.status(500).json({ message: 'Error creating package', error: error.message });
  }
});


app.get('/login1/offer/:username', async (req, res) => {
  const { username } = req.params;
  
  try {
    const user = await User.findOne({ username });

    if (!user) {
      console.error('User not found');
      return res.status(404).json({ message: 'User not found' });
    }

    const userPackages = await Package.find({ });
    console.log(userPackages.length );

    if (userPackages.length === 0) {
      console.error('No packages found for this user');
      return res.status(404).json({ message: 'No packages found for this user' });
    }

    res.status(200).json({ packages: userPackages });
  } catch (error) {
    console.error('Error fetching user packages:', error.message);
    res.status(500).json({ message: 'Error fetching user packages', error: error.message });
  }
});



app.post('/bookedOffers', async (req, res) => {
  try {
    const {
      plannername,
      packagename,
      username,
      
      color,
      food,
      date,
      time,
    } = req.body;

    const newBooking = new BookedOffer({
      plannername,
      packagename,
      username,
      color,
      food,
      date,
      time,
    });

    const result = await newBooking.save();
    res.status(201).json(result);
  } catch (error) {
    console.error('Error creating booking:', error);
    res.status(500).send('Internal Server Error');
  }
});



app.get('/login2/request/', async (req, res) => {
  try {
    const bookings = await BookedOffer.find();

    if (!bookings || bookings.length === 0) {
      console.error('No bookings found');
      return res.status(404).json({ message: 'No bookings found' });
    }

    res.status(200).json({ bookings });
  } catch (error) {
    console.error('Error fetching bookings:', error.message);
    res.status(500).json({ message: 'Error fetching bookings', error: error.message });
  }
});





app.get('/login2/profile/:plannername', async (req, res) => {
  const { plannername } = req.params;
  console.log('Received request for planner:', plannername);

  try {
    // Adjust the field name to match your MongoDB document
    const planner = await Planner.findOne({ username: plannername });
    
    if (!planner) {
      console.error('Planner not found');
      return res.status(404).json({ message: 'Planner not found' });
    }

    console.log('Planner found:', planner);
    res.status(200).json({ planner });
  } catch (error) {
    console.error('Error fetching planner:', error.message);
    res.status(500).json({ message: 'Error fetching planner', error: error.message });
  }
});



app.get('/login1/profile/:username', async (req, res) => {
  const { username } = req.params;
  console.log('Received request for planner:', username);

  try {
    // Adjust the field name to match your MongoDB document
    const planner = await User.findOne({ username: username });
    
    if (!planner) {
      console.error('user not found');
      return res.status(404).json({ message: 'user not found' });
    }

    console.log('user found:', planner);
    res.status(200).json({ planner });
  } catch (error) {
    console.error('Error fetching user:', error.message);
    res.status(500).json({ message: 'Error fetching user', error: error.message });
  }
});














app.post('/login1/review', async (req, res) => {
  const { username, plannername, comment, star } = req.body;

  try {
    const review = new Rev({
      username,
      plannername,
      comment,
      star,
    });

    const savedReview = await review.save();
    console.log('Review created:', savedReview);
    res.status(201).json({ message: 'Review created', review: savedReview });
  } catch (error) {
    console.error('Error creating review:', error.message);
    res.status(500).json({ message: 'Error creating review', error: error.message });
  }
})

app.get('/login2/reviews', async (req, res) => {
  try {
    // Fetch all reviews
    const reviews = await Rev.find();
    console.log('All reviews fetched:', reviews);
    res.status(200).json({ message: 'All reviews fetched', reviews });
  } catch (error) {
    console.error('Error fetching reviews:', error.message);
    res.status(500).json({ message: 'Error fetching reviews', error: error.message });
  }
});


app.get('/login2/reviews', async (req, res) => {
  try {
    // Fetch all reviews
    const reviews = await Rev.find();
    console.log('All reviews fetched:', reviews);
    res.status(200).json({ message: 'All reviews fetched', reviews });
  } catch (error) {
    console.error('Error fetching reviews:', error.message);
    res.status(500).json({ message: 'Error fetching reviews', error: error.message });
  }
});


app.get('/grad', async (req, res) => {
  try {
    // Fetch all reviews
    const  requestt = await  requestt.find();
    console.log('All reviews fetched:', requestt);
    res.status(200).json({ message: 'All reviews fetched', requestt});
  } catch (error) {
    console.error('Error fetching reviews:', error.message);
    res.status(500).json({ message: 'Error fetching reviews', error: error.message });
  }
});







const PORT = 4001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});


