import 'package:flutter/material.dart';

Color mainOrange = const Color(0xffF15A29);
Color mainBlue = const Color(0xff2E3B7A);

const BoxShadow primaryShadow =
    BoxShadow(blurRadius: 2, color: Color(0x2F000000), spreadRadius: 0,
      offset: Offset(0,5)
    );


const BoxShadow containerShadow = BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 6,
    color: Color(0x2F000000),
);

final BoxDecoration containerDeco=BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    boxShadow: const [containerShadow],
    color: Colors.white);

bool vahini=false;



//Git test