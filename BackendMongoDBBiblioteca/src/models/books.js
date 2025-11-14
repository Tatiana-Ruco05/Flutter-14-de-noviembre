import  mongoose from 'mongoose';

const bookSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  author: {
    type: String,
    required: true,
  },
  yaer: {
    type: String,
    required: false,
  },
  gender: {
    type: String,
    required: false,
  },
   stock: {
    type: Number,
    required: true,
  },
});
export default mongoose.model('Book', bookSchema);