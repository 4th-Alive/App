import 'package:app/src/screens/diary/diary_screen.dart';
import 'package:app/src/screens/home/home_screen.dart';
import 'package:app/src/screens/question/question_screen.dart';
import 'package:app/src/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'together: with',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFF1C40F)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'together: with'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIdx = index;
          });
        },
        // indicatorColor: Colors.amber,
        selectedIndex: currentPageIdx,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.question_answer),
            icon: Icon(Icons.question_answer_outlined),
            label: 'Q&A',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book_outlined),
            label: 'Diary',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Setting',
          ),
        ],
      ),
      /*
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      */
      body: [
        HomeScreen(),
        QuestionScreen(),
        DiaryScreen(),
        SettingScreen()
      ][currentPageIdx],
    );
  }
}