import 'package:flutter/material.dart';

class PassingPage extends StatelessWidget {
  const PassingPage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive Data'),
      ),
      body: Center(
        child: Text(
          text,
          style:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 53, 53, 53)),
        ),
      ),
    );
  }
}
