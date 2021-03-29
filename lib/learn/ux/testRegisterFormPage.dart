import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _RequiredTextFieldTest extends StatelessWidget {
  final String labelText;
  final String hintText;
  String helperText = '';
  final IconData preffixIcon;
  TextInputType keyboardType;
  final TextEditingController controller;

  final IconData suffixIcon;

  _RequiredTextFieldTest(
      {this.labelText,
        this.hintText,
        this.helperText,
        this.preffixIcon,
        this.suffixIcon,
        this.keyboardType,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (val) => val.isEmpty ? '$labelText is required' : null,
      /*
      validator: (val) => keyboardType == TextInputType.phone
          ? _validatePhoneNumber(val)
              ? null
              : 'Phone number must be entered as (###)###-####'
          : _validateName,
       */
      // огрничение на вводимые символы
      inputFormatters: [
        if (keyboardType == TextInputType.phone)
        //FilteringTextInputFormatter.digitsOnly
          FilteringTextInputFormatter(RegExp(r'^[()\d -](1,15)$'), allow: true)
      ],
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        prefixIcon: Icon(preffixIcon),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.red,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class _DefaultTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  String helperText = '';
  final IconData icon;
  TextInputType keyboardType;
  final TextEditingController controller;

  _DefaultTextField(
      {this.labelText,
        this.hintText,
        this.helperText,
        this.icon,
        this.keyboardType,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => _validateEmail(val),
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: Icon(icon),
      ),
    );
  }
}

class RegisterFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  static final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];
  String _selectedCountry;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _RequiredTextFieldTest(
              labelText: 'Full Name *',
              hintText: 'What do people call you?',
              preffixIcon: Icons.person,
              suffixIcon: Icons.delete_outline,
              controller: _nameController,
            ),
            SizedBox(
              height: 10,
            ),
            _RequiredTextFieldTest(
              keyboardType: TextInputType.phone,
              labelText: 'Phone Number *',
              hintText: 'Where can we reach you?',
              helperText: 'Phone forat: (XXX)XXX-XXXX',
              preffixIcon: Icons.call,
              suffixIcon: Icons.delete_outline,
              controller: _phoneController,
            ),
            SizedBox(
              height: 10,
            ),
            _DefaultTextField(
              labelText: 'Email Address',
              hintText: 'Enter a email address',
              icon: Icons.mail,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                labelText: 'Country?',
              ),
              // данные в выпадающем списке
              items: _countries.map((country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              // действие при выбранном элементе из списка
              onChanged: (data) {
                print(data);
                setState(() {
                  _selectedCountry = data;
                });
              },
              // default value list
              value: _selectedCountry,
              validator: (val) {
                return val == null ? 'Please select a country' : null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _storyController,
              inputFormatters: [
                // ограничение на 100 вводимых символов
                LengthLimitingTextInputFormatter(100),
              ],
              decoration: InputDecoration(
                labelText: 'LifeStory',
                hintText: 'Tell us about your self',
                helperText: 'Keep it short, this is just a demo',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              // скрытие букв при вводе
              obscureText: _hidePass,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Enter the password',
                suffixIcon: IconButton(
                  icon:
                  Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: Icon(Icons.security),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: _validatePassword,
              controller: _confirmPassController,
              maxLength: 10,
              obscureText: _hidePass,
              decoration: InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm the password',
                icon: Icon(Icons.border_color),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: _submitForm,
              color: Colors.green,
              child: Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Form is valid');
      print(_nameController.text);
    }
  }

  String _validatePassword(String value) {
    if (_confirmPassController.text != _passController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }
}

String _validateName(String value) {
  // для использования регулярных выражений
  final _nameExp = RegExp(r'^[A-Za-z ]+$');
  if (value.isEmpty) {
    return 'Value is required';
  } else if (_nameExp.hasMatch(value)) {
    return 'Please enter alphabite char';
  }
}

bool _validatePhoneNumber(String value) {
  final _phoneExp = RegExp(r'^\(\d\d\d)\d\d\d-\d\d\d\d$');
  return _phoneExp.hasMatch(value);
}

String _validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email cannot be empty';
  } else if (!_RegisterFormPageState._emailController.text.contains('@')) {
    return 'Invalid email address';
  } else {
    return null;
  }
}