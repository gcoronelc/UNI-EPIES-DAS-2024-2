package pe.edu.uni.biblioteca.prueba;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Eric Gustavo Coronel Castillo
 * @blog www.desarrollasoftware.com
 * @email gcoronelc@gmail.com
 * @youtube www.youtube.com/DesarrollaSoftware
 * @facebook www.facebook.com/groups/desarrollasoftware/
 * @cursos gcoronelc.github.io
 */
public class GmailEmailSender {

	public static void main(String[] args) {
        // Configuración de propiedades para Gmail SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Credenciales de tu cuenta Gmail
        final String remitente = "egcc.uni@gmail.com"; // Tu correo
        final String password = "11111111111"; // Contraseña de aplicación generada

        // Crear sesión con autenticación
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(remitente, password);
            }
        });

        try {
            // Crear mensaje
            Message mensaje = new MimeMessage(session);
            mensaje.setFrom(new InternetAddress(remitente)); // Remitente
            mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse("ibeth.dextre.s@uni.pe")); // Destinatario
            mensaje.setSubject("Correo desde Java con Gmail"); // Asunto
            mensaje.setText("¡Hola! Este es un correo de prueba enviado desde una aplicación Java."); // Cuerpo del mensaje

            // Enviar mensaje
            Transport.send(mensaje);

            //System.out.println("Correo enviado exitosamente.");
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println("Error al enviar el correo.");
        }
    }
	
}
