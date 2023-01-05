import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utilities/app_urls.dart';
import '../../../models/states_model.dart';

class StatesRepository {
  Future<StatesModel> fetchStatesData() async {
    final response = await http.get(Uri.parse(AppUrls.worldStatesApi));
    // check the response of the api is valid or not
    if (response.statusCode == 200) {
      print('***** status code is fine ${response.statusCode} *****');
      // create a jsonData variable
      final jsonData = jsonDecode(response.body.toString());

      // append each single map into the list
      return StatesModel.fromJson(jsonData);
    } else {
      print('***** status code is not fine ${response.statusCode}*****');
      throw Exception("Invalid response from API");
    }
  }
}
