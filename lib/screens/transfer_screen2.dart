import 'package:app/funtion.dart';
import 'package:app/screens/transfer_screen3.dart';
import 'package:app/theme.dart';
import 'package:app/widget/headingText.dart';
import 'package:app/widget/top_nav_text.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../widget/transfer_screens_head.dart';

class TransferScreen2 extends StatefulWidget {
  const TransferScreen2({Key? key}) : super(key: key);

  @override
  State<TransferScreen2> createState() => _TransferScreen2State();
}

class _TransferScreen2State extends State<TransferScreen2> {
  final audioPlayer = AudioPlayer();
  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // audioPlayer.onPlayerStateChanged
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    if (vahini) {
      VoiceController()
          .speak('Please! tap on transfer to account button', audioPlayer);
    }
    super.initState();
  }

  Widget getOverlay(Size size, context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcOut),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TransferScreen3(),
              ));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 20, ),
                  height: 50,
                  width: size.width * .5,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(10) // Color does not mat
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 24),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TransferScreensHead(),
                  const Divider(
                    color: Color(0xffCBCBCB),
                    thickness: .8,
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  HeadingText(text: 'Within Bank'),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 20, bottom: 10),
                    decoration: containerDeco,
                    child: Column(
                      children: [
                        button(
                            'Self Linked Accounts',
                            Icons.supervisor_account_rounded,
                            context,
                            'navigate'),
                        button('Third Party within Bank',
                            Icons.account_tree_outlined, context, 'navigate'),
                        button('Sukanya Samriddhi Yojna Account', Icons.girl,
                            context, 'navigate'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  HeadingText(text: 'Other Bank'),
                  SizedBox(
                    height: size.height * .017,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 20, bottom: 10),
                    decoration: containerDeco,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TransferScreen3(),
                                ));
                          },
                          child: button('Transfer to Account',
                              Icons.table_rows_outlined, context, 'navigate'),
                        ),
                        button('Transfer to Mobile',
                            Icons.send_to_mobile_outlined, context, 'navigate'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(visible: vahini, child: getOverlay(size, context))
        ],
      ),
    );
  }

  Widget button(String text, IconData icon, context, String navigate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: mainOrange,
          ),
          const SizedBox(
            width: 5,
          ),
          TopNavText(text: text),
          const Spacer()
        ],
      ),
    );
  }
}
