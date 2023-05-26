import 'package:app/screens/vahini_home_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'screens/home_screen.dart';

class VoiceController {
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
  // AudioPlayer audioPlayer=AudioPlayer();
  void speak(String text, AudioPlayer audioPlayer) async {
    final dio = Dio();

    // await dio
    //     .get('https://voice-vahini.herokuapp.com/audio/${text}')
    //     .then((value) async {
    //   print("########Audio#######");
    //   await dio
    //       .get('https://voice-vahini.herokuapp.com/move')
    //       .then((value) {
    //     print("\n########Move#######");
    //     final url =
    //         UrlSource("https://voice-vahini.herokuapp.com/Voice.mp3");
    //     audioPlayer.play(url);
    //   });
    // });

  // _VahiniHomeScreenState().callLoading();
    await dio
        .get('https://vahiniapinew.azurewebsites.net/audio/${text}')
        .then((value) async {

      print("########Audio#######");

      final url = UrlSource("https://vahiniapinew.azurewebsites.net/Voice.mp3");
      // VahiniHomeScreenState().disconnectLoading();
      audioPlayer.play(url);
      print("Played");

      // await dio
      //     .get('https://voice-vahini.herokuapp.com/move')
      //     .then((value) {
      //   print("\n########Move#######");
      //   final url =
      //   UrlSource("https://voice-vahini.herokuapp.com/Voice.mp3");
      //   audioPlayer.play(url);
      // });
    });
  }

  void stop( AudioPlayer audioPlayer) async {
      audioPlayer.pause();
      print('********called');
    // await dio.get('https://voice-vahini.herokuapp.com/delete');
  }

  Future<String> mlRequest(String text) async {
    final dio = Dio();
    final result = await dio
        .get('https://vaahinimlnewapi.azurewebsites.net/ml/reply?question=${text}');
    print(result.data);
    // MLReply(reply: result.data.reply);
    String str = result.data['reply'];
    print(str);

    return str;
  }
}
