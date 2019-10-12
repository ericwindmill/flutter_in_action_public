import 'package:weather_app/models/src/app_settings.dart';

class Forecast {
  City city;
  List<ForecastDay> days;

  Forecast({this.city, this.days});

  static ForecastDay getSelectedDayForecast(Forecast forecast, DateTime selectedDate) {
    return forecast.days.firstWhere((ForecastDay d) => d.date.day == selectedDate.day);
  }
}

class ForecastDay {
  List<Weather> hourlyWeather;
  DateTime date;
  int min;
  int max;

  static Weather getWeatherForHour(ForecastDay self, int hour) {
    if (hour == 0) {
      // DateTime hours run 1,2,3...22,23,0
      // 0 == midnight
      return self.hourlyWeather.last;
    }
    return self.hourlyWeather.firstWhere((Weather w) => w.dateTime.hour >= hour);
  }

  ForecastDay({this.hourlyWeather, this.date, this.min, this.max});
}

class Weather {
  City city;
  DateTime dateTime;
  Temperature temperature;
  WeatherDescription description;
  int cloudCoveragePercentage;
  String weatherIcon;

  Weather(
      {this.city,
      this.dateTime,
      this.temperature,
      this.description,
      this.cloudCoveragePercentage,
      this.weatherIcon});

  static Map<WeatherDescription, String> displayValues = {
    WeatherDescription.clear: "Clear",
    WeatherDescription.cloudy: "Cloudy",
    WeatherDescription.rain: "Rain",
    WeatherDescription.sunny: "Sunny",
  };
}

class Temperature {
  int current;
  TemperatureUnit temperatureUnit;

  static int celsiusToFahrenheit(int temp) => (temp * 9 / 5 + 32).floor();

  Temperature({this.current, this.temperatureUnit});
}

enum TemperatureUnit { celsius, fahrenheit }

enum WeatherDescription { clear, cloudy, sunny, rain }
