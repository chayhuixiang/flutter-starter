import '../utilities/constants.dart';
import '../services/location.dart';
import '../services/networking.dart';

class WeatherModel {

  Future<Map> getWeatherLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    String latitude = location.latitude.toString();
    String longitude = location.longitude.toString();

    String urlString = 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    Uri url = Uri.parse(urlString);

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return networkHelper.getData();
  }

  Future<Map> getWeather(String cityName) async {
    String urlString = 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    Uri url = Uri.parse(urlString);

    NetworkHelper networkHelper = NetworkHelper(url: url);
    return networkHelper.getData();

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
