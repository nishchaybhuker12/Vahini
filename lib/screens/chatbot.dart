import 'package:app/main_home_screen.dart';
import 'package:app/screens/voice_assistant_screen.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../funtion.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme.dart';

String txttext = "";

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final audioPlayer = AudioPlayer();
  bool isVahiniTyping = false;
  // Future<void> startPlaying() async {
  //   audioPlayer.open(
  //     Audio.network('https://the-news-nation.herokuapp.com/Voice.mp3'),
  //     autoStart: true,
  //     showNotification: true,
  //   );
  // }

  final messageInsert = TextEditingController();

  List<Map> messsages = [];
  @override
  void initState() {
    audioPlayer.onPlayerComplete.listen((event) {
      if (txttext == "All Right! Sir, Please follow My instruction") {
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Vahini',
              style: TextStyle(fontFamily: 'Outfit-Bold', color: mainBlue),
            ),
            const Text(
              'Online',
              style: TextStyle(
                  color: Color(0xff0F9D58),
                  fontFamily: 'Outfit-Medium',
                  fontSize: 12),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 24),
        child: Column(
          children: <Widget>[
            const Divider(
              height: 2,
              color: Color(0xffCBCBCB),
              thickness: .8,
            ),
            Flexible(
              child: Column(
                children: [
                  Spacer(),
                  ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                      messsages[index]["message"].toString(),
                      messsages[index]["data"],
                    ),
                  ),
                  Visibility(
                    visible: isVahiniTyping,
                    child: InkWell(
                      onTap: (){
                        print("Tapped");
                      },
                      child: Row(
                        children: [
                          LottieBuilder.asset('assets/lottie/Chat-Loading-State-Animation.json',height: 80),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xffCBCBCB),
              thickness: .8,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      controller: messageInsert,
                      decoration: const InputDecoration(
                          hintText: 'Type your query here..',
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 30.0,
                          color: mainOrange,
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            FocusScope.of(context).unfocus();
                            return;
                          }

                          FocusScope.of(context).unfocus();

                          var str = VoiceController()
                              .mlRequest(messageInsert.text)
                              .then((value) {
                            txttext = value;
                            setState(() {
                              isVahiniTyping = false;
                            });
                            print("**************$value");
                            messsages.insert(0, {"data": 0, "message": value});
                            VoiceController().speak(value, audioPlayer);
                            setState(() {});
                          });
                          if (messageInsert.text.isNotEmpty) {
                            setState(() {
                              isVahiniTyping = true;

                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                              messageInsert.text = '';
                            });
                          }
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VoiceAssistantScreen(),
                          ));
                    },
                    child: CircleAvatar(
                      backgroundColor: mainOrange,
                      child: const Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml
  Widget chat(String message, int data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Bubble(
          radius: const Radius.circular(8.0),
          color: data == 0 ? mainBlue : mainOrange,
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftTop : BubbleNip.rightTop,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                    child: Text(
                  message,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'Outfit-Regular'),
                ))
              ],
            ),
          )),
    );
  }
}
