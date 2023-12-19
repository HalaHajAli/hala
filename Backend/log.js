const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const User = require('../DataBase/User'); 
const User1 = require('../DataBase/User'); 

const Planner = require('../DataBase/Planner'); 

const app = express();
app.use(express.urlencoded({extended:true}));
app.use(express.json());
console.log("hello");

const { CLOSING } = require('ws');

// Existing code...

app.post('/login1', async (req, res) => {
  const { username, password } = req.body;
  try {
    const user = await User.findOne({ username });
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Compare passwords directly (for demonstration purposes only)
    if (user.password !== password) {
      return res.status(401).json({ message: 'Incorrect password' });
    }

    res.status(200).json({ message: 'Login successful', user });
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

// Existing code...

const PORT = 4001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

