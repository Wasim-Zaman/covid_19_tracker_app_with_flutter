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
        title: ListTile(
          title: Text(args.country!),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.network(
                    args.countryInfo!.flag!,
                    height: 150,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: ListTile(
                          title: const Text('Total Cases:'),
                          trailing: Text(args.cases.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Today Cases:'),
                          trailing: Text(args.todayCases.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Total Deaths:'),
                          trailing: Text(args.deaths.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Today Deaths:'),
                          trailing: Text(args.todayDeaths.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Total Recovered:'),
                          trailing: Text(args.recovered.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Active Cases:'),
                          trailing: Text(args.active.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Critical Cases:'),
                          trailing: Text(args.critical.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Cases Per One Million:'),
                          trailing: Text(args.casesPerOneMillion.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Deaths Per One Million:'),
                          trailing: Text(args.deathsPerOneMillion.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Total Tests:'),
                          trailing: Text(args.tests.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Tests Per One Million:'),
                          trailing: Text(args.testsPerOneMillion.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Population:'),
                          trailing: Text(args.population.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Continent:'),
                          trailing: Text(args.continent.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('One Case Per People:'),
                          trailing: Text(args.oneCasePerPeople.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('One Death Per People:'),
                          trailing: Text(args.oneDeathPerPeople.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('One Test Per People:'),
                          trailing: Text(args.oneTestPerPeople.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Active Per One Million:'),
                          trailing: Text(args.activePerOneMillion.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Recovered Per One Million:'),
                          trailing:
                              Text(args.recoveredPerOneMillion.toString()),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('Critical Per One Million:'),
                          trailing: Text(args.criticalPerOneMillion.toString()),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
