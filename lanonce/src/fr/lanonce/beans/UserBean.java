package fr.lanonce.beans;

public class UserBean {
    private String email;
    private String pseudo;
    private String password;
    private String nom;
    private String prenom;
    private String ville;
    
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
    
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}	
			
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	@Override
	public String toString() {
		return "UserBean [email=" + email + ", pseudo=" + pseudo + ", password=" + password + ", nom=" + nom
				+ ", prenom=" + prenom + ", ville=" + ville + "]";
	} 	
}
