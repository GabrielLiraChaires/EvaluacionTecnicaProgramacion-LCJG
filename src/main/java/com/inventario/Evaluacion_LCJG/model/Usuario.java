package com.inventario.Evaluacion_LCJG.model;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import java.util.Collection;
import java.util.Arrays;

@Entity
@Table(name = "Usuarios")
@Data
public class Usuario implements UserDetails
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private Integer idUsuario;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "correo")
    private String correo;

    @Column(name = "contrasena")
    private String contrasena;

    @ManyToOne
    @JoinColumn(name = "fkIdRol", referencedColumnName = "id")
    private Rol rol;

    @Column(name = "estatus")
    private String estatus;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        // Asumiendo que this.rol.getDescripcion() devuelve "Administrador" o "Almacenista".
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_" + this.rol.getDescripcion()));
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    @Override
    public String getPassword() {
        return contrasena;
    }

    @Override
    public String getUsername() {
        return correo;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return estatus.equals("Activo");
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return estatus.equals("Activo");
    }
}