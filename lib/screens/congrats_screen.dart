import 'package:app/main_home_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../funtion.dart';
import '../theme.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  final audioPlayer = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    Navigator.pop(context);
    super.dispose();
  }

  void initState() {
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    if (vahini) {
      VoiceController()
          .speak('Transaction has been made successfully', audioPlayer);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 24),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .0,
              ),
              Stack(
                children: [
                  Positioned(
                    left: size.width * .27,
                    top: size.height * .35,
                    child: Text(
                      'Success!!!',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'OutFit-Bold',
                          fontSize: 36),
                    ),
                  ),
                  LottieBuilder.asset('assets/lottie/success.json'),
                ],
              ),
              // Icon(
              //   Icons.check_circle,
              //   color: Colors.green,
              //   size: 80,
              // ),

              SizedBox(
                height: size.height * .04,
              ),
              const Divider(
                color: Color(0xffCBCBCB),
                thickness: .8,
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                'You have sent',
                style: TextStyle(
                    fontFamily: 'OutFit-Regular',
                    fontSize: 22,
                    color: mainBlue),
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Text(
                'Rs. 5000',
                style: TextStyle(
                  color: mainOrange,
                  fontFamily: 'OutFit-Bold',
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: size.height * .015,
              ),
              Text(
                'to Ritik Raj on 24th November, 2022\n                       at 07:05 PM ',
                style: TextStyle(
                    fontFamily: 'OutFit-Regular',
                    fontSize: 22,
                    color: mainBlue),
              ),
              SizedBox(
                height: size.height * .07,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (vahini) {
                      vahini = !vahini;
                    }
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainHomeScreen(),
                    ),
                  );
                },
                child: Container(
                  width: size.width * .6,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: mainOrange,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      'Back to homepage',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OutFit-SemiBold',
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
