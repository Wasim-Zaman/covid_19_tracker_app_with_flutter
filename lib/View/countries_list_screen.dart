import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

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

  Widget get getListTile => ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
          radius: 20,
        ),
        title: Container(
          color: Colors.black,
          height: 20,
          width: 100,
        ),
      );
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<CountriesBLoc, CountriesStates>(
                builder: (context, state) {
                  if (state is CountriesLoadingState) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: const Color.fromRGBO(255, 46, 126, 1),
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
                              ),
                              // const SizedBox(height: 20),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return getListTile;
                                  },
                                  itemCount: state.countriesModel.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (state is CountriesLoadedState) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Form(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Search by country name',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                controller: _searchController,
                                onChanged: (value) {
                                  BlocProvider.of<CountriesBLoc>(context)
                                      .add(SearchEvent(value));
                                },
                              ),
                            ),
                            // const SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  if (state.countriesModel.isEmpty) {
                                    return const Center(
                                      child: Text('No data found'),
                                    );
                                  }

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
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
