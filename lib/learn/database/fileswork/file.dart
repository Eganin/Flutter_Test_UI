import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work local files',
      home: ReadAndWriteFile(),
    );
  }
}

class ReadAndWriteFile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadAndWriteFileState();
}

class _ReadAndWriteFileState extends State<ReadAndWriteFile> {
  final TextEditingController _textController = TextEditingController();

  static const String kLocalFileName = 'demo_localfile.txt';
  String _localFileContent = '';
  String _localFilePath = kLocalFileName;

  @override
  void initState() {
    this._readTextFromLocalFile();
    this
        ._gelLocalFile
        .then((file) => setState((() => this._localFilePath = file.path)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text('Work local files'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Write to local file',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              focusNode: textFieldFocusNode,
              controller: _textController,
              style: TextStyle(fontSize: 20),
            ),
            ButtonBar(
              children: [
                MaterialButton(
                  child: Text(
                    'Load',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    this._readTextFromLocalFile();
                    this._textController.text = this._localFileContent;
                    FocusScope.of(context).requestFocus(textFieldFocusNode);
                  },
                ),
                MaterialButton(
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    await this._writeTextLocalFile(this._textController.text);
                    this._textController.clear();
                    await this._readTextFromLocalFile();
                  },
                ),
              ],
            ),
            Divider(
              height: 20,
            ),
            Text(
              'Local file path: ',
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              this._localFilePath,
              style: Theme.of(context).textTheme.subhead,
            ),
            Divider(
              height: 20,
            ),
            Text(
              'Local file content: ',
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              this._localFileContent,
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      ),
    );
  }

  Future<String> get _getLocalPath async {
    // получаем папки приложения
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _gelLocalFile async {
    final path = await _getLocalPath;
    return File('$path/$kLocalFileName');
  }

  Future<File> _writeTextLocalFile(String text) async {
    final file = await _gelLocalFile;
    return file.writeAsString(text);
  }

  Future<String> _readTextFromLocalFile() async {
    String content;

    try {
      final file = await _gelLocalFile;
      content = await file.readAsString();
    } catch (e) {
      content = 'Error : $e';
    }
    setState(() {
      this._localFileContent = content;
    });

    return content;
  }
}
