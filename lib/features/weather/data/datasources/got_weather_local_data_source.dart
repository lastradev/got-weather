import 'package:got_weather/core/error/exception.dart';
import 'package:got_weather/features/weather/domain/entities/got_weather.dart';

abstract class GOTWeatherLocalDataSource {
  /// Matches a temperature with a [GOTWeather] temperature range and returns a GOTWeather
  GOTWeather getGOTWeather(int temperature);
}

class GOTWeatherLocalDataSourceImpl implements GOTWeatherLocalDataSource {
  @override
  GOTWeather getGOTWeather(int temperature) {
    return gotWeatherData.firstWhere(
      (element) =>
          temperature >= element.minTemp && temperature <= element.maxTemp,
      orElse: () => throw CacheException(),
    );
  }
}

const gotWeatherData = [
  GOTWeather(
    primaryColor: 0xFF111844,
    description: 'Winter is comming...',
    cityName: 'Winterfell',
    background: 'winterfellBg',
    minTemp: -100,
    maxTemp: 20,
  ),
  GOTWeather(
    primaryColor: 0xFF950330,
    description: 'You might catch a snake...',
    cityName: 'Dorne',
    background: 'dorneBg',
    minTemp: 21,
    maxTemp: 100,
  )
];

enum GOTCity {
  winterfell,
  dorne,
}
