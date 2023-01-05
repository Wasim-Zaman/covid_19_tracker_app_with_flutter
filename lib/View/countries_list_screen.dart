import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/blocs/countries/countries_states.dart';
import '../services/blocs/repositories/countries_repository.dart';
import '../services/blocs/countries/countries_bloc.dart';
import '../services/blocs/countries/countries_events.dart';

import '../widgets/countries_list_widget.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  static const routeName = '/countries-list-screen';

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) =>
            CountriesBLoc(CountriesRepository())..add(LoadingEvent()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CountriesBLoc, CountriesStates>(
              builder: (context, state) {
                if (state is CountriesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CountriesLoadedState) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            controller: _searchController,
                          ),
                          // const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                final countriesModel =
                                    state.countriesModel[index];
                                return CountriesListWidget(countriesModel);
                              },
                              itemCount: state.countriesModel.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state is CountriesExceptionState) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
