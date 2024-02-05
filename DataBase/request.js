const mongoose = require('mongoose');
const requestSchema = new mongoose.Schema({
  Ocassion: String,
  decoration : String,
  placeOrlocation: String,
  guestnumber: String,
  salary:String,
});
const Requestt = mongoose.model('request', requestSchema);
let uri= 'mongodb+srv://shahdismail529:sz23112001@app.lvckeux.mongodb.net/?retryWrites=true&w=majority';
mongoose.connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('Connection error:', err));
  module.exports = Requestt;
  async function createUser() {
    try {
      const user = new request({
        Ocassion: "حفلة تخرج",
        decoration : "اسود ",
        placeOrlocation: "نابلس-بيت ايبا",
        guestnumber: "100",
        salary:"6000",
      });
      const result = await user.save();
      console.log('User created:', result);
    } catch (error) {
      console.error('Error creating user:', error);
    }
  }
  //createUser();