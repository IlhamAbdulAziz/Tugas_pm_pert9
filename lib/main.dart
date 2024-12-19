import 'package:flutter/material.dart';
import 'package:tugas_pm/layout/home/GridViewLearning.dart';
import 'package:tugas_pm/layout/home/homepagewithmenu.dart';
import 'package:tugas_pm/layout/home/ListViewLearning.dart';
import 'package:tugas_pm/layout/home/MyHomepage.dart';
import 'package:tugas_pm/layout/home/newspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomepage(),
        '/gridview': (context) => const GridViewLearning(),
        '/listview': (context) => const ListViewLearning(),
        '/menu': (context) => const Homepagewithmenu(),
        '/newspage': (context) => const Newspage(),
      },
    );
  }
}