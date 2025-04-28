const dbService = require('./bd/Conexion');
class ClienteProductoModelo{
    static async todoProducto(pagina = 1) {
        const limite = 50;  // Número máximo de productos por página
        const offset = (pagina - 1) * limite;  // Calculamos el offset para la paginación
        const query = `SELECT * FROM productos ORDER BY idProducto ASC LIMIT ${limite} OFFSET ${offset}`;
        try {
          return await dbService.query(query);
        } catch (err) {
          throw new Error(`Error al obtener los productos: ${err.message}`);
        }
}
}
module.exports = ClienteProductoModelo;