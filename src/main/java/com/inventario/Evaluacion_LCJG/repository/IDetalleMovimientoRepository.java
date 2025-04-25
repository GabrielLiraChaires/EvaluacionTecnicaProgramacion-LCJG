package com.inventario.Evaluacion_LCJG.repository;
import com.inventario.Evaluacion_LCJG.model.DetalleMovimiento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface IDetalleMovimientoRepository extends JpaRepository<DetalleMovimiento, Integer>
{
    @Query("SELECT dm FROM DetalleMovimiento dm JOIN FETCH dm.producto JOIN FETCH dm.usuario")
    List<DetalleMovimiento> movimientosConProductoUsuario();

    @Query("SELECT dm FROM DetalleMovimiento dm JOIN FETCH dm.producto p JOIN FETCH dm.usuario u WHERE dm.tipoMovimiento = :tipo")
    List<DetalleMovimiento> filtrarTipoMovimiento(String tipo);
}