const mongoose = require('mongoose');

const connectdb = async () => {
  try {
    await mongoose.connect('mongodb+srv://soumyapaul132:soumya%402004@cluster0.9oxxh.mongodb.net/test', {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('MongoDB connected');
  } catch (err) {
    console.error('Database connection error:', err.message); // Print error message
    console.error('Full error object:', err); // Print full error object
    process.exit(1);
  }
};

module.exports = connectdb;




