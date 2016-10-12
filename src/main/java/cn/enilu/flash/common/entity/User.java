package cn.enilu.flash.common.entity;

import com.google.common.base.MoreObjects;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.DateTime;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
public class User {

	@Id
	private Long id;

	@Column
	@NotEmpty
	private String name;

	@Column
	@NotEmpty
	private String email;

	@NotEmpty
	private String password;

	@Column
	private String salt;

	@Column
	private String cryptedPassword;

	@Column
	private DateTime createdAt;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCryptedPassword() {
		return cryptedPassword;
	}

	public void setCryptedPassword(String cryptedPassword) {
		this.cryptedPassword = cryptedPassword;
	}

	public DateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(DateTime createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", this.id)
				.add("name", this.name).add("email", this.email)
				.add("password", "******")
				.add("cryptedPassword", this.cryptedPassword)
				.add("createdAt", this.createdAt).toString();
	}
}
