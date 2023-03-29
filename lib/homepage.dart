import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var days = 5;
    return Scaffold(
      appBar: AppBar(
        title: Text("hay"),
      ),
      body: Center(
        child: Container(
          child: Text("vishal $days"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
