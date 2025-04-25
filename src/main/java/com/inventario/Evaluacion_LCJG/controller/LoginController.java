package com.inventario.Evaluacion_LCJG.controller;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController
{
    @GetMapping("/login")
    public String mostrarFormularioLogin(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout, Model model, HttpServletRequest request)
    {
        if (error != null)
        {
            AuthenticationException authEx = (AuthenticationException) request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");

            model.addAttribute("mensajeError", authEx.getMessage());
        }

        if (logout != null)
        {
            model.addAttribute("mensajeExito", "Sesión cerrada exitosamente");
        }

        return "login";
    }

    @GetMapping("/acceso/acceso-denegado")
    public String accesoDenegado()
    {
        return "errores/acceso-denegado";
    }
}