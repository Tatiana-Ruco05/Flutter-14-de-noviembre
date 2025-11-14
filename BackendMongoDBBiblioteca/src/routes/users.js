import express from 'express';
import bcrypt from 'bcrypt';
import User from '../models/users.js';

const router = express.Router();

//metodo crear un nuevo usuario
router.post('/user', async (req, res, next) => {
  try {
    const { name, email, password } = req.body;
    // encriptamos la contraseña que enviamos en el body de la petición
    const hashed = await bcrypt.hash(password, 10);
    //creamos una instancia del modelo de la base de datos para primero poder agregar los valores necesarios 
    //y reemplaza por la contraseña encriptada
    const user = await User.create({ name, email, password: hashed });

    // ¡Responder y cortar ejecución!
    return res.status(201).json({
      ok: true,
      user: { id: user._id, name: user.name, email: user.email } // nunca envíes el hash
    });
  } catch (err) {
    // Duplicado de email (Mongo E11000)
    if (err && err.code === 11000) {
      return res.status(409).json({ ok: false, message: 'El email ya está registrado' });
    }
    return next(err);
  }
});

// B. Login de usuario
router.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    // 1. Validar que los campos no estén vacíos
    if (!email || !password) {
      return res.status(400).json({ message: "Correo y contraseña son obligatorios" });
    }

    // 2. Buscar el usuario por correo
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }

    // 3. Comparar la contraseña ingresada con la almacenada
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ message: "Contraseña incorrecta" });
    }

    // 4. Login exitoso → devolver solo datos necesarios
    res.status(200).json({
      message: "Inicio de sesión exitoso",
      user: {
        id: user._id,
        name: user.name,
        email: user.email
      }
    });
  } catch (error) {
    console.error("Error al iniciar sesión:", error);
    res.status(500).json({ message: "Error al iniciar sesión" });
  }
});



// B. Recuperar todos los usuarios
router.get('/users', async (req, res) => {
  try{
    const users = await User.find();
    res.json(users);   
  }catch(error){
    res.status(500).json({message: "Error al obtener usuario"})
  }
});

// d. obtener la información de 1 usuario especifico

router.get("/users/:id", (req, res) => {
  const { id } = req.params;
  User.findById(id)
    .then((data) => {
      if (!data) {
        return res.status(404).json({ message: "Usuario no encontrado" });
      }
      res.json(data);
    })
    .catch((error) => {
      console.error("Error al obtener usuario:", error.message);
      res.status(500).json({ message: "Error al obtener el usuario", error: error.message });
    });
});

//e. Eliminar un usuario

router.delete("/users/:id", (req, res) => {
  const { id } = req.params;
  User.deleteOne({ _id: id })
    .then((data) => res.json(data))
    .catch((error) => res.json({ message: error }));
});

// actualizar un usuario

router.put("/users/:id", (req, res) => {
  const { id } = req.params;
  const { name, age, email } = req.body;
  User.updateOne({ _id: id }, { $set: { name, age, email } })
    .then((data) => res.json(data))
    .catch((error) => res.json({ message: error }));
});



export default router; 
