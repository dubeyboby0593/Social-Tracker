import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IPTrackPage extends StatefulWidget {
  @override
  _IPTrackPageState createState() => _IPTrackPageState();
}

class _IPTrackPageState extends State<IPTrackPage> {
  TextEditingController ipController = TextEditingController();
  String result = '';

  void _trackIP() async {
    try {
      var response = await http.post(
        Uri.parse('http://127.0.0.1:5000/tracker'),
        body: {
          'user_input': '1',
          'ip_address': ipController.text,
        },
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
        title: Text('IP Track'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: ipController,
              decoration: InputDecoration(
                labelText: 'Enter IP Address',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _trackIP,
              child: Text('Track IP'),
            ),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
