import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      home: SharedPreferencesExample(),
    );
  }
}

class SharedPreferencesExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SharedPreferencesExample();
}

class _SharedPreferencesExample extends State<SharedPreferencesExample> {
  SharedPreferences _prefs;

  int _numberPref = 0;
  bool _boolPref = false;

  static const String kNumberPrefKey = 'number_pref';
  static const String kBoolPrefKey = 'number_pref';

  @override
  void initState() {
    // TODO: implement initState
    SharedPreferences.getInstance()
      ..then(
            (prefs) {
          setState(() {
            this._prefs = prefs;
            _loadNumberPref();
            _loadBoolPref();
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Text('Number Preference'),
                  Text(this._numberPref.toString()),
                  MaterialButton(
                    color: Colors.grey,
                    child: Text('Increment'),
                    onPressed: () {
                      this._setNumberPref(this._numberPref + 1);
                    },
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text('Boolean Preference'),
                  Text(this._boolPref.toString()),
                  MaterialButton(
                    color: Colors.grey,
                    child: Text('Toogle'),
                    onPressed: () {
                      this._setBoolPref(!this._boolPref);
                    },
                  ),
                ],
              ),
            ],
          ),
          MaterialButton(
            color: Colors.grey,
            child: Text('Reset Data'),
            onPressed: () {
              _resetDataPref();
            },
          ),
        ],
      ),
    );
  }

  Future<Null> _setNumberPref(int value) async {
    await this._prefs.setInt(kNumberPrefKey, value);
    _loadNumberPref();
  }

  Future<Null> _setBoolPref(bool value) async {
    await this._prefs.setBool(kBoolPrefKey, value);
    _loadBoolPref();
  }

  Future<Null> _resetDataPref() async {
    await this._prefs.remove(kNumberPrefKey);
    await this._prefs.remove(kBoolPrefKey);
    _loadNumberPref();
    _loadBoolPref();
  }

  void _loadNumberPref() =>
      setState(() {
        this._numberPref = this._prefs.getInt(kNumberPrefKey) ?? 0;
      });

  void _loadBoolPref() =>
      setState(() {
        this._boolPref = this._prefs.getBool(kBoolPrefKey) ?? false;
      });
}
