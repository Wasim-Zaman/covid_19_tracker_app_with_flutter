import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utilities/app_urls.dart';
import '../../../models/countries_model.dart';

class CountriesRepository {
  Future<List<CountriesModel>> fetchCountriesData() async {
    List<CountriesModel> _countriesModelList = [];

    final response = await http.get(Uri.parse(AppUrls.countriesListApi));
    // check the response of the api is valid or not
    if (response.statusCode == 200) {
      print('***** status code is fine ${response.statusCode} *****');
      // create a jsonData variable
      final jsonData = jsonDecode(response.body.toString());

      // append each single map into the list
      for (Map<String, dynamic> map in jsonData) {
        _countriesModelList.add(CountriesModel.fromJson(map));
      }
      print('**** Loop is done ****');

      return _countriesModelList;
    } else {
      print('***** status code is not fine ${response.statusCode}*****');
      throw Exception("Invalid response from API");
    }
  }
}
