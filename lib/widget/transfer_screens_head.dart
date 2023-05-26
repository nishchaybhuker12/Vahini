import 'package:app/theme.dart';
import 'package:flutter/material.dart';

import '../main_home_screen.dart';

class TransferScreensHead extends StatelessWidget {
  const TransferScreensHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: mainBlue,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainHomeScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.home_filled,
            color: mainBlue,
          ),
        ),
      ],
    );
  }
}
