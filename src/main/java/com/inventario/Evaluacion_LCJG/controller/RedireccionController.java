package com.inventario.Evaluacion_LCJG.controller;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RedireccionController {

    @GetMapping("/redireccionar")
    public String redireccionar()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null)
        {
            if (auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_Administrador")))
            {
                return "redirect:/administrador/dashboard";
            }
            else if (auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_Almacenista")))
            {
                return "redirect:/almacenista/dashboard";
            }
        }
        return "redirect:/login?error=true";
    }
}