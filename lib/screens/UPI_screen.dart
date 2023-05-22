import 'package:app/theme.dart';
import 'package:app/widget/head_widget.dart';
import 'package:flutter/material.dart';

class UPIScreen extends StatelessWidget {
  const UPIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 24),
          child: Column(
            children: [
              const HeadWidget(),
              const Divider(
                color: Color(0xffCBCBCB),
                thickness: .8,
              ),
              Image.asset('assets/upi-frame.png'),
              SizedBox(
                width: size.width * .15,
                child: Divider(
                  color: mainOrange,
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Container(
                decoration: containerDeco,
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: [
                    Image.asset('assets/pay.png'),
                    Image.asset('assets/receive.png'),
                    Image.asset('assets/scanqr.png'),
                    Image.asset('assets/mandate.png'),
                    Image.asset('assets/approval.png'),
                    Image.asset('assets/more.png'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height*0.03,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: containerDeco,
                child: Row(
                  children: [
                    Image.asset('assets/storefront.png'),
                    SizedBox(
                      width: size.width*.025,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'I am Merchant',
                          style: TextStyle(
                              color: mainBlue, fontFamily: 'Outfit-Bold'),
                        ),
                        Text(
                          'Special Setup for Merchants',
                          style: TextStyle(
                              color: mainBlue, fontFamily: 'Outfit-Regular'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: mainOrange,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
