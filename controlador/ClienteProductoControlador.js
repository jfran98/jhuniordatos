const modelo = require('../modelo/ClienteProductoModelo');
class ClienteProductoControlador {
    static async todoProductos(req, res) {
        try {
          const producto = await modelo.todoProducto();
          res.json(producto);
        } catch (err) {
          res.status(500).json({ error: 'Hubo un error al obtener los Productos' });
        }
}
}

module.exports = ClienteProductoControlador;