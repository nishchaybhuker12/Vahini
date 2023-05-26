import 'package:flutter/material.dart';

import '../theme.dart';

class TopNavText extends StatelessWidget {
  const TopNavText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: mainBlue,
        fontSize: 14,
        fontFamily: 'Outfit-Regular',
      ),
    );
  }
}
