import 'package:flutter/material.dart';
import 'package:shop_app/constant/image_root.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AppImageAssets.loginTopPhoto,
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImageAssets.loginDownPhoto,
              width: size.width * 0.50,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
