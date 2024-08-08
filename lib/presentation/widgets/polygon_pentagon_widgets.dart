import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PolygonPentagon extends StatelessWidget {
  final List<double> values;

  PolygonPentagon({required this.values})
      : assert(values.length == 5, 'values list must have exactly 5 elements');

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        dataSets: [
          RadarDataSet(
            fillColor: Colors.blue.withOpacity(0.5),
            borderColor: Colors.blue,
            entryRadius: 3,
            dataEntries:
                values.map((value) => RadarEntry(value: value)).toList(),
          ),
        ],
        radarBorderData: BorderSide(color: Colors.transparent),
        radarBackgroundColor: Colors.transparent,
        gridBorderData: BorderSide(color: Colors.grey, width: 2),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 14),
        getTitle: (index, angle) {
          switch (index) {
            case 0:
              return RadarChartTitle(text: 'DRY');
            case 1:
              return RadarChartTitle(text: 'COMBINATION');
            case 2:
              return RadarChartTitle(text: 'OILY');
            case 3:
              return RadarChartTitle(text: 'ACNE');
            case 4:
              return RadarChartTitle(text: 'WRINKLES');
            default:
              return const RadarChartTitle(text: '');
          }
        },
      ),
    );
  }
}
