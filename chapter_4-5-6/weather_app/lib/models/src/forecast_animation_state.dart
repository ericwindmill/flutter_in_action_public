import 'dart:ui';

import 'package:weather_app/models/src/weather.dart';
import 'package:weather_app/styles.dart';

class ForecastAnimationState {
  final Color backgroundColor;
  final Color sunColor;
  final Color textColor;
  final Color cloudColor;
  final double verticalOffsetPosition;
  final double cloudHorizontalOffsetPosition;

  Offset get sunOffsetPosition => Offset(0.0, verticalOffsetPosition);
  Offset get cloudOffsetPosition =>
      Offset(cloudHorizontalOffsetPosition, verticalOffsetPosition + 0.5);

  ForecastAnimationState({
    this.backgroundColor,
    this.sunColor,
    this.textColor,
    this.cloudColor,
    this.verticalOffsetPosition,
    this.cloudHorizontalOffsetPosition,
  });

  factory ForecastAnimationState.stateForNextSelection(int hour, WeatherDescription condition) {
    var roundedInt = (3 * (hour / 3)).round();
    assert(roundedInt % 3 == 0);

    double cloudOffsetPosition =
        (condition == WeatherDescription.cloudy || condition == WeatherDescription.rain)
            ? 0.0
            : 1.2;

    switch (roundedInt) {
      case 0:
        return ForecastAnimationState(
          backgroundColor: AppColor.midnightSky,
          sunColor: AppColor.midnightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.midnightCloud,
          verticalOffsetPosition: -0.10,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 3:
        return ForecastAnimationState(
          backgroundColor: AppColor.twilightSky,
          sunColor: AppColor.twilightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.twilightCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 6:
        return ForecastAnimationState(
          backgroundColor: AppColor.dawnSky,
          sunColor: AppColor.dawnSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.dawnCloud,
          verticalOffsetPosition: 0.25,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 9:
        return ForecastAnimationState(
          backgroundColor: AppColor.dawnSky,
          sunColor: AppColor.dawnSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.dawnCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 12:
        return ForecastAnimationState(
          backgroundColor: AppColor.noonSky,
          sunColor: AppColor.noonSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.noonCloud,
          verticalOffsetPosition: -0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 15:
        return ForecastAnimationState(
          backgroundColor: AppColor.noonSky,
          sunColor: AppColor.noonSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.noonCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 18:
        return ForecastAnimationState(
          backgroundColor: AppColor.duskSky,
          sunColor: AppColor.duskSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.duskCloud,
          verticalOffsetPosition: 0.5,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 21:
      default:
        return ForecastAnimationState(
          backgroundColor: AppColor.nightSky,
          sunColor: AppColor.nightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.nightCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
    }
  }
}
