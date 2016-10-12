package cn.enilu.flash.common.controller;

public class BadRequestException extends RuntimeException {
	public BadRequestException() {
		super();
	}

	public BadRequestException(String message) {
		super(message);
	}
}
