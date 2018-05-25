/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.SelectItem;

/**
 *
 * @author Korisnik
 */
@ManagedBean
@SessionScoped
public class AzuriranjeProfilaVolonter {
  //  private String imePrezime;
    private Boolean jpIme;
  //  private Date datumRodjenja;
    private Boolean jpDatumRodjenja;
  //  private String pol;
    private Boolean jpPol;
    private SelectItem drzavljanstvo;
    private Boolean jpDrzavljanstvo;
    private String drzavljanstvoDrugo;
    private String telefon;
    private Boolean jpTelefon;
    private String ulica_broj;
    private Boolean jpAdresa;
    private SelectItem mesto;
    private Boolean jpMesto;
    private String mail;
    private String lozinka;
    private String slika;
    private Boolean jpSlika;
    private String cv;
    private Boolean jpCv;
    private String status;
    private Boolean jpStatus;
    private String kompanija;
    private String sedisteKompanije;
    private String pozicijaUKompaniji;
    private String nazivSkole;
    private String sedisteSkole;
    private String nivoStudija;
    private String godinaUpisa;
    private String[] odgovarajuciDani;
    private Boolean jpOdovarajuciDani;
    
    private String vestine;
    private Boolean jpVestine;
    private String vestineNaziv;
    private String vestineZvanje;
    private String vestineOstalo;
    private String vestineIskustva;
    private String zdravstveneNapomene;
    private Boolean jpZdravstveneNapomene;

    public Boolean getJpIme() {
        return jpIme;
    }

    public void setJpIme(Boolean jpIme) {
        this.jpIme = jpIme;
    }

    public Boolean getJpDatumRodjenja() {
        return jpDatumRodjenja;
    }

    public void setJpDatumRodjenja(Boolean jpDatumRodjenja) {
        this.jpDatumRodjenja = jpDatumRodjenja;
    }

    public Boolean getJpPol() {
        return jpPol;
    }

    public void setJpPol(Boolean jpPol) {
        this.jpPol = jpPol;
    }

    public SelectItem getDrzavljanstvo() {
        return drzavljanstvo;
    }

    public void setDrzavljanstvo(SelectItem drzavljanstvo) {
        this.drzavljanstvo = drzavljanstvo;
    }

    public Boolean getJpDrzavljanstvo() {
        return jpDrzavljanstvo;
    }

    public void setJpDrzavljanstvo(Boolean jpDrzavljanstvo) {
        this.jpDrzavljanstvo = jpDrzavljanstvo;
    }

    public String getDrzavljanstvoDrugo() {
        return drzavljanstvoDrugo;
    }

    public void setDrzavljanstvoDrugo(String drzavljanstvoDrugo) {
        this.drzavljanstvoDrugo = drzavljanstvoDrugo;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public Boolean getJpTelefon() {
        return jpTelefon;
    }

    public void setJpTelefon(Boolean jpTelefon) {
        this.jpTelefon = jpTelefon;
    }

    public String getUlica_broj() {
        return ulica_broj;
    }

    public void setUlica_broj(String ulica_broj) {
        this.ulica_broj = ulica_broj;
    }

    public Boolean getJpAdresa() {
        return jpAdresa;
    }

    public void setJpAdresa(Boolean jpAdresa) {
        this.jpAdresa = jpAdresa;
    }

    public SelectItem getMesto() {
        return mesto;
    }

    public void setMesto(SelectItem mesto) {
        this.mesto = mesto;
    }

    public Boolean getJpMesto() {
        return jpMesto;
    }

    public void setJpMesto(Boolean jpMesto) {
        this.jpMesto = jpMesto;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getSlika() {
        return slika;
    }

    public void setSlika(String slika) {
        this.slika = slika;
    }

    public Boolean getJpSlika() {
        return jpSlika;
    }

    public void setJpSlika(Boolean jpSlika) {
        this.jpSlika = jpSlika;
    }

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public Boolean getJpCv() {
        return jpCv;
    }

    public void setJpCv(Boolean jpCv) {
        this.jpCv = jpCv;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getJpStatus() {
        return jpStatus;
    }

    public void setJpStatus(Boolean jpStatus) {
        this.jpStatus = jpStatus;
    }

    public String getKompanija() {
        return kompanija;
    }

    public void setKompanija(String kompanija) {
        this.kompanija = kompanija;
    }

    public String getSedisteKompanije() {
        return sedisteKompanije;
    }

    public void setSedisteKompanije(String sedisteKompanije) {
        this.sedisteKompanije = sedisteKompanije;
    }

    public String getPozicijaUKompaniji() {
        return pozicijaUKompaniji;
    }

    public void setPozicijaUKompaniji(String pozicijaUKompaniji) {
        this.pozicijaUKompaniji = pozicijaUKompaniji;
    }

    public String getNazivSkole() {
        return nazivSkole;
    }

    public void setNazivSkole(String nazivSkole) {
        this.nazivSkole = nazivSkole;
    }

    public String getSedisteSkole() {
        return sedisteSkole;
    }

    public void setSedisteSkole(String sedisteSkole) {
        this.sedisteSkole = sedisteSkole;
    }

    public String getNivoStudija() {
        return nivoStudija;
    }

    public void setNivoStudija(String nivoStudija) {
        this.nivoStudija = nivoStudija;
    }

    public String getGodinaUpisa() {
        return godinaUpisa;
    }

    public void setGodinaUpisa(String godinaUpisa) {
        this.godinaUpisa = godinaUpisa;
    }

    public String[] getOdgovarajuciDani() {
        return odgovarajuciDani;
    }

    public void setOdgovarajuciDani(String[] odgovarajuciDani) {
        this.odgovarajuciDani = odgovarajuciDani;
    }

    public Boolean getJpOdovarajuciDani() {
        return jpOdovarajuciDani;
    }

    public void setJpOdovarajuciDani(Boolean jpOdovarajuciDani) {
        this.jpOdovarajuciDani = jpOdovarajuciDani;
    }

    public String getVestine() {
        return vestine;
    }

    public void setVestine(String vestine) {
        this.vestine = vestine;
    }

    public Boolean getJpVestine() {
        return jpVestine;
    }

    public void setJpVestine(Boolean jpVestine) {
        this.jpVestine = jpVestine;
    }

    public String getVestineNaziv() {
        return vestineNaziv;
    }

    public void setVestineNaziv(String vestineNaziv) {
        this.vestineNaziv = vestineNaziv;
    }

    public String getVestineZvanje() {
        return vestineZvanje;
    }

    public void setVestineZvanje(String vestineZvanje) {
        this.vestineZvanje = vestineZvanje;
    }

    public String getVestineOstalo() {
        return vestineOstalo;
    }

    public void setVestineOstalo(String vestineOstalo) {
        this.vestineOstalo = vestineOstalo;
    }

    public String getVestineIskustva() {
        return vestineIskustva;
    }

    public void setVestineIskustva(String vestineIskustva) {
        this.vestineIskustva = vestineIskustva;
    }

    public String getZdravstveneNapomene() {
        return zdravstveneNapomene;
    }

    public void setZdravstveneNapomene(String zdravstveneNapomene) {
        this.zdravstveneNapomene = zdravstveneNapomene;
    }

    public Boolean getJpZdravstveneNapomene() {
        return jpZdravstveneNapomene;
    }

    public void setJpZdravstveneNapomene(Boolean jpZdravstveneNapomene) {
        this.jpZdravstveneNapomene = jpZdravstveneNapomene;
    }
    
    
    public void azurirajProfil(){
        try {
            Connection conn = DriverManager.getConnection(db.DB.connectionString, db.DB.user, db.DB.pass);
            Statement stm = conn.createStatement();
            stm.executeUpdate("update volonter, skola, zaposlenje"
                    + "set ");
            
            
//            stm.executeUpdate("update volonter set jpime="+ jpIme+ ", jpdatum_rodjenja="+ jpDatumRodjenja + ", jppol="+ jpPol + ", drzavljanstvo_id="+
//                    drzavljanstvo + ", jpdrzavljanstvo="+ jpDrzavljanstvo+", telefon='"+ telefon + "', jptelefon="+ jpTelefon + ", ulica_broj='" + 
//                    ulica_broj + "', jpulica_broj="+ jpAdresa+ ", mesto_id="+ mesto + ", jpmesto="+ jpMesto+ ", email='"+ mail + "', lozinka='"+
//                    lozinka + ", slika='"+ slika + "', jpslika="+ jpSlika + ", cv="+ cv + "', jpcv="+ jpCv+ ", status="+ status + ", jpstatus="+
//                    jpStatus + ", kompanija='"+ kompanija + "', sediste='"+ sedisteKompanije + "', pozicija='"+ pozicijaUKompaniji + "', naziv='"+ 
//                    nazivSkole + "', mesto='"+ sedisteSkole + "', nivo='"+ nivoStudija + "', godina_upisa='"+ godinaUpisa + "', " );
//            
        } catch (SQLException ex) {
            Logger.getLogger(AzuriranjeProfilaVolonter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
