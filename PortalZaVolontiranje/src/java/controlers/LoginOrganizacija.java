/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlers;

import beans.Organizacija;
import beans.Volonter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Korisnik
 */
@ManagedBean
@SessionScoped
public class LoginOrganizacija {
    
    private String email;
    private String lozinka;
    private String errorNeaktivan;
    private int idOrganizacije;
    private int aktivan;
    private String errorPassword = "";
    private String errorEmail = "";
    private boolean ok=false;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getErrorNeaktivan() {
        return errorNeaktivan;
    }

    public void setErrorNeaktivan(String errorNeaktivan) {
        this.errorNeaktivan = errorNeaktivan;
    }

    public int getIdOrganizacije() {
        return idOrganizacije;
    }

    public void setIdOrganizacije(int idOrganizacije) {
        this.idOrganizacije = idOrganizacije;
    }

    public int getAktivan() {
        return aktivan;
    }

    public void setAktivan(int aktivan) {
        this.aktivan = aktivan;
    }

    public String getErrorPassword() {
        return errorPassword;
    }

    public void setErrorPassword(String errorPassword) {
        this.errorPassword = errorPassword;
    }

    public String getErrorEmail() {
        return errorEmail;
    }

    public void setErrorEmail(String errorEmail) {
        this.errorEmail = errorEmail;
    }

    public boolean isOk() {
        return ok;
    }

    public void setOk(boolean ok) {
        this.ok = ok;
    }
    
     public Organizacija logInOrganizacija;

    public Organizacija getLogInOrganizacija() {
        return logInOrganizacija;
    }

    public void setLogInOrganizacija(Organizacija logInOrganizacija) {
        this.logInOrganizacija = logInOrganizacija;
    }
    
     public String login() {
        errorEmail = "";
        errorPassword = "";
        try {
            Connection conn = DriverManager.getConnection(db.DB.connectionString, db.DB.user, db.DB.pass);
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("select * from organizacija where email='" + email + "'");
            if (!rs.next()){
                errorEmail = "Ne postoji korisnicko ime";
                return errorEmail;
            };
            aktivan=rs.getInt("Aktivan");
            if (aktivan == 0) {
               errorNeaktivan="Vas nalog jos nije aktiviran";
               return errorNeaktivan;
            } else {
                if (rs.getString("lozinka").equals(lozinka)) {
                    HttpSession sesija = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
                    logInOrganizacija = new Organizacija();
                    
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginOrganizacija.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
     } 
}

