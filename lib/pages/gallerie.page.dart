import 'package:flutter/material.dart';

class galleriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page gallerie')),
      body: Center(
          child: Text(
        'gallerie',
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}
