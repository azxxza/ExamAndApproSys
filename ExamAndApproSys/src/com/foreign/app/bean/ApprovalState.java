package com.foreign.app.bean;

/**
 * 审批各个节点状态模型
 * 
 * @author Administrator
 *
 */
public class ApprovalState {

	// 流程id
	private String orderId;

	// 出访编号
	private String visitNo;

	// 申请人教职工号
	private String workId;

	// 出访摘要
	private String visitSummary;

	// 部门审批结果
	private String unitResult;

	// 国际处工作人员审批结果
	private String internalStaffResult;

	private String internalChiefResult;

	private String financeResult;

	private String fundsSourceResult;

	private String disciplineResult;

	private String businessLeaderResult;

	private String internalLeaderResult;

	private String partySecretaryResult;

	private String result;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getVisitNo() {
		return visitNo;
	}

	public void setVisitNo(String visitNo) {
		this.visitNo = visitNo;
	}

	public String getWorkId() {
		return workId;
	}

	public void setWorkId(String workId) {
		this.workId = workId;
	}

	public String getVisitSummary() {
		return visitSummary;
	}

	public void setVisitSummary(String visitSummary) {
		this.visitSummary = visitSummary;
	}

	public String getUnitResult() {
		return unitResult;
	}

	public void setUnitResult(String unitResult) {
		this.unitResult = unitResult;
	}

	public String getInternalStaffResult() {
		return internalStaffResult;
	}

	public void setInternalStaffResult(String internalStaffResult) {
		this.internalStaffResult = internalStaffResult;
	}

	public String getInternalChiefResult() {
		return internalChiefResult;
	}

	public void setInternalChiefResult(String internalChiefResult) {
		this.internalChiefResult = internalChiefResult;
	}

	public String getFinanceResult() {
		return financeResult;
	}

	public void setFinanceResult(String financeResult) {
		this.financeResult = financeResult;
	}

	public String getFundsSourceResult() {
		return fundsSourceResult;
	}

	public void setFundsSourceResult(String fundsSourceResult) {
		this.fundsSourceResult = fundsSourceResult;
	}

	public String getDisciplineResult() {
		return disciplineResult;
	}

	public void setDisciplineResult(String disciplineResult) {
		this.disciplineResult = disciplineResult;
	}

	public String getBusinessLeaderResult() {
		return businessLeaderResult;
	}

	public void setBusinessLeaderResult(String businessLeaderResult) {
		this.businessLeaderResult = businessLeaderResult;
	}

	public String getInternalLeaderResult() {
		return internalLeaderResult;
	}

	public void setInternalLeaderResult(String internalLeaderResult) {
		this.internalLeaderResult = internalLeaderResult;
	}

	public String getPartySecretaryResult() {
		return partySecretaryResult;
	}

	public void setPartySecretaryResult(String partySecretaryResult) {
		this.partySecretaryResult = partySecretaryResult;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
