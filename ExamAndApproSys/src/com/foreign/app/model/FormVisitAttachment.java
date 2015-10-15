package com.foreign.app.model;

import com.jfinal.plugin.activerecord.Model;

public class FormVisitAttachment extends Model<FormVisitAttachment> {

	private static final long serialVersionUID = 1L;
	private static final String FORM_ATTACHMENT = "form_attachment";
	public final static FormVisitAttachment dao = new FormVisitAttachment();

}
