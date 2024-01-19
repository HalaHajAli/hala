const mongoose = require('mongoose');
const bookedOfferSchema = new mongoose.Schema({
  plannername: String,
  username: String,
  packagename: String,
  color: String,
  food: String,
  date: String,
  time: String,
});

const bookOffer = mongoose.model('bookedOffer', bookedOfferSchema);

let uri =
  'mongodb+srv://shahdismail529:sz23112001@app.lvckeux.mongodb.net/?retryWrites=true&w=majority';

mongoose
  .connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('Connection error:', err));

module.exports = bookOffer;

async function createUser() {
  try {
    const bookOfferInstance = new bookOffer({
      plannername: 'hala',
      username: 'shahd',
      packagename: 'summer2024',
      color: 'red', // assuming red is a string
      food: 'lemon w n3n3',
      date: '2024-09-30 00:00:00.000',
      time: '6-8 PM',
    });

    const result = await bookOfferInstance.save();
    console.log('User created:', result);
  } catch (error) {
    console.error('Error creating user:', error);
  }
}

// Call the function to create a user
//createUser();
