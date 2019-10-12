import 'package:flutter/material.dart';
import 'package:weather_app/models/src/app_settings.dart';
import 'package:weather_app/models/src/weather.dart';
import 'package:weather_app/page/add_city_page.dart';
import 'package:weather_app/styles.dart';
import 'package:weather_app/utils/humanize.dart';
import 'package:weather_app/widget/segmented_control.dart';

class SettingsPage extends StatefulWidget {
  final AppSettings settings;

  const SettingsPage({Key key, this.settings}) : super(key: key);

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  List<String> get temperatureOptions => Humanize.enumValues(TemperatureUnit.values);

  void _handleCityActiveChange(bool b, City city) {
    setState(() {
      city.active = b;
    });
  }

  void _handleTemperatureUnitChange(int selection) {
    setState(() {
      widget.settings.selectedTemperature = TemperatureUnit.values.toList()[selection];
    });
  }

  void _handleDismiss(DismissDirection dir, City removedCity) {
    if (dir == DismissDirection.endToStart) {
      allAddedCities.removeWhere((city) => city == removedCity);
      if (widget.settings.activeCity == removedCity) {
        widget.settings.activeCity = allAddedCities.firstWhere((city) => city.active);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings Page',
          style: TextStyle(color: AppColor.textColorLight),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Temperature Unit'),
            SegmentedControl(
              temperatureOptions,
              onSelectionChanged: (int selection) => _handleTemperatureUnitChange(selection),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add new city"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return AddNewCityPage();
                    },
                  ),
                );
              },
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allAddedCities.length,
                itemBuilder: (BuildContext context, int index) {
                  final city = allAddedCities[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dir) => _handleDismiss(dir, city),
                    background: Container(
                      child: Icon(Icons.delete_forever),
                      decoration: BoxDecoration(color: Colors.red[700]),
                    ),
                    key: ValueKey(city),
                    child: CheckboxListTile(
                      value: city.active,
                      title: Text(city.name),
                      onChanged: (bool b) => _handleCityActiveChange(b, city),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
