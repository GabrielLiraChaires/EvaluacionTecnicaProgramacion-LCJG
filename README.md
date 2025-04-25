# Sistema de Gestión de Inventario para Almacén

Aplicación Spring Boot para el control y administración de inventario en almacenes, con gestión de productos, visualización de movimientos y accesos por roles.

Vínculo al video demostrativo: https://drive.google.com/file/d/1VVKzFUh9hezJ43mu4VNUsYXjC-MG6KKy/view?usp=sharing

> **Nota:**  
> CSRF fue desactivado para agilizar las peticiones. SUGERIDO SOLO EN DESARROLLO POR SUPUESTO.  
> PasswordEncoder fue omitido para utilizar contraseñas de texto plano. Supuse que así lo solicitaron por la longitud de la cadena en la tabla del usuario, especificada en los requerimientos.

### 🛠️ Entorno de desarrollo
| Componente             | Versión               |
|------------------------|-----------------------|
| IDE                    | IntelliJ IDEA 2025    |
| Lenguaje               | Java 17               |
| Framework              | Spring Boot 3.4.5     |
| Gestor de dependencias | Maven                 |
| Sistema de BD          | SQL Server (SSMS 19)  |

## 🚀 Requisitos previos
- Java JDK 17 instalado.
- SQL Server con SSMS 19 configurado.
- Conexión a internet para descargar dependencias.

## 🗃️ Estructura de la base de datos
El sistema utiliza las siguientes tablas principales:
- `productos` (Información de elementos en inventario).
- `movimientos` (Entradas/salidas de almacén).
- `usuarios` (Gestión de accesos al sistema).
- `roles` (Manejo de roles de usuario).

## 🏁 Pasos para ejecutar la aplicación

### 1. Clonar el repositorio
git clone https://github.com/GabrielLiraChaires/EvaluacionTecnicaProgramacion-LCJG.git

### 2. Ejecutar el script de la base de datos (puede ser solo el esquema o el esquema con los datos, guarde ambas opciones en la carpeta 'SCRIPTS').

### 3. Abrir el proyecto con el gestor con los requisitos previos.

### 4. Ejecutar el proyecto.

### 5. Acceder a la siguiente ruta en el navegador http://localhost:8080 (esta configurada por defecto, en caso de que no verificarla).
