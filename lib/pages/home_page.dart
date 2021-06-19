import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'vanita';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
          child: Container(
        child: Text('Welcome $name to $days days of flutter'),
      )),
      drawer: Drawer(),
    );
  }
}
