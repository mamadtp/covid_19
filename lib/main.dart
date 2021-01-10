import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './widgets/my_header.dart';
import './widgets/my_dropdown.dart';
import './widgets/details.dart';
import './widgets/prevent.dart';
import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  String selectedCountry = '';
  List<String> countries = [];

  List<Map> today = [
    {
      'title': 'مبتلاشدگان',
      'number': '0',
      'color': kInfectedColor,
    },
    {
      'title': 'مرگ',
      'number': '0',
      'color': kDeathColor,
    },
  ];

  List<Map> total = [
    {
      'title': 'مبتلاشدگان',
      'number': '0',
      'color': kInfectedColor,
    },
    {
      'title': 'مرگ',
      'number': '0',
      'color': kDeathColor,
    },
    {
      'title': 'بهبودیافتگان',
      'number': '0',
      'color': kRecovercolor,
    }
  ];

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    http
        .get('https://coronavirus-19-api.herokuapp.com/countries')
        .then((value) {
      var response = json.decode(value.body);
      for (var item in response) {
        countries.add(item['country']);
      }

      today[0]['number'] = response[0]['todayCases'].toString();
      today[1]['number'] = response[0]['todayDeaths'].toString();

      total[0]['number'] = response[0]['cases'].toString();
      total[1]['number'] = response[0]['deaths'].toString();
      total[2]['number'] = response[0]['recovered'].toString();

      setState(() {
        selectedCountry = 'World';
        isLoading = false;
        // onChangeHandler('World');
      });
    });

    super.initState();
  }

  void onChangeHandler(selected) {
    setState(() {
      selectedCountry = selected;
      isLoading = true;
    });
    http
        .get('https://coronavirus-19-api.herokuapp.com/countries/$selected')
        .then((value) {
      var response = json.decode(value.body);
      today[0]['number'] = response['todayCases'].toString();
      today[1]['number'] = response['todayDeaths'].toString();

      total[0]['number'] = response['cases'].toString();
      total[1]['number'] = response['deaths'].toString();
      total[2]['number'] = response['recovered'].toString();

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> checkLoading() {
      if (isLoading)
        return [
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ];
      else
        return [
          Details(
            title: 'امروز',
            cases: today,
            spaceAround: true,
          ),
          Details(
            title: 'امار کلی',
            cases: total,
            spaceAround: false,
          ),
        ];
    }

    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(),
            MyDropdown(
              value: selectedCountry,
              items: countries,
              onChange: onChangeHandler,
            ),
            ...checkLoading(),
            Prevent(),
          ],
        ),
      )),
    );
  }
}
