package com.inventario.Evaluacion_LCJG.model;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "Movimientos")
@Data
public class Movimiento
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idMovimiento")
    private Integer idMovimiento;

    @Column(name = "fkIdProducto")
    private Integer fkIdproducto;

    @NotBlank(message = "El tipo de movimiento es obligatorio")
    @Pattern(regexp = "Entrada|Salida", message = "El tipo de movimiento debe ser 'Entrada' o 'Salida'")
    @Column(name = "tipoMovimiento")
    private String tipoMovimiento;

    @Min(value = 1, message = "La cantidad debe ser mayor a cero")
    @Column(name = "cantidad")
    private Integer cantidad;

    @Column(name = "fkIdUsuario")
    private Integer usuario;

    @Column(name = "fechaMovimiento")
    private LocalDateTime fechaMovimiento = LocalDateTime.now();
}
