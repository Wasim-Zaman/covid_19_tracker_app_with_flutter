import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/title_and_value_item.dart';
import '../services/blocs/states/states_states.dart';
import '../services/blocs/states/states_bloc.dart';
import '../services/blocs/states/states_events.dart';

import './countries_list_screen.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  static const routeName = '/world-states-screen';

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
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<StatesBloc>(context).add(LoadingEvent());
      },
      color: const Color.fromRGBO(255, 46, 126, 1),
      child: Scaffold(
        body: BlocBuilder<StatesBloc, StatesStates>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: SpinKitFadingCircle(
                  size: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? const Color.fromRGBO(255, 46, 126, 1)
                            : Colors.green,
                      ),
                    );
                  },
                ),
                // child: SpinKitFadingCircle(
                //   controller: _animController,
                //   color: const Color.fromRGBO(255, 46, 126, 1),
                // ),
              );
            } else if (state is ExceptionState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            } else if (state is LoadedState) {
              print('loaded state');
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: PieChart(
                          dataMap: {
                            "Cases": double.parse(
                                state.stateModel.cases!.toString()),
                            "Recovered": double.parse(
                                state.stateModel.recovered!.toString()),
                            "Deaths": double.parse(
                                state.stateModel.deaths!.toString()),
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
                            left: 10.0,
                            right: 10.0,
                            top: 5.0,
                            bottom: 15.0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TitleAndValueItem(
                                  title: 'Total Cases',
                                  value: state.stateModel.cases.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Today Cases",
                                  value: state.stateModel.todayCases.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Total Deaths",
                                  value: state.stateModel.deaths.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Today Deaths",
                                  value:
                                      state.stateModel.todayDeaths.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Total Recovered",
                                  value: state.stateModel.recovered.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Active Cases",
                                  value: state.stateModel.active.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Critical Cases",
                                  value: state.stateModel.critical.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Cases Per One Million",
                                  value: state.stateModel.casesPerOneMillion
                                      .toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Deaths Per One Million",
                                  value: state.stateModel.deathsPerOneMillion
                                      .toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Total Tests",
                                  value: state.stateModel.tests.toString(),
                                ),
                                TitleAndValueItem(
                                  title: "Tests Per One Million",
                                  value: state.stateModel.testsPerOneMillion
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 5.0,
                              bottom: 15.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(255, 46, 126, 1),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, CountriesListScreen.routeName);
                                },
                                child: const Text(
                                  'Track Countries',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}
