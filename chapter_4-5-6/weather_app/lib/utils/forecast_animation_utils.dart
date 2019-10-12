import 'package:flutter/material.dart';
import 'package:weather_app/models/src/forecast_animation_state.dart';
import 'package:weather_app/models/src/weather.dart';

class AnimationUtil {
  /// The hourly data is based on 3 hour intervals from 0..24
  static List<int> hours = [3, 6, 9, 12, 15, 18, 21, 24];

  static Map<WeatherDescription, IconData> weatherIcons = {
    WeatherDescription.sunny: Icons.wb_sunny,
    WeatherDescription.cloudy: Icons.wb_cloudy,
    WeatherDescription.clear: Icons.brightness_2,
    WeatherDescription.rain: Icons.beach_access,
  };

  static Map<TemperatureUnit, String> temperatureLabels = {
    TemperatureUnit.celsius: "°C",
    TemperatureUnit.fahrenheit: "°F",
  };

  static ForecastAnimationState getDataForNextAnimationState({
    ForecastDay selectedDay,
    int currentlySelectedTimeOfDay, // [3, 6, 9, 12, 15, 18, 21, 24 ]
  }) {
    final newSelection = ForecastDay.getWeatherForHour(
      selectedDay,
      currentlySelectedTimeOfDay,
    );

    final endAnimationState = ForecastAnimationState.stateForNextSelection(
      newSelection.dateTime.hour,
      newSelection.description,
    );

    return endAnimationState;
  }

  static int getSelectedHourFromTabIndex(int index, ForecastDay selectedDay) {
    return selectedDay.hourlyWeather[index].dateTime.hour;
  }
}
