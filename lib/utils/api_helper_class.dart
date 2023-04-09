import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/screen/home/modal/weather_modal.dart';
class ApiHelper
{
  Future<WeatherModal> weatherApi({String? lat, String? lon})
  async {
    String link = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=9628b95a2235abb2f18055013ade5de8";
    var url =  Uri.parse(link);
    var resource = await http.get(url);
    var json = jsonDecode(resource.body);

    WeatherModal jsonData = WeatherModal.fromJson(json);
    return jsonData;
  }
}