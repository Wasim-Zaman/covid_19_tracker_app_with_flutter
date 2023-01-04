import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import './services/blocs/repositories/states_repository.dart';
import 'services/blocs/states/states_bloc.dart';
import 'services/blocs/states/states_events.dart';

import './View/countries_list_screen.dart';
import './View/world_states_screen.dart';
import './View/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatesBloc>(
      create: (context) => StatesBloc(StatesRepository())..add(LoadingEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          accentColor: const Color.fromRGBO(255, 46, 126, 1),
        ),
        home: const SplashScreen(),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          WorldStatesScreen.routeName: (context) => const WorldStatesScreen(),
          CountriesListScreen.routeName: (context) =>
              const CountriesListScreen(),
        },
      ),
    );
  }
}
