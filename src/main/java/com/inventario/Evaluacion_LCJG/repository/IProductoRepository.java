package com.inventario.Evaluacion_LCJG.repository;
import com.inventario.Evaluacion_LCJG.model.Producto;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import org.springframework.data.repository.query.Param;

import org.springframework.data.jpa.repository.Query;
@Repository
public interface IProductoRepository extends CrudRepository<Producto, Integer>
{
    @Query("SELECT p FROM Producto p WHERE p.estatus = :estatus")
    List<Producto> buscarEstatus(@Param("estatus") String estatus);
}
