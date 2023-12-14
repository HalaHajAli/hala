const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const User = require('../DataBase/User'); 

const Planner = require('../DataBase/Planner'); 

const app = express();
app.use(express.urlencoded({extended:true}));
app.use(express.json());
console.log("hello");

const { CLOSING } = require('ws');

app.get('/', (req, res) => {
  res.send('Welcome to the server!');
});



app.post('/login1', async (req, res) => {
  const { username, password } = req.body;
  console.log(req.body);
  console.log(username);

  try {
    const user = await User.findOne({ username });
    
    console.log("hello");
    
    console.log(user);
    console.log(user);
    console.log(user);

    if (!user) {
      console.log("hello");
      return res.status(404).json({ message: 'User not found' });
    }
console.log(user.password);
console.log(password);

    const validPassword = await bcrypt.compare(password, user.password);

    if (!validPassword) {
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
    // Check if the username already exists
    const existingUser = await Planner.findOne({ username });

    if (existingUser) {
      return res.status(400).json({ message: 'Username already exists' });
    }

    // Hash the password before storing it in the database
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user based on the AnotherUser schema
    const planner = new Planner({
      username,
      password: hashedPassword,
      email,
      mobile
      // Add other user properties as needed for AnotherUser schema
    });

    // Save the new user to the database
    await planner.save();

    res.status(201).json({ message: 'Registration successful', planner });
  } catch (error) {
    console.error('Registration error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

const PORT = 4001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
