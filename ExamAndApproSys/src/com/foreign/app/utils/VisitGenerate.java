package com.foreign.app.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.snaker.engine.INoGenerator;
import org.snaker.engine.SnakerEngine;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.HistoryOrder;
import org.snaker.engine.model.ProcessModel;

import com.framework.flow.Service.SnakerService;

public class VisitGenerate extends SnakerService implements INoGenerator {

	public static String getVisitSummary(String teacherName,
			String visitCountry, String visitType) {
		return teacherName + "赴" + visitCountry + visitType;
	}

	@Override
	public String generate(ProcessModel processModel) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy-MM-dd");

		Date date = new Date();

		List<HistoryOrder> list = engine.query().getHistoryOrders(
				new QueryFilter());

		int count = 0;

		if (list != null) {
			count = list.size();
		}

		return simpleDateFormat.format(date) + "-" + count;
	}

	public static String getVisitNo(SnakerEngine engine) {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy-MM-dd");

		Date date = new Date();

		List<HistoryOrder> list = engine.query().getHistoryOrders(
				new QueryFilter());

		int count = 0;

		if (list != null) {
			count = list.size();
		}

		return simpleDateFormat.format(date) + "-" + count;
	}

}
