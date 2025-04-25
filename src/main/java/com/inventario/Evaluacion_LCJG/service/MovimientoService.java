package com.inventario.Evaluacion_LCJG.service;
import com.inventario.Evaluacion_LCJG.model.DetalleMovimiento;
import com.inventario.Evaluacion_LCJG.model.Movimiento;
import com.inventario.Evaluacion_LCJG.model.Producto;
import com.inventario.Evaluacion_LCJG.model.SalidaProducto;
import com.inventario.Evaluacion_LCJG.repository.IDetalleMovimientoRepository;
import com.inventario.Evaluacion_LCJG.repository.IMovimientoRepository;
import com.inventario.Evaluacion_LCJG.repository.IProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class MovimientoService
{
    private final IDetalleMovimientoRepository detalleMovimientoRepository;
    private final IProductoRepository productoRepository;
    private final IMovimientoRepository movimientoRepository;

    @Autowired
    public MovimientoService(IDetalleMovimientoRepository detalleMovimientoRepository, IProductoRepository productoRepository,  IMovimientoRepository movimientoRepository)
    {
        this.detalleMovimientoRepository = detalleMovimientoRepository;
        this.productoRepository = productoRepository;
        this.movimientoRepository = movimientoRepository;
    }

    @Transactional(readOnly = true)
    public List<DetalleMovimiento> movimientosConProductoUsuario()
    {
        return detalleMovimientoRepository.movimientosConProductoUsuario();
    }

    @Transactional(readOnly = true)
    public List<DetalleMovimiento> filtrarPorTipo(String tipo)
    {
        return detalleMovimientoRepository.filtrarTipoMovimiento(tipo);
    }

    @Transactional
    public void procesarSalidas(List<SalidaProducto> salidas, Integer idUsuario)
    {
        try
        {
            for (SalidaProducto salida : salidas)
            {
                Producto producto = productoRepository.findById(salida.getId()).orElseThrow(() -> new RuntimeException("Producto no encontrado con ID: " + salida.getId()));

                if (salida.getCantidad() > producto.getCantidad())
                {
                    throw new RuntimeException("Stock insuficiente para el producto: " + producto.getNombre());
                }

                producto.setCantidad(producto.getCantidad() - salida.getCantidad());
                productoRepository.save(producto);

                Movimiento movimiento = new Movimiento();
                movimiento.setFkIdproducto(producto.getId());
                movimiento.setTipoMovimiento("Salida");
                movimiento.setCantidad(salida.getCantidad());
                movimiento.setUsuario(idUsuario);
                movimientoRepository.save(movimiento);
            }
        }
        catch (Exception e)
        {
            throw e; //Manejo en el controlador.
        }
    }
}