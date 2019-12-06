import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var currentLocation = LocationData;
  var location = new Location();
  var lat = 0.0;
  var lng = 0.0;
  
 var loctionText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Location'),
      ) ,
      body: ListView(
          children: [
            FlatButton(
              child: Text('Get-Loction'),
              onPressed: () =>{
                print('pressed'),
                location.onLocationChanged().listen((LocationData currentLocation) {
                  this.setState((){
                     lat =currentLocation.latitude;
                     lng=currentLocation.longitude;
                  });
                })
              },
            ),
            Center(
              child: Text('lat/lng:$lat /$lng'),
            )
          ],
        )
      
    );
  }
}
