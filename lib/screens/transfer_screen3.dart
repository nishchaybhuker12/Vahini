import 'package:app/screens/confirm_detail_screen.dart';
import 'package:app/widget/headingText.dart';
import 'package:app/widget/transfer_screens_head.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../funtion.dart';
import '../theme.dart';

class TransferScreen3 extends StatefulWidget {
  const TransferScreen3({Key? key}) : super(key: key);

  @override
  State<TransferScreen3> createState() => _TransferScreen3State();
}

class _TransferScreen3State extends State<TransferScreen3> {
  bool visible1 = true;
  bool visible2 = false;
  final audioPlayer = AudioPlayer();

  TextEditingController accountNumber = TextEditingController();
  TextEditingController confirmaccountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController account = TextEditingController();
  TextEditingController remarks = TextEditingController();

  bool validate() {
    if (accountNumber.text != "" &&
        confirmaccountNumber.text != "" &&
        ifscCode.text != "" &&
        account.text != "" &&
        remarks.text != "") {
      if(vahini){
        VoiceController().speak('Now tap on the proceed button', audioPlayer);
      }
      FocusScope.of(context).unfocus();
      return true;
    }

    return false;
  }

  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    if (vahini) {
      VoiceController()
          .speak('Please! fill these required fields', audioPlayer);
    }
    account.addListener(() {
      setState(() {
        visible2 = validate();
      });
    });
    accountNumber.addListener(() {
      setState(() {
        visible2 = validate();
      });
    });
    ifscCode.addListener(() {
      setState(() {
        visible2 = validate();
      });
    });
    remarks.addListener(() {
      setState(() {
        visible2 = validate();
      });
    });
    confirmaccountNumber.addListener(() {
      setState(() {
        visible2 = validate();
      });
    });

    super.initState();
  }

  Widget getOverlay1(Size size, context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black54, BlendMode.srcOut),
      child: GestureDetector(
        onTap: () {
          // VoiceController()
          //     .speak('Now tap on the proceed button', audioPlayer);
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
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmDetailScreen(
                  account: account,
                  accountNo: accountNumber,
                  confirmAccountNo: confirmaccountNumber,
                  ifscCode: ifscCode,
                  remarks: remarks),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: size.height * .11),
                  height: size.height * .07,
                  width: size.width * .4,
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
                        HeadingText(text: 'Transfer to\nAccount number'),
                        const Spacer()
                      ],
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextField(
                      enabled: true,
                      controller: accountNumber,
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
                      controller: confirmaccountNumber,
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
                      controller: ifscCode,
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
                      controller: account,
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
                        controller: remarks,
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
                    InkWell(
                      onTap: () {
                        if(validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmDetailScreen(
                                  account: account,
                                  accountNo: accountNumber,
                                  confirmAccountNo: confirmaccountNumber,
                                  ifscCode: ifscCode,
                                  remarks: remarks),
                            ),
                          );
                        }
                        else{
                          VoiceController().speak('Please fill the required fields', audioPlayer);
                        }
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
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(visible: visible2&&vahini, child: getOverlay2(size, context)),
          // Visibility(
          //   // visible: visible1 && vahini,
          //   visible: false,
          //   child: getOverlay1(size, context),
          // ),
        ],
      ),
    );
  }
}
