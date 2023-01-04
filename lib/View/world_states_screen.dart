import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/title_and_value_item.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  List<Color> colorList = [
    const Color.fromRGBO(99, 62, 187, 1),
    const Color.fromRGBO(190, 97, 202, 1),
    const Color.fromRGBO(241, 60, 89, 1),
  ];

  late final AnimationController _animController = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat();
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      // () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => WorldStatusScreen(),
      //   ),
      // ),
      () {},
    );
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('scaffold');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: PieChart(
                  dataMap: const {
                    "Total": 500000,
                    "Recovered": 200000,
                    "Deaths": 100000,
                  },
                  animationDuration: const Duration(seconds: 3),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  // chartType: ChartType.ring,
                  colorList: colorList,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                  ),
                  legendOptions: const LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.left,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                    bottom: 8.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                        TitleAndValueItem(
                          title: 'title',
                          value: 'value',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 46, 126, 1)),
                    child: const Center(
                      child: Text(
                        'Track Countries',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
