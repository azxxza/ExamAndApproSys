package com.foreign.app.utils;

import java.io.IOException;
import java.io.StringWriter;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

public class JsonUtil {
	private static ObjectMapper objectMapper = new ObjectMapper();
	private static JsonFactory jsonFactory = objectMapper.getJsonFactory();

	public static String objectToJson(Object obj) {
		String jsonStr = "";
		JsonGenerator jsonGenerator = null;
		try {
			StringWriter stringWriter = new StringWriter();
			jsonGenerator = jsonFactory.createJsonGenerator(stringWriter);
			jsonGenerator.writeObject(obj);
			jsonStr = stringWriter.toString();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				jsonGenerator.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return jsonStr;
	}
}
