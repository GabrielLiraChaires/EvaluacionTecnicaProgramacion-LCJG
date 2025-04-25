package com.inventario.Evaluacion_LCJG.model;
import lombok.Data;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalidaAlmacen
{
   private List<SalidaProducto> productos;
   private Integer usuario;
}
