import 'dart:convert';

import 'package:http/http.dart';

import '../../utilities/app_urls.dart';
import '../../../models/states_model.dart';

class StatesRepository {
  Future<StatesModel> fetchWorldStatesRecord() async {
    try {
      // print('inside try block');
      final Response response = await get(Uri.parse(AppUrls.worldStatesApi));
      if (response.statusCode == 200) {
        // print('***** status code is fine ${response.statusCode} *****');
        // print('***** response body is: ${response.body} *****');
        return StatesModel.fromJson(jsonDecode(response.body));
      } else {
        // print('***** status code is not fine ${response.statusCode}*****');
        throw Exception('Failed to load world states record!');
      }
    } catch (error) {
      // print('***** error is: $error *****');
      rethrow;
    }
  }
}
