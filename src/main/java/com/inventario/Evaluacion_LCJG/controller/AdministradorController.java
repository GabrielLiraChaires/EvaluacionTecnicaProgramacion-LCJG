package com.inventario.Evaluacion_LCJG.controller;
import com.inventario.Evaluacion_LCJG.model.DetalleMovimiento;
import com.inventario.Evaluacion_LCJG.model.Producto;
import com.inventario.Evaluacion_LCJG.service.ProductoService;
import com.inventario.Evaluacion_LCJG.service.MovimientoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/administrador")
public class AdministradorController {

    private final ProductoService productoService;
    private final MovimientoService movimientoService;

    @Autowired
    public AdministradorController(ProductoService productoService, MovimientoService movimientoService)
    {
        this.productoService = productoService;
        this.movimientoService = movimientoService;
    }

    // 1. Mapeo para el dashboard principal.
    @GetMapping("/dashboard")
    public String dashboard()
    {
        return "administrador/dashboard";
    }

    // 2. Mapeo para la gestión de productos.
    @GetMapping("/productos")
    public String listarProductos(Model model)
    {
        model.addAttribute("productos", productoService.obtenerTodosProductos());

        if (!model.containsAttribute("producto"))
        {
            model.addAttribute("producto", new Producto());
        }
        return "administrador/productos";
    }

    // 3. Guardar nuevos productos.
    @PostMapping("/productos/guardar")
    public String guardarProducto(@Valid @ModelAttribute Producto producto, BindingResult result, RedirectAttributes redirect)
    {
        if (result.hasErrors())
        {
            redirect.addFlashAttribute("org.springframework.validation.BindingResult.producto", result);
            redirect.addFlashAttribute("producto", producto);
            redirect.addFlashAttribute("hasErrors", true);
            return "redirect:/administrador/productos";
        }

        productoService.agregarProducto(producto);
        redirect.addFlashAttribute("success", "Producto creado exitosamente!");
        return "redirect:/administrador/productos";
    }

    // 4. Dar entrada de productos.
    @PutMapping("/productos/entrada/{productoId}/{entrada}/{idUsuario}")
    @ResponseBody
    public ResponseEntity<?> actualizarCantidad(@PathVariable int productoId, @PathVariable int entrada, @PathVariable int idUsuario)
    {
        try
        {
            Producto productoActualizado = productoService.actualizarCantidad(productoId, entrada, idUsuario);
            return ResponseEntity.ok().body(Map.of(
                    "success", "Cantidad actualizada correctamente",
                    "producto", productoActualizado
            ));
        }
        catch (Exception e)
        {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", e.getMessage()));
        }
    }

    // 5. Cambiar el estatus de los productos.
    @PutMapping("/productos/cambiarEstatus/{id}")
    @ResponseBody
    public ResponseEntity<?> cambiarEstatus(@PathVariable Integer id)
    {
        try {
            Producto productoActualizado = productoService.actualizarEstatusProducto(id);
            return ResponseEntity.ok().body(Map.of(
                    "success", "Estatus actualizado correctamente",
                    "producto", productoActualizado
            ));
        }
        catch (Exception e)
        {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", e.getMessage()));
        }
    }

    // 6. Mostrar el histórico de movimientos con opción de filtrar por tipo
    @GetMapping("/movimientos")
    public String listarMovimientos(@RequestParam(required = false) String tipo, Model model)
    {
        List<DetalleMovimiento> movimientos;

        if (tipo != null && !tipo.isEmpty())
        {
            movimientos = movimientoService.filtrarPorTipo(tipo);
        }
        else
        {
            movimientos = movimientoService.movimientosConProductoUsuario();
        }

        model.addAttribute("movimientos", movimientos);
        model.addAttribute("tipoSeleccionado", tipo);
        return "administrador/movimientos";
    }

}