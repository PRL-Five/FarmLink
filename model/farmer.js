const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  id: { type:String, required: true }
});

const farmerCollection = mongoose.model('Farmers', userSchema);

module.exports = farmerCollection;
