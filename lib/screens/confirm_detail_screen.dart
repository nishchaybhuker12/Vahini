import 'package:app/widget/headingText.dart';
import 'package:app/widget/popup.dart';
import 'package:app/widget/transfer_screens_head.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../funtion.dart';
import '../theme.dart';

class ConfirmDetailScreen extends StatefulWidget {
  const ConfirmDetailScreen(
      {Key? key,
      required this.remarks,
      required this.ifscCode,
      required this.account,
      required this.accountNo,
      required this.confirmAccountNo})
      : super(key: key);
  final TextEditingController accountNo;
  final TextEditingController confirmAccountNo;
  final TextEditingController account;
  final TextEditingController ifscCode;
  final TextEditingController remarks;
  @override
  State<ConfirmDetailScreen> createState() => _ConfirmDetailScreenState();
}

class _ConfirmDetailScreenState extends State<ConfirmDetailScreen> {
  bool visible1 = true;
  bool visible2 = false;
  bool edit = false;
  final audioPlayer = AudioPlayer();

  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  void initState() {
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    if (vahini) {
      VoiceController()
          .speak('Please! check your payment details', audioPlayer);
    }
    super.initState();
  }

  @override
  void clear() {
    Navigator.pop(context);
  }

  Widget getOverlay1(Size size, context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcOut),
      child: GestureDetector(
        onTap: () {
          VoiceController().speak(
              'Now tap on the confirm button to proceed and edit button to do changes',
              audioPlayer);
          setState(() {
            visible1 = !visible1;
            visible2 = !visible2;
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(right: 4, bottom: 4),
                  height: size.height * .55,
                  width: size.width * .95,
                  decoration: BoxDecoration(
                    color: Colors
                        .black, // Color does not matter but should not be transparent
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getOverlay2(Size size, context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcOut),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: size.height * .11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          visible2=false;
                          edit=!edit;
                        });
                      },
                      child: Container(
                        height: size.height * .07,
                        width: size.width * .4,
                        decoration: BoxDecoration(
                          color: Colors
                              .black, // Color does not matter but should not be transparent
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            visible2 = !visible2;
                          },
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => PopUp(
                            clear: clear,
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * .07,
                        width: size.width * .4,
                        decoration: BoxDecoration(
                          color: Colors
                              .black, // Color does not matter but should not be transparent
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TransferScreensHead(),
                    const Divider(
                      color: Color(0xffCBCBCB),
                      thickness: .8,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Row(
                      children: [
                        HeadingText(text: 'Please confirm the \npayment'),
                        const Spacer()
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextField(
                      enabled: edit,
                      controller: widget.accountNo,
                      decoration: InputDecoration(
                          hintText: 'Enter Account Number',
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextField(
                      enabled: edit,
                      controller: widget.confirmAccountNo,
                      decoration: InputDecoration(
                          hintText: 'Confirm Account Number',
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextField(
                      enabled: edit,
                      controller: widget.ifscCode,
                      decoration: InputDecoration(
                          hintText: 'IFSC Number',
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextField(
                      enabled: edit,
                      controller: widget.account,
                      decoration: InputDecoration(
                          hintText: 'Account',
                          fillColor: Color(0xffF5F5F5),
                          filled: true,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      height: size.height * .2,
                      color: const Color(0xffF5F5F5),
                      child: TextField(
                        enabled: edit,
                        controller: widget.remarks,
                        decoration: InputDecoration(
                            hintText: 'Remarks',
                            fillColor: Color(0xffF5F5F5),
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              edit = !edit;
                              visible2=false;
                            });
                          },
                          child: Container(
                            width: size.width * .3,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: mainBlue)),
                            child: Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: mainBlue,
                                    fontFamily: 'OutFit-SemiBold'),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => PopUp(
                                      clear: clear,
                                    ),);
                          },
                          child: Container(
                            width: size.width * .3,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: mainOrange,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                                child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OutFit-SemiBold'),
                            ),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(visible: visible2&&vahini, child: getOverlay2(size, context)),
          Visibility(
            visible: visible1 && vahini,
            child: getOverlay1(size, context),
          ),
        ],
      ),
    );
  }
}
