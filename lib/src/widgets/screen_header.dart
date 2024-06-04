import 'package:flutter/material.dart';

class ScreenHeader extends StatefulWidget {
  const ScreenHeader({super.key, required this.title, required this.showProfile});

  final String title;
  final bool showProfile;

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 32, top: 24, right: 32, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          if (widget.showProfile) Icon(Icons.account_circle_rounded, size: 36,)
        ],
      ),
    );
  }
}