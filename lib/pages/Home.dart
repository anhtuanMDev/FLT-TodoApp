// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:simple_app/pages/Permant.dart';
import 'package:simple_app/pages/Time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todoTimes = [];
  int _selectedIndex = 0;
  final List<Widget> _children = [
    const Permant(),
    const Time(todo: []),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String titleName = 'To Do List'.toUpperCase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titleName),
          centerTitle: true,
        ),
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Permanent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Time',
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.blue[300],
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ));
  }
}
