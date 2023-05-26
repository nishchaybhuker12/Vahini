import 'package:app/screens/chatbot.dart';
import 'package:app/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../funtion.dart';

class VahiniHomeScreen extends StatefulWidget {
  const VahiniHomeScreen({Key? key}) : super(key: key);

  @override
  State<VahiniHomeScreen> createState() => _VahiniHomeScreenState();
}

class _VahiniHomeScreenState extends State<VahiniHomeScreen> {
  final audioPlayer = AudioPlayer();
  bool _isLoading = false;
void  callLoading()
  {
    setState(() {
      _isLoading = true;
    });
  }

  void  disconnectLoading()
  {
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void dispose(){
    // audioPlayer.dispose();
    print('**********disposed');
    VoiceController().stop(audioPlayer);
    // audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    VoiceController()
        .speak('Hello i am vaahini ,I am here to help you', audioPlayer);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xff2E3B7A),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/Bob-Logo-Orange.png'),
                      const Spacer(),
                    ],
                  ),
                  const Divider(
                    color: Color(0xffCBCBCB),
                    thickness: .8,
                  ),
                  LottieBuilder.asset('assets/lottie/Final2Character.json',
                      frameRate: FrameRate(10)),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    'Hi, I am Vahini',
                    style: TextStyle(
                      fontFamily: 'OutFit-SemiBold',
                      fontSize: 30,
                      color: mainBlue,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    'Your Personal Virtual Assistant of the Bank of Baroda App.Please tap on the Get Started button so that I can help you make your experience better with our app.',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                        fontFamily: 'Outfit-Regular',
                        color: mainBlue,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * .06,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatBot(),
                          ),);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: size.width * .4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: mainOrange),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OutFit-Bold',
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if(_isLoading)animation(size)
          ],
        ),
      ),
    );
  }
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