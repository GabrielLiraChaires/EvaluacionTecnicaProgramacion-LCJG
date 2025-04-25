package com.inventario.Evaluacion_LCJG.service;
import com.inventario.Evaluacion_LCJG.model.Producto;
import com.inventario.Evaluacion_LCJG.repository.IProductoRepository;
import com.inventario.Evaluacion_LCJG.repository.IMovimientoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.NoSuchElementException;
import com.inventario.Evaluacion_LCJG.model.Movimiento;
import java.util.List;
@Service
public class ProductoService
{
    private final IProductoRepository productoRepository;
    private final IMovimientoRepository movimientoRepository;

    @Autowired
    public ProductoService(IProductoRepository productoRepository, IMovimientoRepository movimientoRepository)
    {
        this.productoRepository = productoRepository;
        this.movimientoRepository = movimientoRepository;
    }

    @Transactional(readOnly = true)
    public Iterable<Producto> obtenerTodosProductos()
    {
        return productoRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<Producto> obtenerTodosProductosActivos() {
        return productoRepository.buscarEstatus("Activo");
    }

    @Transactional
    public Producto agregarProducto(Producto producto)
    {
        //Asignando los atributos por default.
        producto.setCantidad(0);
        producto.setEstatus("Activo");
        //Guardando el producto nuevo.
        return productoRepository.save(producto);
    }

    @Transactional
    public Producto actualizarCantidad(Integer productoId, Integer entrada, Integer idUsuario)
    {
        //Buscando el producto.
        Producto producto = productoRepository.findById(productoId).orElseThrow(() -> new NoSuchElementException("Producto no encontrado con ID: " + productoId));
        //Calculando el total de productos con la nueva entrada.
        int diferencia = entrada + producto.getCantidad();

        //Actualizando y guardando el movimiento.
        if(diferencia > 0)
        {
            Movimiento movimiento = new Movimiento();
            movimiento.setFkIdproducto(productoId);
            movimiento.setTipoMovimiento("Entrada");
            movimiento.setCantidad(entrada);
            movimiento.setUsuario(idUsuario);
            movimientoRepository.save(movimiento);
        }
        producto.setCantidad(diferencia);
        return productoRepository.save(producto);
    }

    @Transactional
    public Producto actualizarEstatusProducto(Integer id)
    {
        //Buscando el producto.
        Producto producto = productoRepository.findById(id).orElseThrow(() -> new NoSuchElementException("Producto no encontrado con ID: " + id));
        //Invertiendo el estatus.
        producto.setEstatus(producto.getEstatus().equals("Activo") ? "Inactivo" : "Activo");
        return productoRepository.save(producto);
    }
}
