import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowIPPage extends StatefulWidget {
  @override
  _ShowIPPageState createState() => _ShowIPPageState();
}

class _ShowIPPageState extends State<ShowIPPage> {
  TextEditingController userInputController = TextEditingController();
  String result = '';

  void _runPythonScript(String option, String userInput) async {
    try {
      // Use http.post to send data to your Flask server
      // Update the URL with your server's address
      var response = await http.post(
        Uri.parse('http://127.0.0.1:5000/execute-script'),
        body: {'option': option, 'userInput': userInput},
      );

      setState(() {
        result = response.body;
      });
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
        title: Text('Show Your IP'),
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
                labelText: 'Enter your username:',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _runPythonScript('2', userInputController.text);
              },
              child: Text('Show IP'),
            ),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
