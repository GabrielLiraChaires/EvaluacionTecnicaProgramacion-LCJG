package com.inventario.Evaluacion_LCJG.repository;
import com.inventario.Evaluacion_LCJG.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface IUsuarioRepository extends JpaRepository<Usuario, Integer>
{
    Optional<Usuario> findByCorreo(String correo);
}