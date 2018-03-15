package fr.lanonce.beans;

public class UserBean {
    private String email;
    private String pseudo;
    private String password;
    
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPseudo() {
        return pseudo;
    }
    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }
    
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
	@Override
	public String toString() {
		return "Utilisateur [email=" + email + ", prenom=\" + pseudo + \", password=" + password + "]";
	}  
}
