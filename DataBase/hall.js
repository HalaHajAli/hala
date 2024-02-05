const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  username: String,
  date: String,
  time: String,
  max: String, // admin, user, planner.
});

// Replace the connection URI with your own MongoDB URI
const uri = 'mongodb+srv://shahdismail529:sz23112001@app.lvckeux.mongodb.net/?retryWrites=true&w=majority';

mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("Connected to MongoDB"))
  .catch(err => console.error("Connection error:", err));

const Hall = mongoose.model('Hall', userSchema);

async function createUser() {
  const hall = new Hall({
    username: 'Gardens',
    date: '12-10-2024',
    time: '6-8',
    max: '400',
  });

  try {
    const result = await hall.save();
    console.log(result);
  } catch (error) {
    console.error("Error creating user:", error);
  }
}

createUser();

module.exports = Hall;
