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
  const Planner = mongoose.model('Planner', userSchema);// class 

async function creatuser(){
   
    const planner = new Planner({
        username: 'planner',
        password: 'plannerpassword',
        email: 'planner@example.com',
        UserType: 'planner',
      });
        
  const result= await planner.save();
  console.log(result);
}
creatuser();



module.exports = Planner; 





