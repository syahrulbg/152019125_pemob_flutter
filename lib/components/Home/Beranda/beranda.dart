import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarListView(),
    );
  }
}

class BelajarListView extends StatelessWidget {
  final List bulan = [
    "Cicilan Pinjaman 12 Bulan",
    "Cicilan Pinjaman 6 Bulan",
    "Cicilan Pinjaman 3 Bulan",
    "Cicilan Sesuka Hati",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        title: Text("Ajukan Pinjaman"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(bulan[index], style: TextStyle(fontSize: 14)),
            ),
          );
        },
        itemCount: bulan.length,
      ),
    );
  }
}
