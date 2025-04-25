package com.inventario.Evaluacion_LCJG.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                /*NOTAS:
                    * CSRF fue desactivado para agilizar las peticiones. SUGERIDO SOLO EN DESARROLLO POR SUPUESTO.
                    * PasswordEncoder fue omitido para utilizar contraseñas de texto plano. Supuse que así lo solicitaron por la longitud de la cadena en la tabla del usuario, especificada en los requerimientos.
                */
                .csrf(csrf -> csrf.disable())
                // Manejo los accesos del usuario según los roles.
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/login", "/styles/**", "/js/**", "/images/**", "/videos/**", "/error", "/error/**").permitAll()
                        // Rutas para Administrador.
                        .requestMatchers("/administrador/**").hasRole("Administrador")
                        // Rutas para Almacenista.
                        .requestMatchers("/almacenista/**").hasRole("Almacenista")
                        // Rutas comunes para ambos roles.
                        .requestMatchers("/inventario/**").hasAnyRole("Administrador", "Almacenista")
                        .anyRequest().authenticated()
                )
                // Configuro inicio y cierre de sesión, agregando así la redirección según el rol.
                .formLogin(form -> form
                        .loginPage("/login")
                        .usernameParameter("correo")
                        .passwordParameter("contrasena")
                        .defaultSuccessUrl("/redireccionar", false)
                        .failureHandler((request, response, exception) -> {
                            request.getSession().setAttribute("SPRING_SECURITY_LAST_EXCEPTION", exception);
                            response.sendRedirect("/login?error=true");
                        })
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                        .permitAll()
                )
                // Redirección al intentar navegar a vistas no permitidas para el rol
                .exceptionHandling(handling -> handling
                        .accessDeniedPage("/acceso/acceso-denegado")
                );

        return http.build();
    }

    // Almacena contraseñas en texto plano. Únicamente lo implementé para desarrollo. En producción es un alto riesgo de seguridad.
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence rawPassword) {
                return rawPassword.toString();
            }

            @Override
            public boolean matches(CharSequence rawPassword, String encodedPassword) {
                return rawPassword.toString().equals(encodedPassword); // Comparación simple
            }
        };
    }
}