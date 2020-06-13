import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
}

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
        primarySwatch: Colors.orange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weatherData;
  var temp = 20;
  var feelsLike = 16;
  var weatherMain = "Showers";
  var weatherDesc = "light showers";
  var wind = 6.7;
  var uvi = 7.1;
  var humidity = 54;

  // fetchWeatherData() async {
  //   final response = await http.get("https://api.openweathermap.org/data/2.5/onecall?lat=38.687252&lon=-9.147665&units=metric&exclude=hourly,daily&appid=6abed2277b09f87c654f1fbcd4c9b5a8");

  //   if (response.statusCode == 200) {
  //     weatherData = json.decode(response.body);

  //     String weatherDescription = weatherData['current']['weather'][0]['description'];

  //     setState(() {
  //       temp = weatherData['current']['temp'];
  //       weatherDesc = weatherDescription[0].toUpperCase() + weatherDescription.substring(1);
  //       weatherMain = weatherData['current']['weather'][0]['main'];
  //       feelsLike = weatherData['current']['feels_like'];
  //       wind = weatherData['current']['wind_speed'];
  //       uvi = weatherData['current']['uvi'];
  //       humidity = weatherData['current']['humidity'];

  //     });
  //   }
  //   else {
  //     weatherData = "Unable to get weather data";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // fetchWeatherData();
    double screenWidth = MediaQuery.of(context).size.width*0.8;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Container(
        // width: screenWidth,
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Temp', style: TextStyle(color: Colors.grey[400])),
                Text('Feels like', style: TextStyle(color: Colors.grey[400])),
              ]
            ),
            Flexible(
            flex:1,
            child: 
              AutoSizeText(
                "$temp°c / $feelsLike°c",
                style: TextStyle(fontSize: 150, color: Colors.orange[900]),
                maxLines: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Image(image: AssetImage('build/flutter_assets/images/showers.png'), width: screenWidth/1.5),
            ),
            Flexible(
              flex:1,
              child: AutoSizeText(
                "$weatherMain",
                style: TextStyle(fontSize: 150, color: Colors.grey[400]),
                maxLines: 1,
              ),
            ),
            // Flexible(
            //   flex:1,
            //   child: AutoSizeText(
            //     "$weatherDesc",
            //     style: TextStyle(fontSize: 70, color: Colors.grey[400]),
            //     maxLines: 1,
            //   ),
            // ),

            // New Section
            Container(
              padding: EdgeInsets.all(30.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image(image: AssetImage('build/flutter_assets/images/wind.png')),
                    Text('$wind m/s', style: TextStyle(height:2.0, color: Colors.grey[400], fontWeight: FontWeight.bold))
                  ]
                ),
                Column(
                  children: <Widget>[
                    Image(image: AssetImage('build/flutter_assets/images/uvi.png')),
                    Text('$uvi', style: TextStyle(height:2.0, color: Colors.grey[400], fontWeight: FontWeight.bold))
                  ]
                ),
                Column(
                  children: <Widget>[
                    Image(image: AssetImage('build/flutter_assets/images/humidity.png')),
                    Text('$humidity%', style: TextStyle(height:2.0, color: Colors.grey[400], fontWeight: FontWeight.bold))
                  ]
                ),
              ],
          ),
        ),
      ],
    ),
  ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: fetchWeatherData,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
