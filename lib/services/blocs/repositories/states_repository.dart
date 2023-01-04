import 'dart:convert';

import 'package:http/http.dart';

import '../../utilities/app_urls.dart';
import '../../../models/states_model.dart';

class StatesRepository {
  Future<StatesModel> fetchWorldStatesRecord() async {
    final Response response = await get(Uri.parse(AppUrls.worldStatesApi));
    if (response.statusCode == 200) {
      return StatesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load world states record!');
    }
  }
}
