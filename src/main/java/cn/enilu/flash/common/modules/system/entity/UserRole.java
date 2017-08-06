package cn.enilu.flash.common.modules.system.entity;

import com.google.common.base.MoreObjects;
import org.joda.time.DateTime;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Table
public class UserRole {

	@Id
	private Long id;
	
	@Column
	@NotNull
	private Long userId;
	
	@Column
	@NotNull
	private Long roleId;
	
	@Column
	private DateTime updatedAt = DateTime.now();
	
	@Column
	private DateTime createdAt = DateTime.now();
	
	public void setId(Long id) {
		this.id = id;
	}
	 
	public Long getId() {
		return this.id;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	 
	public Long getUserId() {
		return this.userId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	 
	public Long getRoleId() {
		return this.roleId;
	}

	public void setUpdatedAt(DateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	 
	public DateTime getUpdatedAt() {
		return this.updatedAt;
	}

	public void setCreatedAt(DateTime createdAt) {
		this.createdAt = createdAt;
	}
	 
	public DateTime getCreatedAt() {
		return this.createdAt;
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("userId", userId)
			.add("roleId", roleId).add("updatedAt", updatedAt)
			.add("createdAt", createdAt).toString();
	}
}
