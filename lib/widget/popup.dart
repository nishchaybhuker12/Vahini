import 'package:app/screens/congrats_screen.dart';
import 'package:app/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../funtion.dart';

class PopUp extends StatefulWidget {
   PopUp({Key? key,required this.clear}) : super(key: key);
Function clear;
  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final audioPlayer=AudioPlayer();

  void initState() {
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    if(vahini){
      VoiceController()
          .speak('Please! Enter your Transaction Pin .Then Press to the proceed button', audioPlayer);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(vertical: size.height*0.35),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:mainOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text('Enter Transaction  PIN',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OutFit-SemiBold'
                ),),
              ),
            ),
            SizedBox(
              width: size.width * .6,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Transaction PIN ',
                    fillColor: Color(0xffF5F5F5),
                    filled: true,
                    border: InputBorder.none),
              ),
            ),
            InkWell(
              onTap: (){
                widget.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CongratsScreen(),));
              },
              child: Container(
                width: size.width * .3,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: mainOrange,
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OutFit-SemiBold'),
                  ),),
              ),
            ),
            SizedBox(height: size.height*.01,)
          ],
        ),
    );
  }
}
