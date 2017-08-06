package cn.enilu.flash.common.modules.system.entity;


import com.google.common.base.MoreObjects;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
public class SysNotification {

	@Id
	private Long id;
	
	@Column
	@Length(min=4, max=64)
	private String title;
	
	@Column
	private String content;
	
	@Column
	private String createTime;
	
	@Column
	private Long userId;
	
	public void setId(Long id) {
		this.id = id;
	}
	 
	public Long getId() {
		return this.id;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	 
	public String getTitle() {
		return this.title;
	}

	public void setContent(String content) {
		this.content = content;
	}
	 
	public String getContent() {
		return this.content;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	 
	public String getCreateTime() {
		return this.createTime;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	 
	public Long getUserId() {
		return this.userId;
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", id).add("title", title)
			.add("content", content).add("createTime", createTime)
			.add("userId", userId).toString();
	}
}
