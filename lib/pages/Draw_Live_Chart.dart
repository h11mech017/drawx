import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LivePieChart extends StatefulWidget {
  final List<double> data;
  final List<String> labels;

  LivePieChart({required this.data, required this.labels});

  @override
  _LivePieChartState createState() => _LivePieChartState();
}

class _LivePieChartState extends State<LivePieChart> {
  List<Color> colors = [
    const Color (0xffD95AF3),
    const Color (0xff3EE094),
    const Color (0xff3398F6),
    const Color (0XffFA4A42),
    const Color (0xffFE9539)
  ];

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> sections = _generateSectionsFromData(widget.data, widget.labels);

    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 5,
        startDegreeOffset: -90,
        borderData: FlBorderData(
          show: false,
        ),
        sections: sections,
      ),
    );
  }

  List<PieChartSectionData> _generateSectionsFromData(List<double> data, List<String> labels) {
    return List.generate(data.length, (index) {
      final value = data[index];
      final color = colors[index % colors.length];
      final label = labels[index];

      return PieChartSectionData(
        value: value,
        radius: 150,
        color: color,
        title: '',
        showTitle: false,
        titlePositionPercentageOffset: 0.5,
        badgeWidget: Text(
          label,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        badgePositionPercentageOffset: 0.5,
      );
    });
  }
}
