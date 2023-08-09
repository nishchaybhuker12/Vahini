import 'package:app/screens/splash_screen.dart';
import 'package:app/voice_recording_function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async{
  // loadEssentails();
  var dio = Dio();

  var res1 =  await dio.get("https://vahiniapinew.azurewebsites.net/").then((value) async {

    var res2 = await dio.get("https://vaahinimlnewapi.azurewebsites.net/").then((value) {
      runApp(
        const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
          SplashScreen(),
        ),
      );

    });
  });

}

void loadEssentails()async {
  var dio = Dio();

   var res1 =  await dio.get("https://vahiniapinew.azurewebsites.net/");
  var res2 = dio.get("https://vaahinimlnewapi.azurewebsites.net/");

}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   SpeechToText speechToText = SpeechToText();
//   bool speechEnabled = false;
//   String lastWords = '';
//
//   @override
//   void initState() {
//     super.initState();
//     initSpeech();
//   }
//
//   /// This has to happen only once per app
//   void initSpeech() async {
//     speechEnabled = await speechToText.initialize();
//     setState(() {});
//   }
//
//   /// Each time to start a speech recognition session
//   void startListening() async {
//     await speechToText.listen(onResult: onSpeechResult);
//     setState(() {});
//   }
//
//   /// Manually stop the active speech recognition session
//   /// Note that there are also timeouts that each platform enforces
//   /// and the SpeechToText plugin supports setting timeouts on the
//   /// listen method.
//   void stopListening() async {
//     await speechToText.stop();
//     print(lastWords);
//     setState(() {});
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Speech Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 'Recognized words:',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   // If listening is active show the recognized words
//                   // speechToText.isListening
//                   lastWords.isNotEmpty
//                       ? '$lastWords'
//                   // If listening isn't active but could be tell the user
//                   // how to start it, otherwise indicate that speech
//                   // recognition is not yet ready or not supported on
//                   // the target device
//                       : speechEnabled
//                       ? 'Tap the microphone to start listening...'
//                       : 'Speech not available',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:
//         // If not yet listening for speech start, otherwise stop
//         speechToText.isNotListening ? startListening : stopListening,
//         tooltip: 'Listen',
//         child: Icon(speechToText.isNotListening ? Icons.mic_off : Icons.mic),
//       ),
//     );
//   }
// }
