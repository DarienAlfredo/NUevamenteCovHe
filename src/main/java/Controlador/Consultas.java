package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Consultas extends Conexion {

    public boolean auntenticarUsuario(Usuario usuario) {
        try {
            PreparedStatement pst = null;
            ResultSet rs = null;
            String sql = "select * from usuarios where nomUsuario = ? and contrasennia = ?";

            pst = getConnection().prepareStatement(sql);

            pst.setString(1, usuario.getNomUsuario());
            pst.setString(2, usuario.getContrasennia());

            rs = pst.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
            } catch (SQLException e) {
            }
        }

        return false;

    }

    public Usuario consultarUsuario(String nomUsuario, String contrasennia) {

        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "select * from usuarios where nomUsuario = ? and contrasennia = ?;";
        Usuario usuario = new Usuario();
        try {
            pst = getConnection().prepareStatement(sql);

            pst.setString(1, nomUsuario);
            pst.setString(2, contrasennia);
            rs = pst.executeQuery();

            if (rs.next()) {
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setNomUsuario(rs.getString("nomUsuario"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasennia(rs.getString("contrasennia"));
                usuario.setIdTipo(rs.getInt("idTipoUsuario"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }

        return usuario;
    }

    public ArrayList<Publicacion> publicaciones() {
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Publicacion> publicaciones = new ArrayList<>();
        String sql = "call obtenerPublicaciones()";
        try {
            pst = getConnection().prepareStatement(sql);

            rs = pst.executeQuery();
            
            while (rs.next()){
                Publicacion publicacion = new Publicacion();
                publicacion.setId(Integer.parseInt(rs.getString("id")));
                publicacion.setTitulo(rs.getString("titulo"));
                publicacion.setContenido(rs.getString("contenido"));
                publicacion.setFecha(rs.getString("fecha"));
                publicacion.setUsuario(rs.getString("nomUsuario"));
                publicaciones.add(publicacion);
            }
            
        } catch (Exception e) {
            System.err.println(e);
        }

        return publicaciones;
    }
    
    public ArrayList<Comentario> comentarios(int idPublicacion) {
         PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Comentario> comentarios = new ArrayList<>();
        String sql = "call obtenerComentarios(?)";
        try {
            pst = getConnection().prepareStatement(sql);
            pst.setInt(1, idPublicacion);
            rs = pst.executeQuery();
            
            while (rs.next()){
                Comentario comentario = new Comentario();
                comentario.setUsuario(rs.getString("nomUsuario"));
                comentario.setFecha(rs.getString("fecha"));
                comentario.setContenido(rs.getString("contenido"));
                comentarios.add(comentario);
            }
            
        } catch (Exception e) {
            System.err.println(e);
        }

        return comentarios;
    }
    
}
