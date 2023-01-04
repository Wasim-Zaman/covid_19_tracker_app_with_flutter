import 'dart:convert';

import 'package:http/http.dart';

import '../../utilities/app_urls.dart';
import '../../../models/countries_model.dart';

class CountriesRepository {
  Future<List<dynamic>> fetchCountriesData() async {
    List<dynamic> _countriesModelList;
    try {
      print('inside try block');
      final Response response = await get(Uri.parse(AppUrls.countriesListApi));
      if (response.statusCode == 200) {
        print('***** status code is fine ${response.statusCode} *****');
        final data = jsonDecode(response.body);
        final List<dynamic> _countriesData = data;
        _countriesModelList = _countriesData;
        return _countriesModelList;
      } else {
        throw Exception('Failed to load countries data!');
      }
    } catch (error) {
      print('***** error is: $error *****');
      rethrow;
    }
  }
}
