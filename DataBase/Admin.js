const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  username: String,
  password: String,
  email: String,
  UserType: String, // admin, user, planner.
});

// Replace the connection URI with your own MongoDB URI
const uri = 'mongodb+srv://shahdismail529:sz23112001@app.lvckeux.mongodb.net/?retryWrites=true&w=majority';

mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected to MongoDB"))
  .catch(err => console.error("Connection error:", err));

const Admin = mongoose.model('Admin', userSchema);

async function createUser() {
  const admin = new Admin({
    username: 'admin',
    password: 'adminpassword',
    email: 'admin@example.com',
    UserType: 'admin',
  });

  try {
    const result = await admin.save();
    console.log(result);
  } catch (error) {
    console.error("Error creating user:", error);
  }
}

createUser();

module.exports = Admin;
