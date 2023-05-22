import 'package:app/funtion.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/transfer_screen2.dart';
import 'package:app/screens/vahini_home_screen.dart';
import 'package:app/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'screens/UPI_screen.dart';
import 'screens/cards_screen.dart';
import 'screens/more_option_screen.dart';
import 'screens/qr_code_scanner_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int index = 0;
  final audioPlayer=AudioPlayer();
  @override
  void initState() {
    // audioPlayer.onPlayerComplete.listen((event) {
    //   VoiceController().stop();
    // });
    if(vahini){
      VoiceController().speak('Please! Tap on transfer button', audioPlayer);

    }
    // TODO: implement initState
    super.initState();
  }

  Widget throughScreen() {
    switch (index) {
      case 0:
        {
          return  HomeScreen();
        }
      case 1:
        {
          return const UPIScreen();
        }
      case 2:
        {
          return const CodeScanner();
        }
      case 3:
        {
          return const CardsScreen();
        }
      default:
        {
          return const MoreOptionScreen();
        }
    }
  }

  Widget getOverlay(Size size,context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.black54,
          BlendMode.srcOut
      ),
      child:GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TransferScreen2(),));
        },
        child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:  EdgeInsets.only(bottom: size.height*.19,left: size.width*.016),
                child: Container(
                  margin: const EdgeInsets.only(right: 4, bottom: 4),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue, // Color does not matter but should not be transparent
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
              child: throughScreen()),
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const VahiniHomeScreen(),));
            },
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, boxShadow: [primaryShadow]),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: LottieBuilder.asset(
                  'assets/lottie/floatingVahini.json',
                  repeat: true,
                ),
              ),
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.fixedCircle,
            activeColor: mainOrange,
            color: mainBlue,
            backgroundColor: Colors.white,
            initialActiveIndex: 0,
            onTap: (int i) {
              setState(() {
                index = i;
              });
            },
            items: const [
              TabItem(
                icon: Icons.home_filled,
                title: 'Home',
              ),
              TabItem(icon: Icons.square_foot, title: 'UPI'),
              TabItem(
                icon: Icons.qr_code_scanner_sharp,
              ),
              TabItem(icon: Icons.credit_card, title: 'Cards'),
              TabItem(icon: Icons.more_horiz_rounded, title: 'More'),
            ],
          ),
        ),
        Visibility(
          visible: vahini,
            child: getOverlay(size,context))
      ],
    );
  }
}
