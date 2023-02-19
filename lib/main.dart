import 'package:flutter/material.dart';
import 'AddPage.dart';
import 'HomePage.dart';
import 'ProgressPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '75 Hard Challenge',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var pages = [
    HomePage(),
    AddPage(),
    ProgressPage()
  ];

  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
            backgroundColor: Color.fromRGBO(16, 28, 67, 1),
          ),
          BottomNavigationBarItem(
            label: 'Add',
            icon: Icon(
              Icons.add,
            ),
            backgroundColor: Color.fromRGBO(16, 28, 67, 1),
          ),
          BottomNavigationBarItem(
            label: 'Progress',
            icon: Icon(
              Icons.done,
            ),
            backgroundColor: Color.fromRGBO(16, 28, 67, 1),
          )
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        elevation: 0,
        onTap: changePage,
      ),
    ));
  }
}
