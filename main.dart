import 'package:flutter/material.dart';
import 'package:social_tracker/IPTrackPage.dart';
import 'package:social_tracker/exitpage.dart';
import 'package:social_tracker/phonetrackpage.dart';
import 'package:social_tracker/showippage.dart';
import 'package:social_tracker/usernametrackpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracker App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose an option:',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IPTrackPage()),
                  );
                },
                child: Text('IP Track'),
              ),
            ),
            Container(height: 14,),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShowIPPage()),
                  );
                },
                child: Text('Show Your IP'),
              ),
            ),
            Container(height: 14,),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhoneTrackPage()),
                  );
                },
                child: Text('Phone Track'),
              ),
            ),
            Container(height: 14,),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsernameTrackPage()),
                  );
                },
                child: Text('Username Track'),
              ),
            ),
            Container(height: 14,),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExitPage()),
                  );
                },
                child: Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

