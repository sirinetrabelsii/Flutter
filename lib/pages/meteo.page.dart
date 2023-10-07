import 'package:flutter/material.dart';

class meteoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page meteo')),
      body: Center(
          child: Text(
        'meteo',
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}
