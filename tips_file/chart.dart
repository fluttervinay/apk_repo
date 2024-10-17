import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion Refresh Indicator Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RefreshIndicatorChartPage(),
    );
  }
}

class RefreshIndicatorChartPage extends StatefulWidget {
  @override
  _RefreshIndicatorChartPageState createState() => _RefreshIndicatorChartPageState();
}

class _RefreshIndicatorChartPageState extends State<RefreshIndicatorChartPage> {
  List<_ChartData> data = [
    _ChartData('Jan', 35),
    _ChartData('Feb', 28),
    _ChartData('Mar', 34),
    _ChartData('Apr', 32),
    _ChartData('May', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syncfusion Refresh Indicator Chart'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: SingleChildScrollView(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            title: ChartTitle(text: 'Sales Data'),
            legend: Legend(isVisible: true),
            series: <CartesianSeries>[
              LineSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.month,
                yValueMapper: (_ChartData data, _) => data.sales,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    setState(() {
      // Simulate data update
      data = [
        _ChartData('Jan', 45),
        _ChartData('Feb', 38),
        _ChartData('Mar', 40),
        _ChartData('Apr', 30),
        _ChartData('May', 50),
      ];
    });
  }
}

class _ChartData {
  _ChartData(this.month, this.sales);

  final String month;
  final double sales;
}
