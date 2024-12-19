import 'package:flutter/material.dart';
import 'package:tugas_pm/layout/home/GridViewLearning.dart';
import 'package:tugas_pm/layout/home/ListViewLearning.dart';
import 'package:tugas_pm/layout/home/newspage.dart';
import 'PostNews.dart';

class Homepagewithmenu extends StatefulWidget {
  const Homepagewithmenu({Key? key}) : super(key: key);

  @override
  State<Homepagewithmenu> createState() => HomepagewithmenuState();
}

class HomepagewithmenuState extends State<Homepagewithmenu> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Newspage(),
    GridViewLearning(),
    ListViewLearning(),
    PostNews()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage With Menu'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.cyan,
          unselectedItemColor: Colors.redAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_3x3), label: 'GridView'),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'ListView',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: 'Post Data',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
