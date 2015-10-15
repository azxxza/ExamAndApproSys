package com.foreign.app.utils;

public class MessageBean {
	private boolean flag;

	private String message;

	public boolean getFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		if (message != null) {
			message = message.replaceAll("\r", "");
			message = message.replaceAll("\n", "");
			message = message.replaceAll("\r\n", "");
		}
		this.message = message;
	}

}
