import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../funtion.dart';
import '../main_home_screen.dart';
import '../theme.dart';
import '../widget/ripple_animation.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceAssistantScreen extends StatefulWidget {
  const VoiceAssistantScreen({Key? key}) : super(key: key);

  @override
  State<VoiceAssistantScreen> createState() => _VoiceAssistantScreenState();
}

class _VoiceAssistantScreenState extends State<VoiceAssistantScreen> {
  final audioPlayer = AudioPlayer();

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String mlResult = '';

  bool listenUser = false;
  bool speakVahini = false;
  bool repeateR = false;
  bool tapped = true;
  @override
  void initState() {
    super.initState();
    _initSpeech();
    var timer = Timer.periodic(Duration(seconds: 4), (Timer t) {
      if (_speechToText.isNotListening && tapped) {
        tapped = false;
        var str = VoiceController().mlRequest(_lastWords).then((value) {
          mlResult = value;

          setState(() {});
          VoiceController().speak(value, audioPlayer);
        });
      }
    });

    audioPlayer.onPlayerComplete.listen((event) {
      if (mlResult == "All Right! Sir, Please follow My instruction") {
        print("#########################");
        setState(() {
          vahini = !vahini;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainHomeScreen(),
          ),
        );
      }
      // VoiceController().stop();
    });
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    _startListening();
    setState(() {});
  }

  void _startListening() async {
    print('sttarted******************');
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        onSpeechResult(result).then(() {
          print("+++++++++===?");
        });
      },
    ).then((value) {
      print("^^^^^^^^$value");
    });
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    // var str = VoiceController()
    //     .mlRequest(_lastWords)
    //     .then((value) {
    //   mlResult = value;
    //
    //   setState(() {});
    //   VoiceController().speak(value, audioPlayer);});
  }

  onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      // _lastWords = result.;
      _lastWords = result.recognizedWords;
      print('${_lastWords}set*************');
    });
    // return _lastWords;
    // var str =
    // VoiceController()
    //     .mlRequest(_lastWords)
    //     .then((value) {
    //   mlResult = value;
    //
    //   setState(() {});
    //   // print("**************$value");
    //   // messsages.insert(0, {"data": 0, "message": value});
    //   VoiceController().speak(value, audioPlayer);});
    // print('$_lastWords');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // if(_speechToText.isNotListening)

    //   _stopListening();
    // if(_speechToText.isListening)print("9999999");
    // if(_speechToText.isNotListening)print("888888");
    // print(_speechToText.statusListener! );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: mainBlue,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: LottieBuilder.asset('assets/lottie/floatingVahini.json'),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    mlResult,
                    style: TextStyle(
                        fontFamily: 'Outfit-Regular',
                        color: mainBlue,
                        fontSize: 16),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    tapped = true;
                    listenUser = !listenUser;
                    repeateR = !repeateR;
                  });
                  _startListening();
                  // // listenUser?_startListening():_stopListening();
                  // _speechToText.isNotListening?_startListening():_stopListening();
                },
                child: Image.asset(
                  'assets/business man.png',
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(_lastWords
                      // _speechToText.isListening
                      //     ? '$_lastWords'
                      //     : _speechEnabled
                      //     ? 'Tap above to speak'
                      //     : 'Speech not available',
                      // listenUser
                      //     ? '$_lastWords'
                      //     : 'Tap above to speak',
                      // style: TextStyle(
                      //     fontFamily: 'Outfit-Regular',
                      //     color: mainBlue,
                      //     fontSize: 16
                      // ),
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
