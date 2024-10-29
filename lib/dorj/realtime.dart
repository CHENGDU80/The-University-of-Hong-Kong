import 'dart:async';

import 'package:chengdu80_prototype/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class _ChartData {
  _ChartData(this.country, this.sales);
  final int country;
  final num sales;
}

class RealtimeChart extends StatefulWidget {
  const RealtimeChart({super.key});

  @override
  State<RealtimeChart> createState() => _RealtimeChartState();
}

class _RealtimeChartState extends State<RealtimeChart> {
  void _updateDataSource(Timer timer) {
    chartData!.add(_ChartData(count, _getRandomInt(0, 0.2)));
    if (chartData!.length == 20) {
      chartData!.removeAt(0);
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData!.length - 1],
        removedDataIndexes: <int>[0],
      );
    } else {
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData!.length - 1],
      );
    }
    count = count + 1;
  }

  late Timer timer;
  List<_ChartData>? chartData;
  late int count;
  ChartSeriesController<_ChartData, int>? _chartSeriesController;

  @override
  void dispose() {
    timer.cancel();
    chartData!.clear();
    _chartSeriesController = null;
    super.dispose();
  }

  @override
  void initState() {
    timer =
        Timer.periodic(const Duration(milliseconds: 500), _updateDataSource);
    count = 19;
    chartData = <_ChartData>[
      _ChartData(10, 0.2),
      _ChartData(13, 0.23),
      _ChartData(14, 0.19),
      _ChartData(15, 0.10),
      _ChartData(16, 0.17),
      _ChartData(17, 0.23),
      _ChartData(18, 0.20),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLiveLineChart();
  }

  /// Returns the realtime Cartesian line chart.
  SfCartesianChart _buildLiveLineChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis:
            const NumericAxis(majorGridLines: MajorGridLines(width: 0)),
        primaryYAxis: const NumericAxis(
            maximum: 1,
            axisLine: AxisLine(width: 0),
            majorTickLines: MajorTickLines(size: 0)),
        series: <LineSeries<_ChartData, int>>[
          LineSeries<_ChartData, int>(
            onRendererCreated:
                (ChartSeriesController<_ChartData, int> controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: MyColors.primary,
            xValueMapper: (_ChartData sales, _) => sales.country,
            yValueMapper: (_ChartData sales, _) => sales.sales,
            animationDuration: 0,
          )
        ]);
  }

  ///Continuously updating the data source based on timer

  ///Get the random data
  double _getRandomInt(double min, double max) {
    final random = math.Random();
    return random.nextDouble() * max + min;
  }

  /// Private class for storing the chart series data points.
}
