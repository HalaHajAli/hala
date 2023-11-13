const mongoose = require('mongoose');

const User = require('./Shcema'); 
const { error } = require('console');

mongoose.connect('mongodb://localhost/App', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("connected to MongoDB"))
  .catch(err => console.error("Could not connect:", err));

const admin = new User({
  username: 'admin',
  password: 'adminpassword',
  email: 'admin@example.com',
  UserType: 'admin',
});

const user = new User({
  username: 'user',
  password: 'userpassword',
  email: 'user@example.com',
  UserType: 'user',
});

const planner = new User({
  username: 'planner',
  password: 'plannerpassword',
  email: 'planner@example.com',
  UserType: 'planner',
});

async function saveUsers() {
    try {
      await admin.save();
      await user.save();
      await planner.save();
      console.log('User records have been successfully saved.');
    } catch (error) {
      console.error('Error saving user records:', error);
    } 
    
    
    finally {
      mongoose.connection.close();
    }
  }
  