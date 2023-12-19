const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const mongoose = require('mongoose');

const app = express();
const PORT = 4001; 
const User = require('../DataBase/Planner'); 
app.use(bodyParser.json());
app.post('/register', async (req, res) => {
  const { email, username, password, phoneNumber, userType, isDesigner } = req.body;

  try {
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user instance
    const newUser = new User({
      username,
      password: hashedPassword,
      email,
      phoneNumber,
      
    });

    // Save the new user to the database
    await newUser.save();

    // Respond with a success message
    res.status(200).json({ message: 'Registration successful' });
  } catch (error) {
    console.error('Error during registration:', error);
    res.status(500).json({ error: 'Registration failed' });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
