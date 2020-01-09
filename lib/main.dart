import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async {
  Map data = await getAllData();

  print("The cod is:" + data['cod']);
  print("The cod is:" + data['message'].toString());
  print("The cnt is:" + data['cnt'].toString());
  print("The list is:" + data['list'][0]['dt'].toString());
  print("The main is:" + data['list'][1]['main']['temp'].toString());
  print("The weather is:" + data['list'][1]['weather'][0]['main'].toString());
  print("The wind is:" + data['list'][1]['wind']['speed'].toString());
  print("The city is:" + data['city']['name']);
  print("The coord is:" + data['city']['coord']['lat'].toString());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Weather Application"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 800.0,
        child: Stack(
          children: <Widget>[
            Container(
              height: 800,
              child: Image(
                image: AssetImage("asset/pexels-photo-395196.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 50.0,
              child: Container(
                height: 100.0,
                margin: EdgeInsets.all(10.0),
                width: 400.0,
                color: Colors.deepOrange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['list'][0]['main']['temp'].toString() + "/F",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      data['list'][0]['weather'][0]['main'],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}

Future<Map> getAllData() async {
  var api =
      "https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=b6907d289e10d714a6e88b30761fae22";

  var data = await http.get(api);

  var jsonData = json.decode(data.body);

  return jsonData;
}
