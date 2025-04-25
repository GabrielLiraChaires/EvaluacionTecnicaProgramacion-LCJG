package com.inventario.Evaluacion_LCJG.model;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "Productos")
@Data
public class Producto
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "El nombre es obligatorio")
    @Size(max = 100, message = "El nombre no puede exceder los 100 caracteres")
    @Column(name = "nombre")
    private String nombre;

    @NotBlank(message = "La descripción es obligatoria")
    @Size(max = 200, message = "La descripción no puede exceder los 200 caracteres")
    @Column(name = "descripcion")
    private String descripcion;

    @Min(value = 0, message = "La cantidad no puede ser negativa")
    @Column(name = "cantidad")
    private Integer cantidad = 0;

    @Pattern(regexp = "Activo|Inactivo", message = "El estatus debe ser 'Activo' o 'Inactivo'")
    @Column(name = "estatus")
    private String estatus;

    @Column(name = "fechaRegistro")
    private LocalDateTime fechaRegistro = LocalDateTime.now();
}
