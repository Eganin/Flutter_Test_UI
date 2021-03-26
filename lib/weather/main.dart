import 'package:flutter/material.dart';

const white = Colors.white;
const red = Colors.red;

void main() => runApp(MyApp());

Widget _subtitle5({String text = ''}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 22,
      color: white,
    ),
  );
}

Widget _subtitle6({String text = ''}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 32,
      color: white,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _createAppBar(),
        body: _buildBody(),
        backgroundColor: red,
      ),
    );
  }
}

Widget _createAppBar() {
  return AppBar(
    title: Text(
      'Weather Forecast',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    centerTitle: true,
    backgroundColor: red,
    iconTheme: IconThemeData(
      color: white,
    ),
  );
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _textField(),
            Divider(),
            _cityDetail(),
            Divider(),
            _temperatureDetail(),
            Divider(),
            _extraWeatherDetail(),
            Divider(),
            Divider(),
            Divider(),
            _subtitle5(text: '7-DAY WEATHER FORECAST'),
            Divider(),
            SizedBox(
              height: 130.0,
              child: _listView(),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _textField() {
  return TextField(
    style: TextStyle(
      height: 0.3,
      color: white,
    ),
    decoration: InputDecoration(
      labelText: 'Enter City Name',
      icon: Icon(
        Icons.search,
        color: white,
      ),
      labelStyle: TextStyle(color: white),
    ),
  );
}

Widget _cityDetail() {
  return Padding(
    padding: EdgeInsets.only(right: 16, left: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _subtitle6(text: 'Murmansk Oblast, RU'),
        Divider(),
        _subtitle5(
          text: 'Friday, Mar 20, 2020',
        ),
      ],
    ),
  );
}

Widget _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Icon(
        Icons.wb_sunny,
        size: 100,
        color: white,
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '14 F',
            style: TextStyle(
              fontSize: 50,
              color: white,
            ),
          ),
          _subtitle5(
            text: 'LIGHT SNOW',
          ),
        ],
      ),
    ],
  );
}

Widget _extraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _weatherDetail(icon: Icons.ac_unit, text: 'km/hr', percent: 5),
      _weatherDetail(icon: Icons.ac_unit, text: '%', percent: 3),
      _weatherDetail(icon: Icons.ac_unit, text: '%', percent: 20),
    ],
  );
}

Widget _weatherDetail({IconData icon, String text, int percent}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        icon,
        color: white,
        size: 50,
      ),
      SizedBox(
        height: 10,
      ),
      _subtitle5(text: percent.toString()),
      Text(
        text,
        style: TextStyle(color: white),
      ),
    ],
  );
}

Widget _listView() {
  final List<ListItem> items = List<ListItem>.generate(
      7,
      (index) => ListItem(
            dayOfTheWeek: getDay(position: index),
            icon: Icons.wb_sunny,
            temp: index + 20,
          ));

  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 160,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: EdgeInsets.all(8),
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _subtitle5(text: item.dayOfTheWeek.name),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _subtitle6(text: '${item.temp} F'),
                  Divider(),
                  Icon(
                    item.icon,
                    color: white,
                    size: 50,
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

class ListItem {
  final DayOfTheWeek dayOfTheWeek;
  final int temp;
  final IconData icon;

  ListItem({this.dayOfTheWeek, this.temp, this.icon});
}

enum DayOfTheWeek {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

extension DayOfTheWeekExtension on DayOfTheWeek {
  String get name {
    switch (this) {
      case DayOfTheWeek.Monday:
        return 'MONDAY';
      case DayOfTheWeek.Tuesday:
        return 'TUESDAY';
      case DayOfTheWeek.Wednesday:
        return 'WEDNESDAY';
      case DayOfTheWeek.Thursday:
        return 'THURSDAY';
      case DayOfTheWeek.Friday:
        return 'FRIDAY';
      case DayOfTheWeek.Saturday:
        return 'SATURDAY';
      case DayOfTheWeek.Sunday:
        return 'SUNDAY';
      default:
        return null;
    }
  }
}

DayOfTheWeek getDay({int position}) {
  switch (position) {
    case 0:
      return DayOfTheWeek.Monday;
    case 1:
      return DayOfTheWeek.Tuesday;
    case 2:
      return DayOfTheWeek.Wednesday;
    case 3:
      return DayOfTheWeek.Thursday;
    case 4:
      return DayOfTheWeek.Friday;
    case 5:
      return DayOfTheWeek.Saturday;
    case 6:
      return DayOfTheWeek.Sunday;
    default:
      return null;
  }
}
