import 'package:flutter/material.dart';

import '../models/countries_model.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/country-details-screen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CountriesModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.country!),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.network(args.countryInfo!.flag!),
            Text('Total Cases: ${args.cases}'),
            Text('Total Deaths: ${args.deaths}'),
            Text('Total Recovered: ${args.recovered}'),
            Text('Total Active: ${args.active}'),
            Text('Total Critical: ${args.critical}'),
            Text('Total Cases Today: ${args.todayCases}'),
            Text('Total Deaths Today: ${args.todayDeaths}'),
            Text('Total Tests: ${args.tests}'),
            Text('Total Tests Per Million: ${args.testsPerOneMillion}'),
            Text('Total Population: ${args.population}'),
            // Text('Total Population Density: ${args.populationDensity}'),
            Text('Total One Case Per People: ${args.oneCasePerPeople}'),
            Text('Total One Death Per People: ${args.oneDeathPerPeople}'),
            Text('Total One Test Per People: ${args.oneTestPerPeople}'),
            Text('Total Active Per Million: ${args.activePerOneMillion}'),
            Text('Total Recovered Per Million: ${args.recoveredPerOneMillion}'),
            Text('Total Critical Per Million: ${args.criticalPerOneMillion}'),
            // Text('Total Affected Countries: ${args.affectedCountries}'),
          ],
        ),
      ),
    );
  }
}
