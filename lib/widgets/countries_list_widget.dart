import 'package:flutter/material.dart';

import '../models/countries_model.dart';

class CountriesListWidget extends StatelessWidget {
  final CountriesModel countriesModel;
  const CountriesListWidget(this.countriesModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flag = countriesModel.countryInfo?.flag;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(flag!),
          backgroundColor: Colors.transparent,
        ),
        title: Text(countriesModel.country!),
        subtitle: Text('Total Cases: ${countriesModel.cases}'),
      ),
    );
  }
}
