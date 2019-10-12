import 'package:weather_app/models/src/weather.dart';

import 'date_utils.dart';
import 'forecast_animation_utils.dart';

/// This class is used to turn enum values, date times, etc into human-readable Strings
class Humanize {
  static List<String> enumValues(List<dynamic> values) {
    return values.map((u) => u.toString().split(".")[1]).toList();
  }

  static String singleEnumValue(dynamic value) {
    return value.toString().split(".").last;
  }

  static String currentTemperature(TemperatureUnit unit, Weather temp) {
    var tempInt = temp.temperature.current;
    if (unit == TemperatureUnit.fahrenheit) {
      tempInt = Temperature.celsiusToFahrenheit(temp.temperature.current);
    }
    return '$tempInt ${AnimationUtil.temperatureLabels[unit]}';
  }

  static String weatherDescription(Weather weather) {
    var day = DateUtils.weekdays[weather.dateTime.weekday];
    var description = Weather.displayValues[weather.description];
    return "$day. ${description.replaceFirst(description[0], description[0].toUpperCase())}.";
  }

  static List<String> allHours() {
    return AnimationUtil.hours.map((hour) => '$hour:00').toList();
  }
}
