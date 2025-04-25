package com.inventario.Evaluacion_LCJG.model;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Entity
@Table(name = "Roles")
@Data
public class Rol
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true, length = 60)
    @NotBlank(message = "La descripción es obligatoria")
    @Size(max = 60, message = "La descripción no puede exceder los 60 caracteres")
    private String descripcion;
}