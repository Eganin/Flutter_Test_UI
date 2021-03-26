import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _createAppBar(),
        body: _buildBody(),
      ),
    );
  }
}

Widget _createAppBar() {
  return AppBar(
    title: Text(
      'Weather',
      style: TextStyle(color: Colors.black87),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    // leading -  элементы в левой части AppBar
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
    // actions - иконки с права AppBar
    actions: [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {},
      )
    ],
    iconTheme: IconThemeData(
      color: Colors.black54,
    ),
    brightness: Brightness.light,
  );
}

Widget _buildBody() {
  // ScrollView
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings()
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _headerImage() {
  return Image.network(
    'https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Fsundaytimes%2Fprodmigration%2Fweb%2Fbin%2F367e8f56-10e5-4d76-9416-947e2a05dfe3.jpg?crop=1500%2C1000%2C0%2C0&resize=1180',
    fit: BoxFit.cover,
  );
}

Widget _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque odio ligula, sagittis ut mi vel, tincidunt porttitor urna. Proin eu pretium diam. Curabitur gravida diam volutpat, fermentum nunc nec, accumsan odio.',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    ],
  );
}

Widget _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      // SizedBox - реализует заполнение пустого пространства
      SizedBox(
        width: 16.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15 Clear',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Sverdlovskaya oblast , Nizhny Tagil',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(
      8,
      (int index) => Chip(
        label: Text(
          '${index + 20} C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue[300],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey[100],
      ),
    ),
  );
}

Widget _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: Colors.black,
        size: 15,
      ),
      Icon(
        Icons.star,
        color: Colors.black,
        size: 15,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Info with openweathermap.com',
        style: TextStyle(fontSize: 15),
      ),
      Divider(),
      stars,
    ],
  );
}
