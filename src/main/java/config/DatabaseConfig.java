package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import java.sql.DriverManager;
import java.sql.SQLException;

@Configuration
public class DatabaseConfig {

    @Bean
    public void registerJDBCDriver() {
        try {
            // Registra manualmente el driver de SQL Server.
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            System.out.println("¡Driver SQL Server registrado correctamente!");
        } catch (SQLException e) {
            System.err.println("Error al registrar el driver:");
            e.printStackTrace();
        }
    }
}