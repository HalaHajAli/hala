const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const app = express();
app.use(express.urlencoded({extended:true}));
app.use(express.json());
console.log("hello");
const User = require('../DataBase/User'); 
const { CLOSING } = require('ws');
console.log("hello");

app.get('/', (req, res) => {
  res.send('Welcome to the server!');
});
console.log("hello");




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

const PORT = 4001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
