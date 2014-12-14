/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author Nuria
 */
public class TDetMatricula {
    
    private Integer iddetmatricula;
    private Integer idmatricula;
    private String idasignatura;
    private Integer estado;
    private Integer credito;

    public Integer getCredito() {
        return credito;
    }

    public void setCredito(Integer credito) {
        this.credito = credito;
    }
    /**
     * @return the iddetmatricula
     */
    public Integer getIddetmatricula() {
        return iddetmatricula;
    }

    /**
     * @param iddetmatricula the iddetmatricula to set
     */
    public void setIddetmatricula(Integer iddetmatricula) {
        this.iddetmatricula = iddetmatricula;
    }

    /**
     * @return the idmatricula
     */
    public Integer getIdmatricula() {
        return idmatricula;
    }

    /**
     * @param idmatricula the idmatricula to set
     */
    public void setIdmatricula(Integer idmatricula) {
        this.idmatricula = idmatricula;
    }

    /**
     * @return the idasignatura
     */
    public String getIdasignatura() {
        return idasignatura;
    }

    /**
     * @param idasignatura the idasignatura to set
     */
    public void setIdasignatura(String idasignatura) {
        this.idasignatura = idasignatura;
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
