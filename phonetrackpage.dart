import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhoneTrackPage extends StatefulWidget {
  @override
  _PhoneTrackPageState createState() => _PhoneTrackPageState();
}

class _PhoneTrackPageState extends State<PhoneTrackPage> {
  TextEditingController userInputController = TextEditingController();
  String result = '';

void _runPythonScript(String option, String userInput) async {
  try {
    var response = await http.post(
      Uri.parse('http://127.0.0.1:5000/execute-script'),
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
      body: jsonEncode({'option': option, 'userInput': userInput}),
    );

    if (response.statusCode == 200) {
      // Decode the JSON response
      var decodedResponse = json.decode(response.body);

      // Extract information from the decoded response
      var data = decodedResponse['data'];

      setState(() {
        result = data.toString();
      });
    } else {
      setState(() {
        result = 'Error: ${response.reasonPhrase}';
      });
    }
  } catch (e) {
    setState(() {
      result = 'Error: $e';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Track'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: userInputController,
              decoration: InputDecoration(
                labelText: 'Enter the phone number:',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _runPythonScript('3', userInputController.text);
              },
              child: Text('Track Phone'),
            ),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

