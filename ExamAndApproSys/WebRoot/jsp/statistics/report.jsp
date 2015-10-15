<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/jsp/common/meta.jsp"%>
<!-- ECharts单文件引入 -->
<script src="${pageContext.request.contextPath}/echarts-2.2.7/build/dist/echarts.js"></script>
<script language="javascript">
</script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px"></div>
    
    <script type="text/javascript">

        // 路径配置
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/echarts-2.2.7/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                    tooltip: {
                        show: true
                    },
                    legend: {
                        data:['近一年出境次数']
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : ["美国","加拿大","澳大利亚","日本","韩国","台湾"]
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            "name":"次数",
                            "type":"bar",
                            "data":[5, 20, 40, 10, 10, 20]
                        }
                    ]
                };
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
    
   <div id="pie" style="height: 400px">  </div>

   <script type="text/javascript">

        // 路径配置
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/echarts-2.2.7/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart2 = ec.init(document.getElementById('pie')); 
                
                option = {
    title : {
        text: '近1年出国统计',
        subtext: '纯属虚构',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['加拿大','美国','日本告','韩国','非洲']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'目的地',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:335, name:'加拿大'},
                {value:310, name:'美国'},
                {value:234, name:'日本'},
                {value:135, name:'韩国'},
                {value:1548, name:'非洲'}
            ]
        }
    ]
};
        
                // 为echarts对象加载数据 
                myChart2.setOption(option); 
            }
        );
    </script>
    
</body>
</html>
