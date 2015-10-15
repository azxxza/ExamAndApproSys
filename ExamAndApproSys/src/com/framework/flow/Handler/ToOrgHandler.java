package com.framework.flow.Handler;

import org.snaker.engine.DecisionHandler;
import org.snaker.engine.core.Execution;

public class ToOrgHandler implements DecisionHandler {

	@Override
	public String decide(Execution execution) {
		
		return "transition15";
	}

}
