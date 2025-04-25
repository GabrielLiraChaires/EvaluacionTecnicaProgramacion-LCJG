package com.inventario.Evaluacion_LCJG.controller;
import org.springframework.stereotype.Controller;
import com.inventario.Evaluacion_LCJG.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inventario")
public class InventarioController {

    private final ProductoService productoService;

    @Autowired
    public InventarioController(ProductoService productoService)
    {
        this.productoService = productoService;
    }

    @GetMapping
    public String mostrarInventario(Model model)
    {
        model.addAttribute("productos", productoService.obtenerTodosProductos());
        return "inventario/inventario";
    }
}
