import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundAuth extends StatelessWidget {
  final Widget child;
  final String imageOne;
  final String imageTwo;
  double? top;
  double? bottom;
  double? right;
  double? left;

  BackgroundAuth(
      {Key? key,
      required this.child,
      required this.imageOne,
      this.top,
      this.bottom,
      this.right,
      this.left,
      required this.imageTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            child: Image.asset(
              imageOne,
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            child: Image.asset(
              imageTwo,
              width: size.width * 0.50,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
