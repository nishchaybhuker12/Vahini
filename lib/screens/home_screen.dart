import 'package:app/screens/transfer_screen2.dart';
import 'package:app/theme.dart';
import 'package:app/widget/head_with_profile.dart';
import 'package:app/widget/ripple_animation.dart';
import 'package:app/widget/top_nav_text.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widget/headingText.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
// bool _isLoading = false;
// void  callLoading()
//   {
//     setState(() {
//       _isLoading = true;
//     });
//   }
//
//   void  disconnectLoading()
//   {
//     setState(() {
//       _isLoading = false;
//     });
//   }


  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadWithProfile(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Accounts',
                        style: TextStyle(
                            color: mainBlue,
                            fontSize: 14,
                            fontFamily: 'Outfit-Bold'),
                      ),
                      TopNavText(
                        text: 'Invest',
                      ),
                      TopNavText(text: 'Borrow'),
                      TopNavText(text: 'Shop & Pay'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.height * .009),
                    child: SizedBox(
                      width: size.width * 0.1,
                      child: Divider(
                        color: mainOrange,
                        thickness: 4,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 4.0, top: size.height * .028),
                    child: Image.asset('assets/amount-show.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.24, top: size.height * .02),
                    child: Image.asset('assets/view-all-account.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * .028, bottom: size.height * .018),
                    child: HeadingText(text: "What's Trending"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      optionCircle(size, 'assets/shopping-cart.png',
                          'Compare & \n       Shop'),
                      optionCircle(
                          size, 'assets/speedometer 1.png', 'Credit Score'),
                      optionCircle(
                          size,
                          'assets/monitoring_FILL0_wght400_GRAD0_opsz48 1.png',
                          'Apply IPO'),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .025,
                  ),
                  HeadingText(text: 'My BOB'),
                  SizedBox(
                    height: size.height * .018,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransferScreen2(),
                              ),
                            );
                          },
                          child: optionCircle(
                              size, 'assets/arrow-right.png', 'Transfer')),
                      optionCircle(size, 'assets/book.png', 'Passbook'),
                      optionCircle(size, 'assets/smartphone.png',
                          '    Mobile \nRecharge'),
                      optionCircle(
                          size, 'assets/tv.png', '      DTH \nRecharge'),
                    ],
                  )
                ],
              ),
            ),
            // if(_isLoading) animation(size)
          ],
        ),
      ),
    );
  }

  Widget animation(Size size) {
    return Container(
      color: Color(0x2F000000),
      height: size.height,
      width: size.width,
      child: Center(
        child:
        LottieBuilder.asset('assets/lottie/voice-loading-indicator.json'),
        // RippleAnimation( repeat: true
        // ,color: mainOrange,)
      ),
    );
  }

  Text headingText(String text) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 20, color: mainBlue, fontFamily: 'Outfit-Bold'),
    );
  }

  Widget optionCircle(Size size, String image, String text) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [primaryShadow],
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: size.width * .06,
            backgroundColor: Colors.white,
            child: Center(child: Image.asset(image)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            softWrap: true,
            style: TextStyle(
                fontFamily: 'Outfit-Medium', fontSize: 11, color: mainBlue),
          ),
        )
      ],
    );
  }
}
