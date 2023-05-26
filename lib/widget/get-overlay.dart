import 'package:flutter/material.dart';

Widget _getOverlay() {
  return ColorFiltered(
    colorFilter: ColorFilter.mode(
        Colors.black54,
        BlendMode.srcOut
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 4, bottom: 4),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black, // Color does not matter but should not be transparent
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}