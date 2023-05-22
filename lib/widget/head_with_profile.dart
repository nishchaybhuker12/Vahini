import 'package:flutter/material.dart';

import '../theme.dart';

class HeadWithProfile extends StatelessWidget {
  const HeadWithProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.asset('assets/Bob-Logo-Orange.png'),
        const Spacer(),
        const Icon(Icons.search, size: 24),
        const SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [primaryShadow],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: size.width * 0.07,
            child: Text(
              'VA',
              style: TextStyle(
                  color: mainOrange, fontSize: 16, fontFamily: 'Outfit-Bold'),
            ),
          ),
        ),
      ],
    );
  }
}
