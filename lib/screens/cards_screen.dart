import 'package:app/widget/head_widget.dart';
import 'package:app/widget/headingText.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import '../widget/top_nav_text.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadWidget(),
              Row(
                children: [
                  Text(
                    'Cards',
                    style: TextStyle(
                        color: mainBlue,
                        fontSize: 14,
                        fontFamily: 'Outfit-Bold'),
                  ),
                  const SizedBox(width: 28,),
                  TopNavText(text: 'Wearables',),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*.01),
                child: SizedBox(
                  width: size.width * 0.07,
                  child: Divider(
                    color: mainOrange,
                    thickness: 4,
                  ),
                ),
              ),
              SizedBox(height: size.height*0.015,),
              HeadingText(text: 'Debit Card'),
              SizedBox(height: size.height*0.015,),
              showContainer(size,Icons.credit_card,'Manage Debit Cards'),
              showContainer(size,Icons.add_card,'Debit Card Request'),
              showContainer(size,Icons.credit_card,'Set Debit Card Pin'),
              showContainer(size,Icons.credit_card,'Debit Cards Hotlisting'),
              showContainer(size,Icons.credit_card,'Virtual Debit Cards'),
              showContainer(size,Icons.credit_card,'Link Cards'),
            ],
          ),
        ),
      ),
    );
  }

  Padding showContainer(Size size,IconData icon,String text) {
    return Padding(
              padding:  EdgeInsets.only(bottom: size.height*.025),
              child: Container(
                padding:  const EdgeInsets.all(18.0),
                  decoration: containerDeco.copyWith(borderRadius: BorderRadius.circular(56)),
                  child:Row(
                    children: [
                      Icon(icon,color:mainOrange,),
                      SizedBox(width: size.width*.03,),
                      TopNavText(text: 'Manage Debit Cards'),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios,color: mainBlue,)
                    ],
                  ),
                  ),
            );
  }
}
