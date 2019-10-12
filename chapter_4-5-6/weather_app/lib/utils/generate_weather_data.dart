import 'dart:math' as math;

import 'package:weather_app/models/src/app_settings.dart' as settings;
import 'package:weather_app/models/src/app_settings.dart';
import 'package:weather_app/models/src/weather.dart';

/// This class has one purpose: to generate fake data.
/// You should not be concerned with this class, as it has nothing to do with Flutter
/// Further more, it's tedious and contrived, and in real life you'd likely not care about
/// creating complex fake data.
class WeatherDataRepository {
  DateTime _today = DateTime.now().toUtc();
  DateTime startDateTime;
  DateTime dailyDate;
  var _random = math.Random();
  List<City> cities = settings.allAddedCities;

  WeatherDataRepository() {
    startDateTime = DateTime.utc(_today.year, _today.month, _today.day, 0);
    dailyDate = _today;
  }

  int generateCloudCoverageNum(WeatherDescription description) {
    switch (description) {
      case WeatherDescription.cloudy:
        return 75;
      case WeatherDescription.rain:
        return 45;
      case WeatherDescription.clear:
      case WeatherDescription.sunny:
      default:
        return 5;
    }
  }

  WeatherDescription generateTimeAwareWeatherDescription(DateTime time) {
    final hour = time.hour;
    final isNightTime = (hour < 6 || hour > 18);
    final descriptions = WeatherDescription.values;

    // Used to generate a random weather description
    var description = descriptions.elementAt(_random.nextInt(descriptions.length));

    // Used to ensure that it isn't "sunny" at night time, and vice versa.
    if (isNightTime && description == WeatherDescription.sunny) {
      description = WeatherDescription.clear;
    }
    if (!isNightTime && description == WeatherDescription.clear) {
      description = WeatherDescription.sunny;
    }
    return description;
  }

  ForecastDay dailyForecastGenerator(City city, int low, int high) {
    List<Weather> forecasts = [];
    int runningMin = 555;
    int runningMax = -555;

    for (var i = 0; i < 8; i++) {
      startDateTime = startDateTime.add(Duration(hours: 3));
      final temp = _random.nextInt(high);
      WeatherDescription randomDescription = generateTimeAwareWeatherDescription(startDateTime);

      final tempBuilder = Temperature(
        current: temp,
        temperatureUnit: TemperatureUnit.celsius,
      );

      forecasts.add(
        Weather(
          city: city,
          dateTime: startDateTime,
          description: randomDescription,
          cloudCoveragePercentage: generateCloudCoverageNum(randomDescription),
          temperature: tempBuilder,
        ),
      );

      runningMin = math.min(runningMin, temp);
      runningMax = math.max(runningMax, temp);
    }

    final forecastDay = ForecastDay(
      hourlyWeather: forecasts,
      min: runningMin,
      max: runningMax,
      date: dailyDate,
    );
    dailyDate.add(Duration(days: 1));
    return forecastDay;
  }

  Forecast getTenDayForecast(City city) {
    List<ForecastDay> tenDayForecast = [];

    List.generate(10, (int index) {
      tenDayForecast.add(dailyForecastGenerator(city, 2, 10));
    });

    return Forecast(days: tenDayForecast, city: city);
  }
}
