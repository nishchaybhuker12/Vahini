import 'package:app/main_home_screen.dart';
import 'package:app/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'funtion.dart';

class RecordingFunction extends StatefulWidget {
  const RecordingFunction({Key? key}) : super(key: key);

  @override
  State<RecordingFunction> createState() => _RecordingFunctionState();
}

class _RecordingFunctionState extends State<RecordingFunction> {
  @override
  final audioPlayer = AudioPlayer();
String str = "";
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();


  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      str = _lastWords;

      print(_lastWords);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  str
                  // If listening is active show the recognized words
                  // _speechToText.isListening
                  //     ? '$_lastWords'
                  // // If listening isn't active but could be tell the user
                  // // how to start it, otherwise indicate that speech
                  // // recognition is not yet ready or not supported on
                  // // the target device
                  //     : _speechEnabled
                  //     ? 'Tap the microphone to start listening...'
                  //     : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        // If not yet listening for speech start, otherwise stop
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
