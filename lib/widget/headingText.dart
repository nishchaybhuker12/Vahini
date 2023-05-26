import 'package:flutter/material.dart';

import '../theme.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: mainBlue,
        fontFamily: 'Outfit-Bold',
      ),
    );
  }
}
