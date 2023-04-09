import 'package:flutter/cupertino.dart';
import 'package:weather_api/screen/home/modal/weather_modal.dart';
import 'package:weather_api/utils/api_helper_class.dart';

class WeatherProvider extends ChangeNotifier
{

  Future<WeatherModal> jsonParcing({String? lat, String? lon})
  async {
    WeatherModal weather = await ApiHelper().weatherApi(lat: lat!,lon: lon!);
    return weather;
  }
  int currentIndex = 0;
  void refresh()
  {
    notifyListeners();
  }
  List nameOfCity = [
    "Surat",
    "Konkan Dividion",
    "Sanvordem",
    "Ahmedabad",
    "Rajkot",
  ];

  List latitute = [
    "21.1702",
    "19.0760",
    "15.2993",
    "23.0225",
    "22.3039",
  ];

  List longtitute = [
    "72.8311",
    "72.8777",
    "74.1240",
    "72.5714",
    "70.8022",
  ];
  String lat = "21.1702",lon = "72.8311";
  String userLat = "21.1702",usweLon = "72.8311";
  void changeParamater(String late, String long)
  {
    lat = late;
    lon = long;
    notifyListeners();
  }
  void updateParameters(int index)
  {
    userLat = latitute[index];
    usweLon = longtitute[index];
    notifyListeners();
  }
}