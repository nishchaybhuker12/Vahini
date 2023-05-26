import 'package:flutter/material.dart';

import '../theme.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/Bob-Logo-Orange.png'),
        const Spacer(),
        Icon(
          Icons.notifications_outlined,
          color: mainBlue,
        ),
      ],
    );
  }
}
