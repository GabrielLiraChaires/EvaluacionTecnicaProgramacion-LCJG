package com.inventario.Evaluacion_LCJG.repository;
import com.inventario.Evaluacion_LCJG.model.Movimiento;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IMovimientoRepository extends CrudRepository<Movimiento, Integer>
{

}