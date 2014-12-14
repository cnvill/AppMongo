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
public class TMatricula {
    
    private Integer idmatricula;
    private String semestre;
    private Integer idestudiante;
    private Integer totalcreditos;
    private Date fechamatricula;
    private Integer estado;

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
     * @return the semestre
     */
    public String getSemestre() {
        return semestre;
    }

    /**
     * @param semestre the semestre to set
     */
    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

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
     * @return the totalcreditos
     */
    public Integer getTotalcreditos() {
        return totalcreditos;
    }

    /**
     * @param totalcreditos the totalcreditos to set
     */
    public void setTotalcreditos(Integer totalcreditos) {
        this.totalcreditos = totalcreditos;
    }

    /**
     * @return the fechamatricula
     */
    public Date getFechamatricula() {
        return fechamatricula;
    }

    /**
     * @param fechamatricula the fechamatricula to set
     */
    public void setFechamatricula(Date fechamatricula) {
        this.fechamatricula = fechamatricula;
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
