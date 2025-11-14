import express from 'express';
import Book from '../models/books.js';


const router = express.Router();

// register un libro
router.post('/books', async (req, res, next) => {
    try {
        const { title, author, year,gander, quantity } = req.body;

        // validar los campos requeridos
       if (!title || !author || !year || !gander || !quantity) {
        return res.status(400).json({
            ok: false,
            message: 'Todos los campos son obligatorios'
        });
       }
       // crear lainstancia de base de datos
       const book = await Book.create({ title, author, year, gander, quantity });
       // responder al cliente su peicion
         return res.status(201).json({
            ok: true,
           
            });
    }catch (error) {
        if (error && err.code === 11000) {
            return res.status(409).json({ ok: false, message: 'El libro ya esta' });
    }
    return next(error);

    }
});

// lEER UN BOOKS

module.exports = router;