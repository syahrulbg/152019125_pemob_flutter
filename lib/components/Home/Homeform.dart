import 'package:flutter/material.dart';
import 'package:toko/components/Home/Beranda/beranda.dart';
import 'package:toko/components/Home/Pesan/pesan.dart';
import 'package:toko/components/Home/akun/akun.dart';
import 'package:toko/components/Home/akun/akun.dart';
import 'package:toko/components/Home/perhitungan/calculator.dart';
import 'package:toko/components/Home/perhitungan/calculator2.dart';
import 'package:toko/components/Home/dashboard/dashboard.dart';

class BelajarNavBar extends StatefulWidget {
  @override
  _BelajarNavBarState createState() => _BelajarNavBarState();
}

class _BelajarNavBarState extends State<BelajarNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Dashboard(),
    BelajarListView(),
    Calculator(),
    ParsingPage(),
    MathPage(),
    Biodata()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pinjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Perhitungan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Tanya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Rumus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Data Diri',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 37, 37, 37),
        unselectedItemColor: Color.fromARGB(255, 193, 193, 193),
        showUnselectedLabels: true,
      ),
    );
  }
}
