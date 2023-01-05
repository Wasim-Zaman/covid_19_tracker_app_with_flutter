import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utilities/app_urls.dart';
import '../../../models/countries_model.dart';

class CountriesRepository {
  final List<CountriesModel> countriesList = [];
  Future<List<CountriesModel>> fetchCountriesList() async {
    try {
      final response = await http.get(Uri.parse(AppUrls.countriesListApi));
      // check the response of the api is valid or not
      if (response.statusCode == 200) {
        print('***** status code is fine ${response.statusCode} *****');
        // create a jsonData variable
        final jsonData = jsonDecode(response.body.toString());

        // append each single map into the list
        jsonData.forEach((element) {
          countriesList.add(CountriesModel.fromJson(element));
        });
        return countriesList;
      } else {
        print('***** status code is not fine ${response.statusCode}*****');
        throw Exception("Invalid response from API");
      }
    } catch (error) {
      rethrow;
    }
  }

  // Future<List<Map<String, dynamic>>> fetchCountriesList() async {
  //   try {
  //     final response = await http.get(Uri.parse(AppUrls.countriesListApi));
  //     // check the response of the api is valid or not
  //     if (response.statusCode == 200) {
  //       print('***** status code is fine ${response.statusCode} *****');
  //       // create a jsonData variable
  //       final jsonData = jsonDecode(response.body.toString());
  //       return jsonData;
  //     } else {
  //       print('***** status code is not fine ${response.statusCode}*****');
  //       throw Exception("Invalid response from API");
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
