const express = require('express');
const cpControlador = require('../controlador/ClienteProductoControlador');
const router = express.Router();

router.get('/productos', cpControlador.todoProductos);

module.exports = router; 