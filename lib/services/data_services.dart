import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/models/place_model.dart';

class DataServices {
  static const String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<PlaceModel>> getPlaces() async {
    String endpoint = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl + endpoint));
    try {
      if (response.statusCode == 200) {
        List<dynamic> places = json.decode(response.body);
        return places.map((place) => PlaceModel.fromJson(place)).toList();
      }
      return <PlaceModel>[];
    } catch (e) {
      print(e);
      return <PlaceModel>[];
    }
  }
}
