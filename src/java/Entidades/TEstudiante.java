/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.Date;

/**
 *
 * @author Nuria
 */
public class TEstudiante {
    
    private Integer idestudiante;
    private String codigo;
    private String nombre;
    private String apellidos;
    private String dni;
    private Date fechanacimiento;
    private Integer estado;

    /**
     * @return the idestudiante
     */
    public Integer getIdestudiante() {
        return idestudiante;
    }

    /**
     * @param idestudiante the idestudiante to set
     */
    public void setIdestudiante(Integer idestudiante) {
        this.idestudiante = idestudiante;
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the direccion
     */
    public String getDni() {
        return dni;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDni(String direccion) {
        this.dni = direccion;
    }

    /**
     * @return the fechanacimiento
     */
    public Date getFechanacimiento() {
        return fechanacimiento;
    }

    /**
     * @param fechanacimiento the fechanacimiento to set
     */
    public void setFechanacimiento(Date fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    /**
     * @return the estado
     */
    public Integer getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(Integer estado) {
        this.estado = estado;
    }
}
