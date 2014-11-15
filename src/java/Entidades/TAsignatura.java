/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author Nuria
 */
public class TAsignatura {

    private String  idasignatura;
    private String  nombre;
    private Integer credito;
    private Integer horasteorica;
    private Integer horaspractica;
    private Integer horaslaboratorio;
    private Integer totalhoras;
    private String  ciclo;
    private Integer estado;

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
     * @return the credito
     */
    public Integer getCredito() {
        return credito;
    }

    /**
     * @param credito the credito to set
     */
    public void setCredito(Integer credito) {
        this.credito = credito;
    }

    /**
     * @return the horasteorica
     */
    public Integer getHorasteorica() {
        return horasteorica;
    }

    /**
     * @param horasteorica the horasteorica to set
     */
    public void setHorasteorica(Integer horasteorica) {
        this.horasteorica = horasteorica;
    }

    /**
     * @return the horaspractica
     */
    public Integer getHoraspractica() {
        return horaspractica;
    }

    /**
     * @param horaspractica the horaspractica to set
     */
    public void setHoraspractica(Integer horaspractica) {
        this.horaspractica = horaspractica;
    }

    /**
     * @return the horaslaboratorio
     */
    public Integer getHoraslaboratorio() {
        return horaslaboratorio;
    }

    /**
     * @param horaslaboratorio the horaslaboratorio to set
     */
    public void setHoraslaboratorio(Integer horaslaboratorio) {
        this.horaslaboratorio = horaslaboratorio;
    }

    /**
     * @return the totalhoras
     */
    public Integer getTotalhoras() {
        return totalhoras;
    }

    /**
     * @param totalhoras the totalhoras to set
     */
    public void setTotalhoras(Integer totalhoras) {
        this.totalhoras = totalhoras;
    }

    /**
     * @return the ciclo
     */
    public String getCiclo() {
        return ciclo;
    }

    /**
     * @param ciclo the ciclo to set
     */
    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
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
