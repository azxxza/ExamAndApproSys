$
		.extend(
				$.fn.datagrid.methods,
				{
					/**
					 * 开打提示功能
					 * 
					 * @param {}
					 *            jq
					 * @param {}
					 *            params 提示消息框的样式
					 * @return {}
					 */
					doCellTip : function(jq, params) {

						function showTip(data, td, e) {

							if ($(td).text() == "")
								return;

							data.tooltip.text($(td).text()).css({
								top : (e.pageY + 10) + 'px',
								left : (e.pageX + 20) + 'px',
								'z-index' : $.fn.window.defaults.zIndex,
								display : 'block'
							});
						}
						;
						return jq
								.each(function() {
									var grid = $(this);
									var options = $(this).data('datagrid');
									if (!options.tooltip) {
										var panel = grid.datagrid('getPanel')
												.panel('panel');
										var defaultCls = {
											'border' : '1px solid #333',
											'padding' : '1px',
											'color' : '#333',
											'background' : '#f7f5d1',
											'position' : 'absolute',
											'max-width' : '700px',
											'border-radius' : '4px',
											'-moz-border-radius' : '4px',
											'-webkit-border-radius' : '4px',
											'display' : 'none'
										};
										var tooltip = $(
												"<div id='celltip'></div>")
												.appendTo('body');
										tooltip.css($.extend({}, defaultCls,
												params.cls));
										options.tooltip = tooltip;
										panel
												.find('.datagrid-body')
												.each(
														function() {
															var delegateEle = $(
																	this)
																	.find(
																			'> div.datagrid-body-inner').length ? $(
																	this)
																	.find(
																			'> div.datagrid-body-inner')[0]
																	: this;
															$(delegateEle)
																	.undelegate(
																			'td',
																			'mouseover')
																	.undelegate(
																			'td',
																			'mouseout')
																	.undelegate(
																			'td',
																			'mousemove')
																	.delegate(
																			'td',
																			{
																				'mouseover' : function(
																						e) {

																					var field = $(
																							this)
																							.attr(
																									'field');

																					if (field === 'option'
																							|| field == 'detail') {

																						return;
																					}

																					if (params.delay) {
																						if (options.tipDelayTime)
																							clearTimeout(options.tipDelayTime);
																						var that = this;
																						options.tipDelayTime = setTimeout(
																								function() {
																									showTip(
																											options,
																											that,
																											e);
																								},
																								params.delay);
																					} else {
																						showTip(
																								options,
																								this,
																								e);
																					}

																				},
																				'mouseout' : function(
																						e) {
																					if (options.tipDelayTime)
																						clearTimeout(options.tipDelayTime);
																					options.tooltip
																							.css({
																								'display' : 'none'
																							});
																				},
																				'mousemove' : function(
																						e) {

																					var field = $(
																							this)
																							.attr(
																									'field');

																					if (field === 'option'
																							|| field == 'detail') {

																						return;
																					}
																					var that = this;
																					if (options.tipDelayTime) {
																						clearTimeout(options.tipDelayTime);
																						options.tipDelayTime = setTimeout(
																								function() {
																									showTip(
																											options,
																											that,
																											e);
																								},
																								params.delay);
																					} else {
																						showTip(
																								options,
																								that,
																								e);
																					}
																				}
																			});
														});

									}

								});
					},
					/**
					 * 关闭消息提示功能
					 * 
					 * @param {}
					 *            jq
					 * @return {}
					 */
					cancelCellTip : function(jq) {
						return jq.each(function() {
							var data = $(this).data('datagrid');
							if (data.tooltip) {
								data.tooltip.remove();
								data.tooltip = null;
								var panel = $(this).datagrid('getPanel').panel(
										'panel');
								panel.find('.datagrid-body').undelegate('td',
										'mouseover').undelegate('td',
										'mouseout').undelegate('td',
										'mousemove');
							}
							if (data.tipDelayTime) {
								clearTimeout(data.tipDelayTime);
								data.tipDelayTime = null;
							}
						});
					}
				});

$.extend($.fn.datagrid.methods, {
	editCell : function(jq, param) {
		return jq.each(function() {
			var opts = $(this).datagrid('options');
			var fields = $(this).datagrid('getColumnFields', true).concat(
					$(this).datagrid('getColumnFields'));
			for (var i = 0; i < fields.length; i++) {
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor1 = col.editor;
				if (fields[i] != param.field) {
					col.editor = null;
				}
			}
			$(this).datagrid('beginEdit', param.index);
			for (var i = 0; i < fields.length; i++) {
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor = col.editor1;
			}
		});
	}
});

/**
 * 日期控件日期格式化
 */
function myformatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth();
	var d = date.getDate();
	return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}

/**
 * 日期控件解析结果
 */
function parseDate(dateStr) {

	var strArray = dateStr.split("-");
	if (strArray.length == 3) {
		var y = parseInt(strArray[0]);
		var d = new Date(y, strArray[1], strArray[2]);
		return d;

	} else {
		return new Date();
	}
}

function closes() {
	$("#Loading").fadeOut("normal", function() {
		$(this).remove();
	});
}

var pc;
$.parser.onComplete = function() {
	if (pc)
		clearTimeout(pc);
	pc = setTimeout(closes, 100);
};


var myview = $.extend({}, $.fn.datagrid.defaults.view, {
	onAfterRender : function(target) {
		$.fn.datagrid.defaults.view.onAfterRender.call(this, target);
		var opts = $(target).datagrid('options');
		var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
		vc.children('div.datagrid-empty').remove();
		if (!$(target).datagrid('getRows').length) {
			var d = $('<div class="datagrid-empty"></div>').html(
					opts.emptyMsg || 'no records').appendTo(vc);
			d.css({
				position : 'absolute',
				left : 0,
				top : 50,
				color : "#FF0000",
				width : '100%',
				textAlign : 'center'
			});
		}
	}
});

/*
 * 日期格式化
 */
function formatterdate(val) {
	
	if (val == undefined) {

		return "";
	}

	var date = new Date(val);
	return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
			+ date.getDate();
}

/*
 * 得到窗体的高度和宽度
 */
function getWidth(percent) {
	return document.body.clientWidth * percent;
}

function getHeight(percent) {
	return document.body.clientHeight * percent;
}


