package guest;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users", schema = "public", catalog = "dbname")
public class Users {
	private String date;
	private String email;
	private String firstName;
	private String lastName;
	private String matricula;
	private String password;
	private String repository;
	private String resetToken;
	private Integer userId;
	private String publicRep;

	public Users(String date, String email, String firstName, String lastName, String matricula, String password, String repository, String resetToken, Integer userId, String publicRep) {

		this.date =date;
		this.email =email;
		this.firstName =firstName;
		this.lastName =lastName;
		this.matricula =matricula;
		this.password =password;
		this.repository =repository;
		this.resetToken =resetToken;
		this.userId =userId;
		this.publicRep =publicRep;
	}


	public Users(String email, String firstName, String lastName, String matricula, String password, String repository, String publicRep) {


		this.email =email;
		this.firstName =firstName;
		this.lastName =lastName;
		this.matricula =matricula;
		this.password =password;
		this.repository =repository;
		this.publicRep =publicRep;
	}

	public Users() {

	}


	@Column(name = "date")
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


	@Id
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	@Column(name = "first_name")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	@Column(name = "last_name")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	@Column(name = "matricula")
	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}


	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	@Column(name = "repository")
	public String getRepository() {
		return repository;
	}

	public void setRepository(String repository) {
		this.repository = repository;
	}


	@Column(name = "reset_token")
	public String getResetToken() {
		return resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}


	@Column(name = "user_id")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	@Column(name = "public_rep")
	public String getPublicRep() {
		return publicRep;
	}

	public void setPublicRep(String publicRep) {this.publicRep = publicRep;	}
}
