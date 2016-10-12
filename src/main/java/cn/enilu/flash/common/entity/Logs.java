package cn.enilu.flash.common.entity;

import org.joda.time.DateTime;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
public class Logs {

	@Id
	private Integer id;

	@Column
	private Long operator;
	@Column
	private String operatorName;
	
	@Column
	private String action;
	
	@Column
	private DateTime operateTime = DateTime.now();

	@Column
	private String className;
	@Column
	private String methodName;

	@Column
	private String ip;

	@Column
	private String exceptionCode;

	@Column
	private String exceptionDetail;

	@Column
	private String params;
	public void setId(Integer id) {
		this.id = id;
	}
	 
	public Integer getId() {
		return this.id;
	}


	public void setOperator(Long operator) {
		this.operator = operator;
	}
	 
	public Long getOperator() {
		return this.operator;
	}

	public void setAction(String action) {
		this.action = action;
	}
	 
	public String getAction() {
		return this.action;
	}

	public void setOperateTime(DateTime operateTime) {
		this.operateTime = operateTime;
	}
	 
	public DateTime getOperateTime() {
		return this.operateTime;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getExceptionCode() {
		return exceptionCode;
	}

	public void setExceptionCode(String exceptionCode) {
		this.exceptionCode = exceptionCode;
	}

	public String getExceptionDetail() {
		return exceptionDetail;
	}

	public void setExceptionDetail(String exceptionDetail) {
		this.exceptionDetail = exceptionDetail;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}
}
