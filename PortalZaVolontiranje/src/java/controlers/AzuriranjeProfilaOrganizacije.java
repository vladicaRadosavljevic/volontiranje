/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import beans.Organizacija;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author Korisnik
 */
@ManagedBean
@SessionScoped
public class AzuriranjeProfilaOrganizacije {
    
    private int mesto;
    private String email;
    private String tekst;
    private int oblasti;
    private String webAdresa;
    private String lozinka;
    private String ulicaIBroj;
    private String telefon;
    private boolean jpNaziv;
    private boolean jpMesto;
    private boolean jpPib;
    private boolean jpTekst;
    private boolean jpOblast;
    private boolean jpWebAdresa;
    private boolean jpUlicaIBroj;
    private boolean jpTelefon;

    public int getMesto() {
        return mesto;
    }

    public void setMesto(int mesto) {
        this.mesto = mesto;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTekst() {
        return tekst;
    }

    public void setTekst(String tekst) {
        this.tekst = tekst;
    }

    public int getOblasti() {
        return oblasti;
    }

    public void setOblasti(int oblasti) {
        this.oblasti = oblasti;
    }

    public String getWebAdresa() {
        return webAdresa;
    }

    public void setWebAdresa(String webAdresa) {
        this.webAdresa = webAdresa;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getUlicaIBroj() {
        return ulicaIBroj;
    }

    public void setUlicaIBroj(String ulicaIBroj) {
        this.ulicaIBroj = ulicaIBroj;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public boolean isJpNaziv() {
        return jpNaziv;
    }

    public void setJpNaziv(boolean jpNaziv) {
        this.jpNaziv = jpNaziv;
    }

    public boolean isJpMesto() {
        return jpMesto;
    }

    public void setJpMesto(boolean jpMesto) {
        this.jpMesto = jpMesto;
    }

    public boolean isJpPib() {
        return jpPib;
    }

    public void setJpPib(boolean jpPib) {
        this.jpPib = jpPib;
    }

    public boolean isJpTekst() {
        return jpTekst;
    }

    public void setJpTekst(boolean jpTekst) {
        this.jpTekst = jpTekst;
    }

    public boolean isJpOblast() {
        return jpOblast;
    }

    public void setJpOblast(boolean jpOblast) {
        this.jpOblast = jpOblast;
    }

    public boolean isJpWebAdresa() {
        return jpWebAdresa;
    }

    public void setJpWebAdresa(boolean jpWebAdresa) {
        this.jpWebAdresa = jpWebAdresa;
    }

    public boolean isJpUlicaIBroj() {
        return jpUlicaIBroj;
    }

    public void setJpUlicaIBroj(boolean jpUlicaIBroj) {
        this.jpUlicaIBroj = jpUlicaIBroj;
    }

    public boolean isJpTelefon() {
        return jpTelefon;
    }

    public void setJpTelefon(boolean jpTelefon) {
        this.jpTelefon = jpTelefon;
    }
    
    
    private Organizacija organizacijaZaAzuriranje;

    public Organizacija getOrganizacijaZaAzuriranje() {
        return organizacijaZaAzuriranje;
    }

    public void setOrganizacijaZaAzuriranje(Organizacija organizacijaZaAzuriranje) {
        this.organizacijaZaAzuriranje = organizacijaZaAzuriranje;
    }

   
    
    
    
    public Organizacija dohvatiPodatkeOOrganizaciji(){
        try {
            Connection conn = DriverManager.getConnection(db.DB.connectionString, db.DB.user, db.DB.pass);
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select o.*, tg.*, obl.* from Organizacija o\n" +
"      left join oblasti obl on o.oblast_id = obl.idoblasti\n" +
"      left join tblgrad tg on o.mesto_id = tg.id \n" +
"       where email = 'suma@yahoo.com'");
            rs.next();
            organizacijaZaAzuriranje = new Organizacija();
            organizacijaZaAzuriranje.setEmail(rs.getString("email"));
            organizacijaZaAzuriranje.setLozinka(rs.getString("lozinka"));
            organizacijaZaAzuriranje.setIdOrganizacija(rs.getInt("idorganizacija"));
            organizacijaZaAzuriranje.setIdoblasti(rs.getInt("oblast_id"));
            organizacijaZaAzuriranje.setJpMestoId(rs.getBoolean("jpmesto_id"));
            organizacijaZaAzuriranje.setWebAdresa(rs.getString("web_adresa"));
            organizacijaZaAzuriranje.setUlica_broj(rs.getString("ulica_broj"));
            organizacijaZaAzuriranje.setText(rs.getString("tekst"));
            organizacijaZaAzuriranje.setPib(rs.getInt("pib"));
            organizacijaZaAzuriranje.setTelefon(rs.getString("kontakt_tel"));
            organizacijaZaAzuriranje.setNaziv(rs.getString("naziv"));
            organizacijaZaAzuriranje.setJpNaziv(rs.getBoolean("jpnaziv"));
            organizacijaZaAzuriranje.setJpPib(rs.getBoolean("jppib"));
            organizacijaZaAzuriranje.setJpTelefon(rs.getBoolean("jpkontakt_telefon"));
            organizacijaZaAzuriranje.setJpOblast_delovanja(rs.getBoolean("jpoblast_id"));
            organizacijaZaAzuriranje.setJpText(rs.getBoolean("jptekst"));
            organizacijaZaAzuriranje.setJpWebAdresa(rs.getBoolean("jpweb_adresa"));
            organizacijaZaAzuriranje.setJpUlica_broj(rs.getBoolean("jpulica_broj"));
            organizacijaZaAzuriranje.setMesto(rs.getInt("mesto_id"));
            
            
            
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(AzuriranjeProfilaOrganizacije.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return organizacijaZaAzuriranje;
    }
    
}