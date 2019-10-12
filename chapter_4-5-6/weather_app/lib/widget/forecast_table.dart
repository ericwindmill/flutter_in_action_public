import 'package:flutter/material.dart';
import 'package:weather_app/models/src/app_settings.dart';
import 'package:weather_app/models/src/weather.dart';
import 'package:weather_app/utils/date_utils.dart';
import 'package:weather_app/utils/forecast_animation_utils.dart';
import 'package:weather_app/widget/color_transition_icon.dart';
import 'package:weather_app/widget/color_transition_text.dart';

class ForecastTableView extends StatelessWidget {
  final AppSettings settings;
  final AnimationController controller;
  final Tween<Color> textColorTween;
  final Forecast forecast;

  ForecastTableView({this.textColorTween, this.controller, this.forecast, this.settings});

  IconData _getWeatherIcon(Weather weather) {
    return AnimationUtil.weatherIcons[weather.description];
  }

  int _temperature(int temp) {
    if (settings.selectedTemperature == TemperatureUnit.fahrenheit) {
      return Temperature.celsiusToFahrenheit(temp);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.body1;
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 48.0,
      ),
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(100.0),
          2: FixedColumnWidth(20.0),
          3: FixedColumnWidth(20.0),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: List.generate(7, (int index) {
          ForecastDay day = forecast.days[index];
          Weather dailyWeather = forecast.days[index].hourlyWeather[0];
          var weatherIcon = _getWeatherIcon(dailyWeather);
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ColorTransitionText(
                    text: DateUtils.weekdays[dailyWeather.dateTime.weekday],
                    style: textStyle,
                    animation: textColorTween.animate(controller),
                  ),
                ),
              ),
              TableCell(
                child: ColorTransitionIcon(
                  icon: weatherIcon,
                  animation: textColorTween.animate(controller),
                  size: 16.0,
                ),
              ),
              TableCell(
                child: ColorTransitionText(
                  text: _temperature(day.max).toString(),
                  style: textStyle,
                  animation: textColorTween.animate(controller),
                ),
              ),
              TableCell(
                child: ColorTransitionText(
                  text: _temperature(day.min).toString(),
                  style: textStyle,
                  animation: textColorTween.animate(controller),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
