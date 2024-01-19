const mongoose = require('mongoose');
const plannerSchema = new mongoose.Schema({
  username: String,
  password: String,
  email: String,
  mobile: String,
});
const Planner = mongoose.model('Planner', plannerSchema);
let uri= 'mongodb+srv://shahdismail529:sz23112001@app.lvckeux.mongodb.net/?retryWrites=true&w=majority';
mongoose.connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('Connection error:', err));
  module.exports = Planner;
  async function createUser() {
    try {
      const user = new Planner({
        username: 'amr',
        password: '111', // Password will be hashed automatically due to the pre-save hook
        email: 'user@example.com',
        mobile: '1234567890',
      });
      const result = await user.save();
      console.log('User created:', result);
    } catch (error) {
      console.error('Error creating user:', error);
    }
  }