public class DriverTest {
    public static void main(String[] args) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("¡Driver cargado correctamente!");
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR: Driver no encontrado");
            e.printStackTrace();
        }
    }
}