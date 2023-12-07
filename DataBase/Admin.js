const mongoose = require('mongoose');
const userSchema = new mongoose.Schema({
  username: String,
  password: String,
  email: String,
  UserType: String, // admin, user, planner.
});


mongoose.connect('mongodb://127.0.0.1:27017/App', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected to MongoDB"))
  .catch(err => console.error("Connection error:", err));
  const User = mongoose.model('Admin', userSchema);// class 

async function creatuser(){
  const admin = new Admin({
    username: 'admin',
    password: 'adminpassword',
    email: 'admin@example.com',
    UserType: 'admin',
  });
  const result= await admin.save();
  console.log(result);
}
 
creatuser();





 module.exports = Admin; // Export the User model
