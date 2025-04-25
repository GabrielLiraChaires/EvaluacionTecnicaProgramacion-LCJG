package com.inventario.Evaluacion_LCJG.controller;
import com.inventario.Evaluacion_LCJG.service.MovimientoService;
import com.inventario.Evaluacion_LCJG.service.ProductoService;
import com.inventario.Evaluacion_LCJG.model.SalidaAlmacen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import java.util.Map;


@Controller
@RequestMapping("/almacenista")
public class AlmacenistaController
{
    private final ProductoService productoService;
    private final MovimientoService movimientoService;

    @Autowired
    public AlmacenistaController(ProductoService productoService, MovimientoService movimientoService)
    {
        this.productoService = productoService;
        this.movimientoService = movimientoService;
    }

    //1. Mapeo para el dashboard principal.
    @GetMapping("/dashboard")
    public String mostrarDashboard()
    {
        return "almacenista/dashboard";
    }

    // 2. Mapeo para la gestión de salidas de almacen.
    @GetMapping("/almacen")
    public String listarProductos(Model model)
    {
        model.addAttribute("productos", productoService.obtenerTodosProductosActivos());
        return "almacenista/almacen";
    }

    // 3. Guardar nuevas salidas de producto.
    @PostMapping("/productos/salida")
    public ResponseEntity<?> procesarSalidaProductos(@RequestBody SalidaAlmacen request)
    {
        try
        {
            movimientoService.procesarSalidas(request.getProductos(), request.getUsuario());
            return ResponseEntity.ok().body(Map.of("success", "Salida registrada exitosamente!"));
        }
        catch (Exception e)
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", e.getMessage()));
        }
    }
}
