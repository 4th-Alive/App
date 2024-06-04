import 'package:app/src/widgets/screen_header.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ScreenHeader(title: 'Diary', showProfile: true,)
        ],
      ),
    );
  }
}