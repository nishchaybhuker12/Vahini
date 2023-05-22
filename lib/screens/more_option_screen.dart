import 'package:app/theme.dart';
import 'package:app/widget/headingText.dart';
import 'package:app/widget/top_nav_text.dart';
import 'package:flutter/material.dart';

import '../widget/head_with_profile.dart';

class MoreOptionScreen extends StatelessWidget {
  const MoreOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadWithProfile(),
              const Divider(
                color: Color(0xffCBCBCB),
                thickness: .8,
              ),
              SizedBox(
                height: size.height * .015,
              ),
              HeadingText(text: 'Quick Actions'),
              SizedBox(
                height: size.height * .025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  optionTab(size, Icons.block, 'Debit Card \n      Block'),
                  optionTab(
                      size, Icons.stop_circle_outlined, '   Stop \nCheque'),
                  optionTab(
                      size, Icons.receipt_long, 'Transaction\n       History'),
                  optionTab(
                      size, Icons.document_scanner, 'Generate \n    MMID'),
                ],
              ),
              SizedBox(
                height: size.height * .015,
              ),
              const Divider(
                color: Color(0xffCBCBCB),
                thickness: .8,
              ),
              SizedBox(
                height: size.height * .015,
              ),
              HeadingText(text: 'Explore'),
              SizedBox(
                height: size.height * .025,
              ),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                children: [
                  optionTab(size, Icons.person_outline_outlined,
                      '      My \nAccount'),
                  optionTab(
                      size, Icons.favorite_outline, '         My \nFavourites'),
                  optionTab(size, Icons.book, 'Passbook'),
                  optionTab(size, Icons.help_outline, 'Request \nServices'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column optionTab(Size size, IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          color: mainOrange,
        ),
        SizedBox(
          height: size.height * .01,
        ),
        TopNavText(text: text)
      ],
    );
  }
}
